function output = encrypt(image)
[i,j] = size(image);
ways = 9;
rng(seed);
ran = randperm(ways);
for y = 1:j
    for x = 1:i
        image(x,y) = image(x,y) ;
    end
end
output = image;
end