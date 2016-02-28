function output = Mygrad(input_image)

H_row = [-1 -2 -1; 0 0 0; 1 2 1];
H_column = [-1 0 1; -2 0 2; -1 0 1];

image = input_image;
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
        
        if Gr < (250./255)
            Gr = (250./255);
        end
        if Gc < (250./255) 
            Gc = (250./255);
        end
        if Gr > (250./255) 
            Gr = 0;
        end
        if Gc > (250./255) 
            Gc = 0;
        end
        Hr_img(row,col) = Gr;
        Hc_img(row,col) = Gc;
        
    end
end

Gxy = Hr_img + Hc_img;

output = Gxy;

% figure()
% subplot(2,2,1);
% imshow(image);
% title('original image');
% subplot(2,2,2);
% imshow(Hr_img);
% title('Prewitt Row filter');
% subplot(2,2,3);
% imshow(Hc_img);
% title('Prewitt Column filter');
% subplot(2,2,4);
 imshow(Gxy);
% title('Ouput image for Hr+Hc filter');

end

