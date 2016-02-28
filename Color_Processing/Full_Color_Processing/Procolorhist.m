function Procolorhist()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    image_name = 'badexposure.jpg';

    bad = imread(image_name);
    r = bad(:,:,1);
    g = bad(:,:,2);
    b = bad(:,:,3);
    
    %only 2 dozens can be recongnized
    %RGB -  screen,monitor,DISPLAY
    %CMY -  printer
    %CMYK - more black
    %HSI - lod-cell(During Night) con-cell HUMAN interpretation
    %image segmentation, dividing segments 
    %looks washed out with method 1 histogram equalization
    %average filter is good to handle gaussian noise (BLUR)
    %salt and pepper -- median filter
    [H S I] = Myrgb2hsi(bad);
    [Y Cb Cr] = Myrgb2ycbcr(bad);

     I = im2double(HistEqual(uint8(I.*255)));
     r = HistEqual(r);
     g = HistEqual(g);
     b = HistEqual(b);
     Y = im2double(HistEqual(uint8(Y.*255)));

       
    subplot(221);
    imshow(bad);
    title('input image');
    
    subplot(222);
    imshow(cat(3,r,g,b),[]);
    title('on RGB');

    subplot(223);
    [r2 g2 b2] = Mycbcr2yrgb(Y,Cb,Cr);
    imshow(cat(3,r2,g2,b2),[]);
    title('Histogram equalized only on Y');

    subplot(224);
    [r1 g1 b1] = Myhsi2rgb(H,S,I);
    imshow(cat(3,r1,g1,b1),[]);
    title('Histogram equalized only on I');

end