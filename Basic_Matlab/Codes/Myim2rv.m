function Myim2rv(am)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
imshow(am);
[a,b,c] = size(am);

disp(a);
    disp(b);
    disp(c);
for i=1:a
    for j=1:b/2
        for k=1:c
            temp = am(i, j,k);
            am(i, j, k) = am(i, b-j, k);
            am(i, b-j,k) = temp;
        end
    end
end
imshow(am);
disp(a);
    disp(b);
    disp(c);
%imfuse
end

