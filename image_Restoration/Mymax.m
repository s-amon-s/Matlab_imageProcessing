function Mymax()
%#########################################################################%
% This program is to filter pepper noise affected image
% using 3?3 Max filter with the image zero padded
%#########################################################################%

%% Read Noise images
% cast them to double type for computation
pepper_noise = double(imread('circuit-board-pepper.tif'));

%% Get the image sizes
[x,y] = size(pepper_noise);

%% Add 1x1 zero padding
% results in increment of 2 rows and 2 columns
padded_image = padarray(pepper_noise,[1 1]);

%% Max filter
for i=2:x+1
    for j=2:y+1
        sub_image = padded_image(i-1:i+1,j-1:j+1);
        filtered_image(i-1,j-1) = max(sub_image(:));
    end
end

subplot(1,2,1)
imshow(pepper_noise,[]);
title('Input Image(Pepper noise)');
subplot(1,2,2);
imshow(filtered_image,[]);
title('Output Image(Pepper noise)');

end