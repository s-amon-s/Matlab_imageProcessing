function im = Myclosing(image)
openImage=image;
dilateImage=Mydilate(image);
openImage=Myerosion(dilateImage);
subplot(2,2,1)
imshow(image)
title('Input Image');
subplot(2,2,2)
imshow(dilateImage)
title('Dilated Image');
subplot(2,2,3)
imshow(openImage)
title('Closed Image');
im=openImage;
end