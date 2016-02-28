function ramp()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


GG = ones(256, 256);
[a,b] = size(GG);

for j=1:a
    GG(:,j) = GG(:,j)/256.*(j);
        %GG(i,j) = GG(i,j)*(256-j);
end

subplot(1,2,1);
imshow(GG);
subplot(1,2,2);
imhist(GG);


end

