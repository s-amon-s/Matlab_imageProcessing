function Prolocalaver()
woman = imread('woman_blonde.tif');
im_size = size(woman,1);
sampled_image = zeros(im_size/2,im_size/2);

i = 1;
j = 1;

for row = 1:2:im_size
    for col = 1:2:im_size
        sampled_image(i,j)  =  (sum(sum(woman(row:row+1,col:col+1))))/4;
        j=j+1;
    end
    j=1;
    i = i+1;
end
 
plotIt(woman,'Original Image 256x256',1);
plotIt(sampled_image,'Sampled image 128x128',2);

end

function plotIt(image,text,n)
subplot(1,2,n);
imshow(image,[]);
title(text);
% truesize;
end