function Mytranslate(Qx,Qy )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
woman = imread('lena_color_256.tif');

[x y z] = size(woman);
 
scaled_image = zeros(x,y,z);

scaled_image(1+Qx:x, 1+Qy:y,:) = woman(1:x-Qx, 1:y-Qy,:);

imwrite(scaled_image/256,strcat('output_',num2str(Qx),'x',num2str(Qy),'.jpg'));

text = strcat('Original Image: ',num2str(x),'x',num2str(y));  
plotIt(woman,text,1);

text = strcat('Translated image: ',num2str(Qx),'x',num2str(Qy));  
plotIt(uint8(scaled_image),text,2);
end

function plotIt(image,text,n)
    subplot(1,2,n);
    imshow(image,[]);
    title(text);
%     truesize;
end
