function [GG]= Procheckerboard(m)

for tt=1:6
    subplot(2,3,tt);
    imshow(m);
%   Detailed explanation goes here
[a,b] = size(m);

GG = zeros(a/2, b/2);
r=1;

for i=1:2:a
    t = 1;
    for j=1:2:b
       %mm() = m(i, j);
       GG(r,t) = m(i,j);
       t= t+1;
    end
      r= r+1;
end
    subplot(2,3,tt);
    GG = uint8(GG);
    m=GG;
end
end

