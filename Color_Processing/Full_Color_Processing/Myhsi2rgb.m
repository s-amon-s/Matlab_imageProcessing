function [rr gg bb] = Myhsi2rgb(in1,in2,in3)

    H = in1;
    S = in2;
    I = in3;

for i = 1 : size(H,1)
    for j = 1 : size(H,2)
      if(H(i,j) >= 0 && H(i,j) < 120)
          [b(i,j) r(i,j) g(i,j)] = RGsector(H(i,j),S(i,j),I(i,j));
      elseif (H(i,j) >= 120 && H(i,j) < 240)
          [r(i,j) g(i,j) b(i,j)] = GBsector(H(i,j),S(i,j),I(i,j));
      elseif (H(i,j) >= 240 && H(i,j) < 360)
          [g(i,j) b(i,j) r(i,j)] = BRsector(H(i,j),S(i,j),I(i,j));
      end
    end
end
rr = r;
gg = g;
bb = b;
% figure;
% subplot(2,2,1);
% imshow(cat(3,r,g,b),[]);
% title('RGB');
% 
% subplot(2,2,2);
% imshow(r,[]);
% title('R component');
% 
% subplot(2,2,3);
% imshow(g,[]);
% title('G component');
% 
% subplot(2,2,4);
% imshow(b,[]);
% title('B component');

end

function [B R G] = RGsector(H,S,I)
    B = I.*(1-S);
    R = I.*(1 + ((S.*cosd(H))./cosd(60-H)));
    G = 3.*I - (R + B);
end

function [R G B] = GBsector(H,S,I)
    H = H-120;
    R = I.*(1-S);
    G = I.*(1 + ((S.*cosd(H))./cosd(60-H)));
    B = 3.*I - (R + G);
end

function [G B R] = BRsector(H,S,I)
    H = H - 240;
    G = I.*(1-S);
    B = I.*(1 + ((S.*cosd(H))./cosd(60-H)));
    R = 3.*I - (G + B);
end