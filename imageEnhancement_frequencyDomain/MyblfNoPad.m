function MyblfNoPad()
spatial_image = double(imread('square_original.tif'));
[y x] = size(spatial_image);
f = fftshift(fft2(spatial_image));

 for i=1:x %filter
     for j=1:y
            d = sqrt(((i-(x/2)).^2)+((j-(y/2)).^2));
            H(i,j) = 1./(1+(((d./20)).^(2*2)));
     end
 end

G(:,:) = H(:,:).*f;
G_real = real(ifft2(ifftshift(G)));
figure,imshow(G_real(1:x,1:y),[]),title('withNoPad_Butterworth');
end

