function output = Myneg()
original = imread('breast_digital_Xray.tif');
image = original;

image = 255-image;

output = image;

figure()
subplot(1,2,1);
imshow(original);
title('input');
subplot(1,2,2);
imshow(image);
title('output');
end