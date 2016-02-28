function Pronearest(x_new,y_new)

woman = imread('woman_blonde.tif');

[j k] = size(woman);

    x_scale = x_new./(j-1); 
    y_scale = y_new./(k-1);
    disp(['The scale is--> x = ',num2str(x_scale),'   y = ',num2str(y_scale)]);
    
    scaled_image = zeros(x_new,y_new);

%Generate the output image

for count1 = 0:x_new-1

 for count2 = 0:y_new-1

 scaled_image(count1+1,count2+1) = woman(1+round(count1./x_scale),1+round(count2./y_scale));

 end

end

%Write the images to files

imwrite(woman,strcat('input_',num2str(j),'x',num2str(k),'.jpg'));
% 
imwrite(scaled_image/256,strcat('output_',num2str(x_new),'x',num2str(y_new),'.jpg'));

text = strcat('Original Image: ',num2str(j),'x',num2str(k));  
plotIt(woman,text,1);

text = strcat('Scaled image: ',num2str(x_new),'x',num2str(y_new));  
plotIt(scaled_image,text,2);

end

function plotIt(image,text,n)
    figure;
    subplot(1,2,n);
    imshow(image,[]);
    title(text);
    truesize;
end