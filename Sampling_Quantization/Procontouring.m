function Procontouring(m)
%UNTITLED2 Summary of this function goes here
for x=1:8
   
        NoOfLevel = 2.^(9-x);
        gap = 256/NoOfLevel;
        
        subplot(2,4,x);
        m2 = uint8(ceil(m/gap)* gap-1);
        imshow(m2);
end

end

