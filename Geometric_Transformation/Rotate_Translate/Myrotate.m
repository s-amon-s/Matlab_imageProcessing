function Myrotate(degree)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
woman = imread('lena_color_256.tif');

[y x z] = size(woman);

degree = degree.*(pi/180);

scaled_image = zeros(y,x,z);


for count1 = 1:y
 for count2 = 1:x
     new_col = round((count2.*cos(degree)+count1.*sin(degree)));
     new_row = round((count1.*cos(degree)-count2.*sin(degree)));
     
     if new_row >= 1 && new_row <= x && new_col >=1 && new_col <=y
         
            scaled_image(count1,count2,:) = woman(new_row,new_col,:);
     else
            scaled_image(count1,count2,:) = 255;
     end
 end
end

text = 'amon';
imshow(uint8(scaled_image));
% plotIt(uint8(scaled_image),text,2);
end

function plotIt(image,text,n)
    subplot(1,2,n);
    imshow(image,[]);
    title(text);
%     truesize;
end
