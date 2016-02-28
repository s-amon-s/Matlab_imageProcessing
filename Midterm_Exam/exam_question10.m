function exam_question_10()

image = imread('dark_road.jpg');
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

imshow(image); % output image

end