function Propixelrep( )

woman = imread('woman_blonde.tif');

im_size = size(woman,1);
n_size = 2.*im_size;
sampled_image = zeros(n_size,n_size);

% sampled_image(:,:) = woman(1:2:im_size,1:2:im_size);
i=1;
j=1;
for row=1:2:n_size
    for col=1:2:n_size
      sampled_image(row:row+1,col:col+1) = woman(i,j);
      j=j+1;
    end
    i=i+1;
    j=1;
end

plotIt(woman,'Original Image 256x256',1);
plotIt(sampled_image,'Sampled image 512x512',2);
end

function plotIt(image,text,n)
figure;
subplot(1,2,n);
imshow(image,[]);
title(text);
truesize;
end