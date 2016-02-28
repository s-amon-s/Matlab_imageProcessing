function blend(am,bm)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
subplot(1,3,1)
imshow(am);
subplot(1,3,2)
imshow(bm);
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
I2 = imfuse(am,bm);
subplot(1,3,3)
imshow(I2);
%imfuse
end