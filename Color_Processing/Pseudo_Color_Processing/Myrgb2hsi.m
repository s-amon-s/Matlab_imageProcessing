function [Q S I] = Myrgb2hsi()

Irgb = im2double(imread('flowers.tif'));
r = Irgb(:,:,1);
g = Irgb(:,:,2);
b = Irgb(:,:,3);


for i = 1 : size(r,1)
    for j = 1 : size(r,2)

        rg = adjust((r(i,j) - g(i,j)));
        rb = adjust((r(i,j) - b(i,j)));
        gb = adjust((g(i,j) - b(i,j)));
        
        upH  = 0.5.*(rg+rb);
        lowH = (rg.^2 + rb.*gb).^0.5;
        div  = divide(upH,lowH);
        
        
        if b(i,j) <= g(i,j)
            Q(i,j) = acosd(div);
        else
            Q(i,j) = 360 - acosd(div);
        end
             a = min(r(i,j),g(i,j));
             S(i,j) = 1 - ((3./(r(i,j)+g(i,j)+b(i,j))).*(min(a,b(i,j))));
             I(i,j) = (1./3).*(r(i,j)+g(i,j)+b(i,j));
    end
end

subplot(2,2,1);
imshow(cat(3,Q./360,S,I),[]);
title('HSI');

subplot(2,2,2);
imshow(Q./360,[]);
title('H component');

subplot(2,2,3);
imshow(S,[]);
title('S component');

subplot(2,2,4);
imshow(I,[]);
title('I component');

end

function gg = adjust(n)
    ac = n;
    if ac<0
        ac = 0;
    end
    gg = ac;
end

function div = divide(u,l)
    if l == 0
        l=1;
    end
    div = u./l;
end