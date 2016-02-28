function [y,cb,cr] = Myrgb2ycbcr()

Irgb = im2double(imread('flowers.tif'));
r = Irgb(:,:,1);
g = Irgb(:,:,2);
b = Irgb(:,:,3);

y = 0.299.*r + 0.587.*g + 0.114.*b;
cb = 0.564.*(b-y) + 0.5;
cr = 0.713.*(r-y) + 0.5;

subplot(2,2,1);
imshow(cat(3,y,cb,cr));
title('YCbCr');

subplot(2,2,1);
imshow(cat(3,y,cb,cr));
title('YCbCr');

subplot(2,2,2);
imshow(y.*255,[]);
title('Y');

subplot(2,2,3);
imshow(cb.*255,[]);
title('Cb');

subplot(2,2,4);
imshow(cr.*255,[]);
title('Cr');

end

