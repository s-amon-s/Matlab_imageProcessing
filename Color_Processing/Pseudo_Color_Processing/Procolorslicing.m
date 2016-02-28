function Procolorslicing()
[MRI,map] = imread('MRI.bmp');
image  = ind2gray(MRI,map);
image3 = ind2rgb(MRI,map);

for i = 1 : size(image,1)
    for j = 1 : size(image,2)
        if image(i,j)<31
            image3(i,j,1:2) = 0;
            image3(i,j,3) = 255;
        elseif image(i,j)>99 && image(i,j)<141
            image3(i,j,1:2) = 255;
            image3(i,j,3) = 0;
        end        
    end
end

subplot(1,2,1);
imshow(MRI);
title('Original Image');

subplot(1,2,2);
imshow(image3);
title('Output Image');

end
