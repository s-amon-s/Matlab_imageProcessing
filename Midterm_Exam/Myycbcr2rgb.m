function out = Myycbcr2rgb(in)
Iycbcr = im2double(in);
Y = Iycbcr(:,:,1);
Ycb = Iycbcr(:,:,2);
Ycr = Iycbcr(:,:,3);
% Convert a YCbCr image to the equivalent RGB image
R = Y + 1.403*(Ycr - 0.5);
G = Y - 0.344*(Ycb - 0.5) - 0.714*(Ycr - 0.5);
B = Y + 1.773*(Ycb - 0.5);
out = im2uint8(cat(3,R,G,B));
end