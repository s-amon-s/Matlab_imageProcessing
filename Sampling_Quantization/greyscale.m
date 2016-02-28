function output = greyscale()
i = 256;
j = 256;
for x = 1: j
    for y = 1: i
        image(y,x) = x;
    end
end
imshow(image,[]);
axis on;
output = image;
end