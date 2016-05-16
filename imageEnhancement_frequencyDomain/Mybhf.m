function out = Mybhf(Do,n) % input, cutoff frequency, n is the order of the filter(Radius of the ring)
if ~exist('Do','var') && ~exist('n','var') 
    Do = 80;
    n = 2;
end

spatial_image = imread('aaa256.jpg');
[y x] = size(spatial_image);
[H,f] = Myblf(spatial_image,Do,n,'callable');
H = 1 - H;
   
%% 
G(:,:) = H(:,:).*f;
real_G = real(ifft2(ifftshift(G)));
cf = log(1+abs(f));
out = real_G(1:y,1:x);

%% Display
figure('units','normalized','outerposition',[0 0 1 1]);
subplot(121),imshow(spatial_image,[]),title('input');
subplot(122),imshow(uint8(real_G(1:y,1:x)),[]),title('Butterworth high-pass Filtered image');
end
    
