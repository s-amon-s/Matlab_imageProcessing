function Myautothre()
%% Read image
% store image in coin variale
    coin = double(imread('coins.bmp'));
    
%% Automatic Thresholding
% define initial To 
deltaT = 0.01;
T  = 0.5*(min(coin(:)) + max(coin(:)));
gtg = T;
done = false;
gg = 0;

    while ~done
            disp(['T = ',num2str(T)]);
            temp = coin(coin>gtg);
            mue1 = mean(temp);

            temp = coin(coin<=gtg);
            mue2 = mean(temp);
                        
            gtg   = round((mue1+mue2)./2);
            
            gg = gg+1;

            if (T-gtg) < deltaT
                done = true;
            else
                T = gtg;
            end
    end
    
disp([num2str(gg),' times to get the value']);
 
 %% Manual Thresholding
 coin = coin > gtg;
%% Display thresholded image
 output = coin;
 imshow(output,[]);
 title([num2str(gg),' times to get the value'])
end

