function Mytemcorr()

cameraman = imread('cameraman.tif');
template = imread('template.bmp');

[x,y] = size(cameraman);
[q,w] = size(template);
% answer = size(x,y);

 for i=1:x-q
     for j=1:y-w
         answer(i,j) = sum(sum((double(template(:,:)) - double(cameraman(i:i+q-1,j:j+w-1))).^2));
     end
 end
 imshow(255-answer);figure;
 disp(size(answer))
 
 [x1,y1] = find(answer == min(answer(:)));

 cameraman(x1:x1+q,y1) = 255;
 cameraman(x1,y1:y1+w) = 255;
 cameraman(x1+q,y1:y1+w) = 255;
 cameraman(x1:x1+q,y1+w) = 255;
 
imshow(cameraman);
 end

