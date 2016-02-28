function im = Propanotemcorr1()
image1 = imread('p1.bmp');
image2 = imread('p2.bmp');
[x,y,z]=size(image1);
for j=1:y
    template=image1(:,j,1:3);
    [tx,ty]=size(template);
    avg_template=sum(sum(template)./(ty))./tx;
    diff_template=template-avg_template;
    
    subImage=image2(:,1,1:3);
    avg_subImage=sum(sum(subImage)./(ty))./tx;
    diff_subImage=subImage-avg_subImage;
    multi_numerator=(diff_template.*diff_subImage);
    sum_numerator=sum(sum(multi_numerator)./(ty))./tx;
            
    sq_denominatorTemplate=sum(sum(diff_template.^2)./(ty))./tx;
    sq_denominatorSubImage=sum(sum(diff_subImage.^2)./(ty))./tx;
    rt_denominator=sqrt(sq_denominatorTemplate.*sq_denominatorSubImage);
    g=sum_numerator./rt_denominator;
    if g>=1
        im=j;
   end
end

image3=uint8(zeros(x,y+im,3));
image3(:,1:im,1:3)=image1(:,1:im,1:3);
image3(:,im+1:y+im,1:3)=image2(:,:,1:3);


subplot(2,2,1);
imshow(image1);
subplot(2,2,2);
imshow(image2,[]);
subplot(2,2,3);
imshow(image3,[]);
end