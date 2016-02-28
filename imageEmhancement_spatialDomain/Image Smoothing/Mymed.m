function Mymed()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
s = imread('eight_salt_pepper.tif');
[x,y] = size(s);
s2 = padarray(s,[1 1]);
s3 = s;
for i=1:x-2
    for j=1:y-2
        s2(i+1,j+1) = s(i,j);
        array(1:3,1:3) = s(i:i+2,j:j+2);
        a=sort(array(:));
        s3(i,j) = a(5,1);
    end
end
imshow(s3);

end

