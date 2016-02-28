function Myconts( q,w )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m = imread('MRI.bmp');
[x,y]=size(m);
s = uint8((zeros(size(m))));
for i=1:x
    for j = 1:y
        if ((m(i,j)>q) && (m(i,j)<w))
s(i,j) = (255-q)/(w-q)*(m(i,j)-q)+q; % if r1 <= r < r2
        else
s(i,j) = m(i,j); % if not above
        end
    end
end
imshow(s);
end

