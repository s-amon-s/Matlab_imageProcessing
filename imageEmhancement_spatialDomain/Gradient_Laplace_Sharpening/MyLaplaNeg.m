function output = MyLaplaNeg()

image = imread('aaa256.jpg');
[i,j] = size(image);

X_image = padarray(image,[1 1]);

Gxy = image;
lapMask = [0 1 0; 1 -4 1; 0 1 0];


for row = 1: i
    for col = 1:j
        array(1:3,1:3) = double(X_image(row:row+2,col:col+2));
        HxI = array.*lapMask;
        Hxy = abs(sum(HxI(:)));
        Gxy(row,col) = Hxy;
    end
end
figure()
subplot(1,2,1);
imshow(image);
title('input');
subplot(1,2,2);
imshow(Gxy);
title('lap image')
end
