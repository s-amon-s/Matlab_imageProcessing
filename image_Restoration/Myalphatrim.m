function Myalphatrim() % SPATIAL DOMAIN 2D (NON-LINEAR filter)

%#########################################################################%
% This program is to filter salt&pepper and gussian noise affected images
% using 5?5 Alpha-trimmed mean filter with the image zero padded
%#########################################################################%

%% Read Noise images
% cast them to double type for computation
saltPepper_noise = double(imread('circuit-board-saltpep.tif'));
gauss_noise = double(imread('circuit-board-gauss.tif')); 

%% Get the image sizes
[x,y] = size(saltPepper_noise);
[x1,y1] = size(gauss_noise);

%% Add 1x1 zero padding
% results in increment of 2 rows and 2 columns
padded_saltPepper = padarray(saltPepper_noise,[1 1]);
padded_gauss = padarray(gauss_noise,[1 1]);

d = 2;
%% Alpha trim mean Filtering
for i=3:x
    for j=3:y
        sub_image1 = padded_saltPepper(i-2:i+2,j-2:j+2);
        sub_image2 = padded_gauss(i-2:i+2,j-2:j+2);
        filtered_saltPepper(i-2,j-2)=(1./((x.*y)-d)).*(sum(sub_image1(:)));
        filtered_gauss(i-2,j-2)=(1./((x1.*y1)-d)).*(sum(sub_image2(:)));
    end
end

%% Display the result of harmonic filter
figure('units','normalized','outerposition',[0 0 1 1]);
input = {saltPepper_noise,gauss_noise};
output = {filtered_saltPepper,filtered_gauss};
titles = {varname(saltPepper_noise),varname(gauss_noise),varname(filtered_saltPepper),varname(filtered_gauss)};

for i=1:2
    subplot(2,2,i); imshow(input{i},[]);   title(sprintf('Input image(%s)',titles{i}));
    subplot(2,2,i+2); imshow(output{i},[]); title(sprintf('Output image(%s)',titles{i+2}));
end

end
function out = varname(var)
  out = inputname(1);
end