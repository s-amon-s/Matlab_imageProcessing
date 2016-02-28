function [out,Ycr] = Myrgb2ycbcr(in)
Irgb = im2double(in);
R = Irgb(:,:,1);
G = Irgb(:,:,2);
B = Irgb(:,:,3);
% RGB in [0,1] to Ycbcr in [0, 255]
Y = 0.299*R + 0.587*G + 0.114*B;
Ycb = (B-Y)*0.564 + 0.5;
Ycr = (R-Y)*0.713 + 0.5;
imshow(Ycr);figure;
for i=1:size(Ycb,1)
    for j=1:size(Ycb,2)
        if Ycr(i,j)<0.55
            Ycr(i,j) = 0;
        end
    end
end
out = im2uint8(cat(3,Y,Ycb,Ycr));
Ycr = Ycr;

end

