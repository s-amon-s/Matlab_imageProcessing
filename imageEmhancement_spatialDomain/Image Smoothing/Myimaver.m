function Myimaver(p, x)
%UNTITLED3 Summary of this function goes here

for j=1:x
    images(:,:,j) = uint16(imread(strcat(p,num2str(j),'.bmp')));
end

subplot(221);
imshow(uint8(images(:,:, 1)));

[gg,y] = size(images(:,:,1));
p_sum = uint16(zeros(gg,y));

for o=1:x
    p_sum = p_sum+images(:,:, o);
end
    p_avg = p_sum./x;
    noise = double(images(:,:,1)) - double(p_avg);

subplot(222);
imshow(p_sum,[]);
subplot(223);
imshow(noise, []);
end

