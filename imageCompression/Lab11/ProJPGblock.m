function ProJPGblock(QF)
if ~exist('QF','var')
    QF = 80;
end
Tq = MySQ(80);
image = double(imread('lena_gray_256.tif'));
image = image(1:8,1:8);
% alpha u = 1/row
% alpha v = 1/column
image = image - 128;
dct_Image = DCT(image);
out = round(dct_Image./Tq);
imshow(out,[])
end