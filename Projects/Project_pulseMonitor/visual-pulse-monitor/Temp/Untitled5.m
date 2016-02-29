% Test face detection code
close all;
clear;
clc;

A = imread ('lena.jpg', 'JPG');
Img = double (rgb2gray(A));
Face = FaceDetect('haarcascade_frontalface_alt2.xml',Img);
Rectangle = [Face(1) Face(2); Face(1)+Face(3) Face(2); Face(1)+Face(3) Face(2)+Face(4); Face(1)  Face(2)+Face(4); Face(1) Face(2)];

figure(1);
imshow (A);
truesize;
hold on;
plot (Rectangle(:,1), Rectangle(:,2), 'g');
hold off;

