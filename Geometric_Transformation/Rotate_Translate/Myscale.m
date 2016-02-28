function Myscale(Qx,Qy )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

woman = imread('lena_color_256.tif');

[x y z] = size(woman);

% if Qx>1
%     Qx = 1;  
% end
% 
% if Qy>1
%     Qy=1;
% end

scale_x = round(x.*(1./Qx));
scale_y = round(y.*(1./Qy));

disp([Qx,Qy,scale_x,scale_y]);

scaled_image = zeros(x,y,z);

scaled_image(count1+1,count2+1) = woman(1+round(count1./x_scale),1+round(count2./y_scale));

scaled_image(1:scale_x, 1:scale_y,:) = woman(1:x, 1:y,:);

% 
% imwrite(scaled_image/256,strcat('output_',num2str(Qx),'x',num2str(Qy),'.jpg'));

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
