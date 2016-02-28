function im = Myopening(image)
openImage=image;
erodeImage=Myerosion(image);
openImage=Mydilate(erodeImage);
subplot(2,2,1)
imshow(image)
title('Input Image');
subplot(2,2,2)
imshow(erodeImage)
title('Eroded Image');
subplot(2,2,3)
imshow(openImage)
title('Opened Image');
im=openImage;
end