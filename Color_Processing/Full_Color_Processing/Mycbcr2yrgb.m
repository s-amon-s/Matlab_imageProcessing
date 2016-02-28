function [r g b] = Mycbcr2yrgb(in1,in2,in3)

% Irgb = im2double(imread('flowers.tif'));
    y = in1;
    cb = in2;
    cr = in3;

r = y + 1.403.*(cr-0.5);
g = y - 0.344.*(cb-0.5)-0.714.*(cr-0.5);
b = y + 1.773.*( cb - 0.5);

% 
% 
% subplot(2,2,1);
% imshow(cat(3,r,g,b));
% title('YCbCr');
% 
% subplot(2,2,2);
% imshow(r.*255,[]);
% title('R');
% 
% subplot(2,2,3);
% imshow(g.*255,[]);
% title('G');
% 
% subplot(2,2,4);
% imshow(b.*255,[]);
% title('B');

end
