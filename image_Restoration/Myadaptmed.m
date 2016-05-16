function Myadaptmed(Smax,Pa,Pb) % can supply the max value here
%#########################################################################%
% This program is to filter salt&pepper  affected images
% using 3x3 Adaptive median filter with the image reflect padded
%#########################################################################%

%% Read Noise images
% cast them to double type for computation
saltPep_noise = double(imread('circuit-board-saltpep_025.tif'));

%% Get the image size
[x,y] = size(saltPep_noise); % NOTE: the sizes of all the 3 images are same

%% Add X/2xY/2 reflect padding
% More flexible by using Smax
% Declare max
if ~exist('max','var') && ~exist('Pa','var') && ~exist('Pb','var')
    Smax = 7;
    Pa = 0.25;
    Pb = 0.25;
end

pad = floor(Smax/2);
padded_image = padarray(saltPep_noise,[pad pad]);

for i = pad+1 : x + pad
    
    for j = pad+1 : y + pad
        
         for cur_pad = 1 : pad
             
            sub_image = padded_image(i-cur_pad:i+cur_pad,j-cur_pad:j+cur_pad);
            sorted = sort(sub_image);

            Zmedian = sorted(cur_pad+1,cur_pad+1);
            Zmin = min(sub_image(:));
            Zmax = max(sub_image(:));
            
            A1 = Zmedian - Zmin;
            A2 = Zmedian - Zmax;
            
            if A1>0 && A2<0
                Zxy = padded_image(i,j); 
                B1 = Zxy - Zmin;
                B2 = Zxy - Zmax;
               
                if B1>0 && B2<0 %Determine if Zxy is an impulse
                    temp = padded_image(i,j); %It is not impulse,thus,preserve the original detail
                    break;  
                else
                    temp = Zmedian;  %It is impulse,thus,remove the impulse
                    break;    
                 end
            end
           
         end
         filtered_image(i-pad,j-pad) = temp; %return 
    end
end
figure('units','normalized','outerposition',[0 0 1 1]);
subplot(1,2,1);
imshow(saltPep_noise,[]);
title('Input Image(adaptive median filter)');
subplot(1,2,2);
imshow(filtered_image,[]);
title('Output Image(adaptive median filter)');

end