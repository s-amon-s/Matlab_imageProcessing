function crop(am)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
subplot(1,2,1)
imshow(am);
% [a,b,c] = size(am);
% for i=1:a
%     for j=1:b/2
%         for k=1:c
%             temp = am(i, j,k);
%             am(i, j, k) = am(i, b-j, k);
%             am(i, b-j,k) = temp;
%         end
%     end
% end
I2 = imcrop(am,[75 68 130 112]);
subplot(1,2,2)
imshow(I2);
%imfuse
end