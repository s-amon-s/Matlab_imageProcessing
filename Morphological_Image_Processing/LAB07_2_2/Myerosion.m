function erosion = Myerosion(wire)
    
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%wire = double(imread('wirebond-mask.tif'));

subplot(2,2,1);
imshow(wire);

[x, y] = size(wire);
e = [1 1 1;1 1 1; 1 1 1];
wire2= wire;

    for i=1:x-2
        for j=1:y-2
           if wire(i+1,j+1) == 1
           if wire(i:i+2,j:j+2) == e(:,:)
           else
               wire2(i+1,j+1) = 0;
           end
           end
        end
    end
subplot(2,2,2);
imshow(wire2);
erosion = wire2;
end

