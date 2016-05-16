function output = Mygrad()
H_row = [1 1 1; 0 0 0; -1 -1 -1];
H_column = [1 0 -1; 1 0 -1; 1 0 -1];
image = imread('aaa256.jpg');
[i,j] = size(image);
Hr_img = image;
Hc_img = image;

pad_image = padarray(image,[1 1]);

for row = 1: i
    for col = 1:j
        
        array(1:3,1:3) = double(pad_image(row:row+2,col:col+2));
        
        Hr_x_I = array.*H_row;
        Gr = abs(sum(Hr_x_I(:)));
        
        Hc_x_I = array.*H_column;
        Gc = abs(sum(Hc_x_I(:)));
        
        Hr_img(row,col) = Gr;
        Hc_img(row,col) = Gc;
        
    end
end

Gxy = Hr_img + Hc_img;

figure()
subplot(2,2,1);
imshow(image);
title('original image');
subplot(2,2,2);
imshow(Hr_img);
title('Prewitt Row filter');
subplot(2,2,3);
imshow(Hc_img);
title('Prewitt Column filter');
subplot(2,2,4);
imshow(Gxy);
title('Ouput image for Hr+Hc filter');

end

