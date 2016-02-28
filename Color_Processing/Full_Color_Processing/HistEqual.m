function image = HistEqual(a)
min = 15;
max = 80;
image = a;
original = image;
[i,j] = size(image);
[count, bin] = imhist(image);
MN = i*j;
p = [];
for gg= 1:256
    p(end+1) = count(gg)/MN;
end
gather = [];
sum = 0;
for gg= 1:256
    sum = sum + p(gg);
    gather(end+1) = sum;
end
s = [];
temp = 0;
for shade = 1:256
    temp = 255*gather(shade);
    s(end+1) = round(temp);
end
for y = 1:j
    for x = 1:i
        for shade = 1:256
            if image(x,y) == shade-1
                image(x,y) = s(shade);
                break;
            end
        end
    end
end

output = gather;

% figure();
% subplot(1,3,1);
% imshow(original);
% title('original image');
% subplot(1,3,2);
% imshow(image);
% title('modified image');
% subplot(1,3,3);
% imhist(image);
% title('histragram of original image');

end