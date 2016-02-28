gradient laplace:
first derivating and second derivative code
used for image sharpening and edge detection

grayLevel_Processing:

Histogram Equalization

log transformation 
s = log(1 + r) [useful when the input grey level values may
have an extremely large range of values.]

Power law
s = cr

bit plane slicing
contrast stretching
y - y1 = (y2 - y1)/x2-x1 . (x - x1)
for interval [28 <-> 75], y - 28 = 255 -28/75-28(x-28)
s = {(227 ∗ x − 5040 )⁄47 , if 28 ≤ r ≤ 75
			r,  otherwise

negative transformation
255 - L -1

image smoothing:
median filter
average filter