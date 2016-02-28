function output = Mygrayls(mode)
%mode '0' for change to b/w mode '1' for only hilight
original = imread('MRI.bmp');
image = original;
[i,j] = size(image);
for y = 1:j
    for x = 1:i
        if image(x,y) >= 100 && image(x,y)<= 140
            image(x,y) = 255;
        else
            if mode == 0
                image(x,y) = 0;
            end
        end
        
    end
end


output = image;

figure()
subplot(1,2,1);
imshow(original);
title('input');
subplot(1,2,2);
imshow(image);
title('output');
end