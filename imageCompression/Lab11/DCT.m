function out =  DCT(image)
[Y X] = size(image);

for u=0:Y-1
    for v=0:X-1
        if u == 0 
            alphaU = 1/sqrt(Y);
        else
            alphaU = sqrt(2./Y);
        end
        if v == 0
             alphaV = 1/sqrt(X);
        else
             alphaV = sqrt(2./X);
        end
        sum = 0;
        for x=0:Y-1
            for y=0:X-1
                cosU = cos((pi/8).*(x+0.5).*u);
                cosV = cos((pi/8).*(y+0.5).*v);
                sum = sum+ (alphaU.*alphaV.*image(x+1,y+1).*cosU.*cosV);
            end
        end
        G(u+1,v+1)= sum;
    end
end

out = G;
end