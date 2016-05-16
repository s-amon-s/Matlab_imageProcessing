function output = EnhanLaplaNeg()

image = imread('blurry_moon.tif');
[i,j] = size(image);

img2 = image;

pad = padarray(image,[1 1]);

lapMask = [1 1 1; 1 -8 1; 1 1 1]; %center negative


for row = 1: i
    for col = 1:j   
        array(1:3,1:3) = double(pad(row:row+2,col:col+2));
        lap_fil = array.*lapMask;
        lap_val = abs(sum(lap_fil(:)));
        img2(row,col) = lap_val;
    end
end
sharp_img = image+(img2.*0.7);
figure()
subplot(2,2,1);
imshow(image);
title('input');
subplot(2,2,2);
imshow(img2);
title('lap image');
subplot(2,2,3);
imshow(sharp_img);
truesize;
title('sharpen image');

end
