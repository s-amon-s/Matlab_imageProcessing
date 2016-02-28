function Promidpoint(  )
woman = imread('woman_blonde.tif');

im_size = size(woman,1);
n_size = 2.*im_size;
sampled_image = zeros(n_size,n_size);

i=1;
j=1;

%experimenting
str = sprintf('%d',[im_size im_size 12]);
disp(['just for fun', str]);
%experimenting


for row=1:2:n_size
    
    for col=1:2:n_size
    
    if i==im_size && j==im_size
       sampled_image(row:row+1,col:col+1) = woman(i,j);

    elseif i~=im_size && j==im_size
        sampled_image(row:row+1,col:col+1) = [woman(i,j) woman(i,j);(sum(woman(i:i+1,j)))/2 woman(i,j) ];    
       
    elseif i==im_size && j~=im_size
        sampled_image(row:row+1,col:col+1) = [woman(i,j) (sum(woman(i,j:j+1)))/2;woman(i,j) woman(i,j)];             
       
    else
        sampled_image(row:row+1,col:col+1) = [woman(i,j) (sum(woman(i,j:j+1)))/2;(sum(woman(i:i+1,j)))/2 sum((sum(woman(i:i+1,j:j+1)/2)))/2];
    end
    
    j=j+1;
    end
    
    i=i+1;
    j=1;    
end

plotIt(woman,'Original Image 256x256',1);
plotIt(sampled_image,'Sampled image 512x512',2);
pause(5);
close all;
end

function plotIt(image,text,n)
figure;
subplot(1,2,n);
imshow(image,[]);
title(text);
truesize;
end