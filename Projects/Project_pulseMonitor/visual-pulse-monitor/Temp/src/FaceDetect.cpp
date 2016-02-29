/************************************************************************
 * Implements the necessary interface with OpenCV face detection procedure
 * so that the face detection program can be called as a built-in function
 * from Matlab. 
 * Inputs: 1. Location of the XML file that contains the Haar cascade
 *         2. Image in which face needs to be located (Gray image only) 
 * Outputs: NxM matrix
 *          N is the number of faces
 *          M = 4; 1: X location of face
 *                 2: Y location of face
 *                 3: Width of face
 *                 4: Height of face
 * The program does error checking on 
 *               1. number of inputs passed
 *               2. Image is gray and double
 *           
 * Author: Sreekar Krishna
 *         sreekar.krishna@asu.edu 
 * Version 1.0 
 *         Created: May 13 2008
 *************************************************************************/

#include "mex.h" // Required for the use of MEX files

// Required for OpenCV 
#include "cv.h" 

static CvMemStorage* storage = 0;
static CvHaarClassifierCascade* cascade = 0;

/** This is a the only prototype function that you need to get a mex file to work. */
void mexFunction(int output_size, mxArray *output[], int input_size, const mxArray *input[])
{
    char *input_buf;
    int buflen;
    mxArray *xData; 
    double *xValues;
    int i,j;
    int NoOfCols, NoOfRows;
    
    /* check for proper number of arguments */
    if(input_size!=2) 
      mexErrMsgTxt("Usage: FaceDetect (<HaarCascade File>, <GrayImage>)");

    /* input must be a string */
    if ( mxIsChar(input[0]) != 1)
      mexErrMsgTxt("Input 1 must be a string.");

    /* get the length of the input string */
    buflen = (mxGetM(input[0]) * mxGetN(input[0])) + 1;

    /* copy the string data from input[0] into a C string input_ buf.    */
    input_buf = mxArrayToString(input[0]);
    
    if(input_buf == NULL) 
      mexErrMsgTxt("Could not read HarrCascade Filename to string.");
    
    // Read the Haar Cascade from the XML file 
    cascade = (CvHaarClassifierCascade*) cvLoad( input_buf, 0, 0, 0);
        
    if( !cascade )
    {
       mexErrMsgTxt("ERROR: Could not load classifier cascade" );
    }

    /* Check if the input image is in double format*/
    if (!(mxIsDouble(input[1]))) {
      mexErrMsgTxt("Input image must be gray scale and of type double");
    }
    
    //Copy input pointer 
    // This carries the input grayscale image that was sent from Matlab
    xData = (mxArray *)input[1];

    //Get the matrix from the input data
    // The matrix is rasterized in a column wise read
    xValues =  mxGetPr(xData);
    NoOfCols = mxGetN(xData); // Gives the number of Columns in the image
    NoOfRows = mxGetM(xData); // Gives the number of Rows in the image
    
    /* Get the number of dimensions in the input Image */
    int number_of_dims = mxGetNumberOfDimensions(input[1]);
    if (number_of_dims > 2)
        mexErrMsgTxt("Input image should be gray scale and of type double");
    
    // Create an IplImage from the data so face detection can be run on it
    IplImage* gray = cvCreateImage( cvSize(NoOfCols, NoOfRows), IPL_DEPTH_8U, 1 );
    
    // Load the column wise vector into the IplImage
    // IplImage data is read in a rowwise manner
    // Appropriate conversion is carried out here
    for(i=0;i<NoOfCols;i++)
       for(j=0;j<NoOfRows;j++)
        {
            int value = xValues[(i*NoOfRows)+j];
            gray->imageData[j*NoOfCols+i] = value;
        }
     
    /**********************************************************************
     * There is a bug in OpenCV that if one calls the cvLoad function before calling
     * any other function from the cxCore lib, an error is thrown by the 
     * cvRead function that is part of cvLoad. In order to overcome this
     * any function from the cxcore lib needs to be called. Here we create 
     * a dummy image 11x11 pixels in size and erode the image using a small
     * kernel.
     ***********************************************************************/    
    IplImage* dummy = cvCreateImage( cvSize(11, 11), IPL_DEPTH_8U, 1 ); // Make a dummy image
    IplConvKernel* se = cvCreateStructuringElementEx(3,3,1,1,CV_SHAPE_ELLIPSE); // Create a filter
    cvErode(dummy,dummy,se); // Erode
    cvReleaseImage( &dummy );
   
   
    /*******************************************************************
     *                              Detect faces                        *
     ********************************************************************/
    
    // Histogram Equalize the image
    cvEqualizeHist( gray, gray);
        
    // This is required in the face detection process
    storage = cvCreateMemStorage(0);
    cvClearMemStorage( storage );

    // Do Face Detection
    CvSeq* faces = cvHaarDetectObjects( gray, cascade, storage,
                                            1.1, 2, 0/*CV_HAAR_DO_CANNY_PRUNING*/,
                                            cvSize(30, 30) );
    
    // Allocate output variable
    // Number of rows = number of detected faces
    // Number of columns = 4
    // 1: Location X of the face
    // 2: Location Y of the face
    // 3: Width of the face
    // 4: Height of the face
    double *Data;
    if (faces->total)
    {
        output[0] = mxCreateDoubleMatrix(faces->total, 4, mxREAL);
        Data = mxGetPr(output[0]); // Get the pointer to output variable
        // Iterate trou each of the detected faces
        for( i = 0; i < faces->total; i++ )
        {
            CvRect* r = (CvRect*)cvGetSeqElem( faces, i );
           /* The Data pointer again has to be filled in a column wise manner
            * The first column will contain the x location of all faces
            * while column two will contain y location of all faces */
           Data [i] = r->x;
           Data [i+faces->total] = r->y;
           Data [i+faces->total*2] = r->width;
           Data [i+faces->total*3] = r->height;
           // Debug
           // printf ("%d %d %d %d\n", r->x, r->y, r->width, r->height); 
        }
    }
    else
    {
        output[0] = mxCreateDoubleMatrix(1, 1, mxREAL);
        Data = mxGetPr(output[0]); // Get the pointer to output variable
        Data[0] = -1;
    }
       
    // Release all the memory
    cvReleaseImage( &gray );
    return;
}

