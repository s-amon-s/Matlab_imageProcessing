function Myautothre()
%% Read image
% store image in coin variale
    coin = (rgb2gray(imread('i4c_2015.jpg')));
%%    
global index;
index = 1;

it3 = blkproc(coin,[16 16],@adaptt); %block procedure
img = it3;
disp([num2str(index),' times to get the value']);
%% Adaptive thresholding
% index = 1;
% k = 0.05;
% R = 128;
% for gg=1:16:size(coin,1)
%     for gg1=1:16:size(coin,2)
%             temp = coin(gg:gg+15,gg1:gg1+15);
%              T  = graythresh(temp)*256+5;%0.5*(min(coin(:)) + max(coin(:)));
%              T = mean(temp(:))*(1+k*(std(double(temp(:)))./R-1));
%              img(gg:gg+15,gg1:gg1+15) = temp < T;
%              index = index +1;
%     end
% end

%% Display thresholded image
 img = bwareaopen(img,30);
 output = imclose(img,strel('disk',1));%Myglf(img,220,'callable');
 figure('units','normalized','outerposition',[0 0 1 1]);
 subplot(121),imshow(double(coin),[]);
 subplot(122),imshow(double(output),[]);
 title([num2str(index),' times to get the value'])
end
function out = adaptt(in)
global index;
k = 0.05;
R = 128;
% if std2(in) <1
%     out = ones(size(in,1),size(in,2));
% else
T = mean(in(:))*(1+k*(std(double(in(:)))./R-1));
out = in < T;
% end
index = index +1;
% if std2(in) < 1
%     out = ones(size(in,1),size(in,2));
% else
%     out = im2bw(in,graythresh(in));
% end

end

