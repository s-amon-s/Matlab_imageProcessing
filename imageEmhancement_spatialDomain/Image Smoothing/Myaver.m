function Myaver(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
g = imread('eight_gaussian.tif');
subplot(1,2,1);
imshow(g);
[x,y] = size(g);
s2 = padarray(g,[1 1]);
s3 = g;
for i=1:x-2
    for j=1:y-2
        s2(i+1,j+1) = g(i,j);
        array(1:3,1:3) = (g(i:i+2,j:j+2))/9;
        a=sum(array(:));
        s3(i,j) = a;
        
    end
end
disp(a);
subplot(1,2,2);
imshow(s3);

end