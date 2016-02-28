function Procolorsharpen()
    
    flower = imread('flower_blurry.tif');
  
    r = flower(:,:,1);
    g = flower(:,:,2);
    b = flower(:,:,3);
    [H S I] = Myrgb2hsi(flower);
    [Y Cb Cr] = Myrgb2ycbcr(flower);
    
    
     r = EnhanLaplaNeg(r);
     g = EnhanLaplaNeg(g);
     b = EnhanLaplaNeg(b);
     I = EnhanLaplaNeg(I);
     Y = EnhanLaplaNeg(Y);  

    subplot(221);
    imshow(flower);
    title('input RGB image');
    
    subplot(222);
    imshow(cat(3,r,g,b),[]);
    title('Simplified laplacian filtered(RGB)');

    subplot(223);
    [r2 g2 b2] = Mycbcr2yrgb(Y,Cb,Cr);
    imshow(cat(3,r2,g2,b2),[]);
    title('Simplified laplacian filtered(Y)');

    subplot(224);
    [r1 g1 b1] = Myhsi2rgb(H,S,I);
    imshow(cat(3,r1,g1,b1),[]);
    title('Simplified laplacian filtered(I)');
      
end
