								Thresholding
    _________________________________________________________________|______________________________________________________________
   |																    |
Global Thresholding:												               Local Thresholding:
	|	   |----> setting threshold T in histogram to segment the "object" from "background."			{  devide image into sub-images       }
        |_______													{  and utilize a different threshold  }
  ______________|______________________											{  to segment each sub-image          }
 |				      |
 |-->global single thresholding       |-->global multiple thresholding


Assumption:
	|----> the range of intensity levels covered by objects of interest is different from the background.



Problem :
 |-----> How to find a good threshold level :
 |
 |		AUTOMATIC GLOBAL THRESHOLDING  [better than manual thresholding and more applicable in real life situations]
 |
 |		Global thresholding algorithm :
 |			1) Set initial value of T0, segment  image to two regions.
 |			2) mue1 = Average( p(x,y) | p(x,y) > T ) 
 |			3) mue2 = Average( p(x,y) | p(x,y) <= T ) 
 |			4) T = (mue1 + mue2)/2
 |			5) Repeat step 2 through 4 until the diference in T is smaller than a predefined To
 |
 |-----> Noise  SOLUTION --< use local thresholding >
 |
 |
 |
 |-----> Illumination and reflection  SOLUTION --< use LOCAL thresholding >

