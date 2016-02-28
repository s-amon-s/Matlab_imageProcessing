function Myrotate(degree)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
woman = imread('lena_color_256.tif');

[x y z] = size(woman);
 
scaled_image = zeros(x,y,z);


for count1 = 1:x
 for count2 = 1:y
       scaled_image(x,y,:) = woman((x.*cos(degree)+y.*sin(degree)),-(x.*cos(degree)+y.*sin(degree)));
 end
end
plotIt(uint8(scaled_image),text,2);
end

function plotIt(image,text,n)
    subplot(1,2,n);
    imshow(image,[]);
    title(text);
%     truesize;
end
