function im = Myerosion(image)
SE=[1 1 1; 1 1 1; 1 1 1];
[x,y]=size(image);
erosionImage=image;
for i=2:x-1 
    for j=2:y-1
        if image(i,j)==1
            if or(image(i-1:i+1,j-1:j+1),SE)==image(i-1:i+1,j-1:j+1)
                
            else
                erosionImage(i,j)=0;
            end
        end 
    end
end
subplot(1,2,1)
imshow(image)
subplot(1,2,2)
imshow(erosionImage)
im=erosionImage;
end