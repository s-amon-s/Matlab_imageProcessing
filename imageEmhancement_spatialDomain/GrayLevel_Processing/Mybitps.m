function output = Mybitps(maxbit)
original = imread('100-dollars.tif');
image = original;
a = bitget(image,8);
b = bitget(image,7);
c = bitget(image,6);
image = a+b+c;
%image = bitset(image,8:-1:1,bitget(image,8:-1:1));

output = image;

figure()
subplot(1,2,1);
imshow(original);
title('input');
subplot(1,2,2);
imshow(image,[]);
title('output');
end