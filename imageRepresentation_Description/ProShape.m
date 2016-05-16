function ProShape()
%% Define
in_shape = (imread('images.jpg')); 
shapeBW = (~im2bw(in_shape));      %negative image %might need to do dilation 
[ob_detect,maxObj] = bwlabel(shapeBW);
%% Display
imshow(in_shape);
%% Detect
for i=1:maxObj
        img = (ob_detect==i);
        [y x] = find(ob_detect==i);
        [a b] = max(y);
        len = max(x) - min(x)+2;
        breadth = max(y) - min(y)+2;
        midPointY = breadth./2+min(y);
        midPointX = len./2+min(x);
        if x(min(x,2)) == x(b)
            if len-breadth>3
                shape = 'rectangle';
            else
                shape = 'square';
            end
        else            
            if len-breadth<3 
                if img(max(y),min(x):max(x))== 1
                     shape = 'Triangle';
                else
                     shape = 'Circle';            
                end
            elseif len-breadth>3
                    shape = 'Oval';            
            end
        end        
        text(midPointX-20,midPointY,shape);
end    
     
end