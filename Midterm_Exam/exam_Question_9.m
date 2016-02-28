function exam_Question_9()
 
 image = imread('Louis van Gaal2.jpg');
 [yCbCr_image,Ycr] = Myrgb2ycbcr(image);
 output_image = image;
%   Ycr = round(Ycr .*255)
%   [y x] = find( > 120);
%    x
% %thresholding
    for i=1:size(image,1)
        for j=1:size(image,2)
            if Ycr(i,j)~=0
                output_image(i,j,:) = image(i,j,:);
            else 
                output_image(i,j,:) = 0;
            end
        end
    end
%  
imshow(output_image);

 
end