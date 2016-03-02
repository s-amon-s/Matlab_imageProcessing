function Add(erosion, dilate )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
wire1 = imread('equipment.bmp');
subplot(2,2,1);
imshow(wire1);

subplot(2,2,2);
imshow(dilate);

subplot(2,2,3);
imshow(erosion);

add = erosion + dilate;
subplot(2,2,4);
imshow(add);

end

