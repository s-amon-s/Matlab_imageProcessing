function [H f] = Myblf(image,Do,n,mode) % input, cutoff frequency, n is the order of the filter(Radius of the ring)
if ~exist('image','var') && ~exist('Do','var') && ~exist('n','var') && ~exist('mode','var') 
    Do = 30;
    n = 2;
    mode = 'main';
    image = imread('eight.tif');
end

spatial_image = double(image);
[y x] = size(spatial_image);

padded_image = zeros(y*2, x*2);
padded_image(1:y,1:x) = spatial_image(:,:); 

[y_1 x_1] = size(padded_image);
temp = padded_image;

%FFT2 works on matrices, changes spatial to frequency domain
%FFTshift, shifts F(0,0) images to 
f = fftshift(fft2(padded_image));%f = log(1+abs(f)); 

%filter function 
for u=1:y_1 
     for v=1:x_1 
          offset = sqrt(((u-(y_1/2)).^2)+((v-(x_1/2)).^2));%distance from the origin
          H(u,v) = 1./(1+(((offset./Do)).^(2*n)));
     end
end

%% 
G(:,:) = H(:,:).*f;
real_G = real(ifft2(ifftshift(G)));
cf = log(1+abs(f));
out = real_G(1:y,1:x);

%% Display
if(~strcmp(mode,'callable'))
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(141),imshow(spatial_image,[]),title('input');
    subplot(142),imshow(padded_image,[]),title('padded input');
    subplot(143),imshow(cf./max(cf(:)),[]),title('frequency transformed');
    subplot(144),imshow(real_G(1:y,1:x),[]),title('Butterworth low-pass Filtered image');
end

end
    
