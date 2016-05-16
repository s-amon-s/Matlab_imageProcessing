Frequncy domain, spectrum analyser (plot Ampliture/Frequency). Allow to see harmonic


This directory contains 2 parts -----
			  ___________|___________
			 |                       |
			\ /                     \ /
                Understanding(Lecture)   Coding(Matlab)


**Lecture Guide	:
For image processing we use a variant of fourier transform, DFT--<discrete fourier transform>--
DFT, sampled fourier transform, i.e, does not have all the frequencies which forms the image, but only
ones which are large enough to define pixels from the spatial domain range.

Transformation :  2x(N one dimensional Fourier Transforms). column and row

In spatial domain, we use convolution

In fourier, we use multiplication witht the filter
fourier domain gives better performance, decrese the number of computations

F(0,0) gives the DC component of the image which is the average brightness of the image
F(N-1,M-1) for an N*M images gives the highest frequency
	Since images are real numbers(not complex).
           FT images are symmetric around origin

Cos is the real part
Sin is the imaginary part

F(u,v). the ratio U/V determines the Direction
	the size of u,v determines the Frequency
	U=0, horizontal
	V=0,infinity, Vertical

Whereever there are edges, a perpendicular white line is created.
centre tells the average intensity of the image.
High frequencies in the vertical direction will cause bright dots away from the centre in vertical direction
High frequencies in the horizontal direction will cause bright dots away from the centre in horizontal direction


Edge Effect: FT always treats an image as if it were part of a periodically replicated array of identical images extending
	     horizontally and vertically to infinity

	    Solution: Windowing the image


**Coding guide : (Matlab used)


fft and ifft work on vectors
fft2 and ifft2 work on matrices
ffshift, to shift to centre the F(0,0) for display

Preprocessing:
We need to use zero-padding and apply it before we use discrete fourier transform on original images
For MxN, paddarray(image,[2M 2N]);
place it in the left corner

Fourier Transform:
discrete fourier transform on the padded image

shift bits of the image, its actually shifting the windows. [Interested section] 

Filter Function:
    Smoothing or Blurring is achieved in the frequency domain by dropping out the high frequency components.

Spatial Domain___________________________Frequency Domain
|                                        |
|-> In spatial domain, 			 |-> In frequency domain,
    filtering is defined 		     filtering is the multiplication
    as the spatial convolution		     of a filter function and the Fourier 
    between an image and                     transform of theinput image.
    a filter mask




lowPass filter to find noise smooth (blur), attenuates high frequency 
Ideal  --> (ringing effect)
Butterworth --> apply for wide-pass filter, no ringing effect. As n gets higher ripples are more prominent
Guassian -->   apply for narrow-pass filter, no ringing effect
highPass filter to find  (butterworth provide better result) sharp (edge) 

in butterworth 




