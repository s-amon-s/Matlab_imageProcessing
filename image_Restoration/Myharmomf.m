function Myharmomf() % SPATIAL DOMAIN 2D (LINEAR filter)

%#########################################################################%
% This program is to filter salt,pepper and gussian noise affected images
% using 3?3 Harmonic mean filter with the image reflect padded
%#########################################################################%

%% Read Noise images
% cast them to double type for computation
salt_noise = double(imread('circuit-board-salt.tif'));
pepper_noise = double(imread('circuit-board-pepper.tif')); 
gauss_noise = double(imread('circuit-board-gauss.tif')); 

%% Get the image size
[x,y]=size(salt_noise); % NOTE: the sizes of all the 3 images are same

%% Add 1x1 reflect padding
% results in increment of 2 rows and 2 columns
reflected_salt = padarray(salt_noise,[1 1],'symmetric');
reflected_pepper = padarray(pepper_noise,[1 1],'symmetric');
reflected_gauss = padarray(gauss_noise,[1 1],'symmetric');

%mn is the total number of pixels in the image, here common for all
        mn = x.*y;
%%Harmonic mean filter
for i=2:x+1
    for j=2:y+1
        
       %Gst is the sub-image, here 3x3, neighbourhood processing**
        Gst_salt = reflected_salt(i-1:i+1,j-1:j+1);
        Gst_pepper = reflected_pepper(i-1:i+1,j-1:j+1);
        Gst_gauss = reflected_gauss(i-1:i+1,j-1:j+1);
        
        %filtered is the final filtered pixel cuurently i,j is at
        filtered_salt(i,j)=  mn./(sum(1./Gst_salt(:)));
        filtered_pepper(i,j)= mn./(sum(1./Gst_pepper(:)));
        filtered_gauss(i,j)= mn./(sum(1./Gst_gauss(:)));
        
    end
end

%% Display the result of harmonic filter
figure('units','normalized','outerposition',[0 0 1 1]);
input = {salt_noise,pepper_noise,gauss_noise};
output = {filtered_salt,filtered_pepper,filtered_gauss};
titles = {varname(salt_noise),varname(pepper_noise),varname(gauss_noise),varname(filtered_salt),varname(filtered_pepper),varname(filtered_gauss)};

for i=1:3
    subplot(2,3,i); imshow(input{i},[]);   title(sprintf('Input image(%s)',titles{i}));
    subplot(2,3,i+3); imshow(output{i},[]); title(sprintf('Output image(%s)',titles{i+3}));
end
end

%% Get the string of the variable name
function out = varname(var)
  out = inputname(1);
end
