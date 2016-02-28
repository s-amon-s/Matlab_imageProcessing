function Procolorcomp()
   bird = imread('kodim23.png');
   
    r = bird(:,:,1);
    g = bird(:,:,2);
    b = bird(:,:,3);
    
    subplot(221);
    rr = negative(r);
    imshow(cat(3,rr,g,b),[]);
    title('Negative R, G and B components');
    
    subplot(222);
    gg = negative(g);
    imshow(cat(3,r,gg,b),[]);
    title('Negative G, R and B components');

    subplot(223);
    bb = negative(b);
    imshow(cat(3,r,g,bb),[]);
    title('Negative B, R and G components');

    subplot(224);
    imshow(cat(3,rr,gg,bb),[]);
    title('Negative R,G and B components');
   
end


function output = negative(a)
   output = 255-a;
end