function output = Mypow(in_image,c,grammar)
original = imread(in_image);
image = im2double(original);
image = c*(image.^grammar);

output = image;

figure()
subplot(1,2,1);
imshow(original);
title('input');
subplot(1,2,2);
imshow(image);
title('output');
end