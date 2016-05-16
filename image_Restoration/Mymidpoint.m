function Mymidpoint()
%#########################################################################%
% This program is to filter salt noise affected image
% using 3x3 Mid-point filter with the image zero padded
%#########################################################################%

%% Read Noise images
% cast them to double type for computation
gauss_noise = double(imread('circuit-board-salt.tif'));

%% Get the image sizes
[x,y] = size(gauss_noise);

%% Add 1x1 zero padding
% results in increment of 2 rows and 2 columns
padded_image = padarray(gauss_noise,[1 1]);

%% Min filter
for i=2:x+1
    for j=2:y+1
        sub_image = padded_image(i-1:i+1,j-1:j+1);
        filtered_image(i-1,j-1) = (min(sub_image(:))+max(sub_image(:)))./2;
    end
end

subplot(1,2,1);
imshow(gauss_noise,[]);
title('Input Image(Guassian noise)');
subplot(1,2,2);
imshow(filtered_image,[]);
title('Output Image(Guassian noise)');
end