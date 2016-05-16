function Mymanualthre()
%% Read image
% store image in coin variale
    coin = double(imread('coins.bmp'));
    
%% Manual Thresholding
 for i=1:size(coin,1)
     for j=1:size(coin,2)
         if coin(i,j,1) < 88
             coin(i,j,:) = 0;
         else
             coin(i,j,:) = 255;
         end
     end
 end
%% Display thresholded image
 output = coin;
 imshow(output,[]);
end

