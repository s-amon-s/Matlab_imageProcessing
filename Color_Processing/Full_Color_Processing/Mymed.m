function output = Mymed(gg)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
s = gg;
[x,y] = size(s);
s2 = padarray(s,[1 1]);
s3 = s;
for i=1:x-4
    for j=1:y-4
        s2(i+1,j+1) = s(i,j);
        array(1:5,1:5) = s(i:i+4,j:j+4);
        a=sort(array(:));
        s3(i,j) = a(5,1);
    end
end
output = s3;
end

