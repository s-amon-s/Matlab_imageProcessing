function MyKmean3()
tic;
%% Read image
% store image in coin variale
    original = imread('kodim03.png');
    image =  rgb2gray(original);
%% Initialize cluster
k = 4;
[clusterA clusterB clusterC clusterD] = createCluster(image,k);

% imshow(cat(1,clusterA,clusterB,clusterC,clusterD))
%% Main Method
% done = false;
% tempA = 0;tempB = 0;tempC = 0;tempD = 0;
% i = 0;
% while ~done
%     if isempty(clusterA)   
%        meanA = tempA;
%    else
%    meanA = mean(clusterA(:)); 
%     end
% 
%    if isempty(clusterC)   
%        meanC = tempC;
%    else
%        meanC = mean(clusterC(:)); 
%    end
%    if isempty(clusterB)   
%        meanB = tempB;
%    else
%     meanB = mean(clusterB(:)); 
%    end
%    if isempty(clusterD)   
%        meanD = tempD;
%    else
%     meanD = mean(clusterD(:)); 
%    end
%         
%     if tempA == meanA && tempB == meanB && tempD == meanD 
%         done = true;
%     end
%         
%     [clusterA brr crr drr] = adjustCluster(clusterA,meanA,meanB,meanC,meanD);
%     
%     [arr clusterB crr2 drr2] = adjustCluster(clusterB,meanA,meanB,meanC,meanD);
% 
%     [arr2 brr2 clusterC drr3] = adjustCluster(clusterC,meanA,meanB,meanC,meanD);
%     
%     [arr3 brr3 crr3 clusterD] = adjustCluster(clusterD,meanA,meanB,meanC,meanD);
% 
%     clusterA = cat(1,clusterA(:),arr(:)); clusterA = cat(1,clusterA(:),arr2(:)); clusterA = cat(1,clusterA(:),arr3(:));
%     clusterB = cat(1,clusterB(:),brr(:)); clusterB = cat(1,clusterB(:),brr2(:)); clusterB = cat(1,clusterB(:),brr3(:));
%     clusterC = cat(1,clusterC(:),crr(:)); clusterC = cat(1,clusterC(:),crr2(:)); clusterC = cat(1,clusterC(:),crr3(:));
%     clusterD = cat(1,clusterD(:),drr(:)); clusterD = cat(1,clusterD(:),drr2(:)); clusterD = cat(1,clusterD(:),drr3(:));
%     
%     tempA = meanA;tempB = meanB;tempC = meanC;tempD = meanD;
%     i = i+1;
%     
% end

%% Display thresholded image
preProcessed_data = load('matlab.mat');
text = sprintf('No. of times taken = %d',preProcessed_data.time);
disp(text);
maxx = preProcessed_data.maxx;
minn = preProcessed_data.minn;

for y=1:size(image,1)
   for x=1:size(image,2)
          for i=1:k
            if image(y,x)>= minn(i)&&image(y,x) <= maxx(i)
                image(y,x) = maxx(i);
            end
          end
      end
  end
  toc; %stop timer
  figure('units','normalized','outerposition',[0 0 1 1]);
  subplot(121),imshow(original),title('original image');
  subplot(122),imshow(image,[]),title(sprintf('%d-mean clustered image',k));
  
 end

% function [arr brr crr drr] = adjustCluster(a,meanA,meanB,meanC,meanD)
% 
%     arr = [];
%     brr = [];
%     crr = [];
%     drr = [];
%     a = double(a);
%     meanA = double(meanA); meanB = double(meanB); meanC = double(meanC); meanD = double(meanD);
%  for i=1:(size(a,1)*size(a,2))
%           [mn cluster] = min([abs(a(i)- meanA) abs(a(i)- meanB) abs(a(i)- meanC) abs(a(i)- meanD)]);
%           if cluster == 1
%                 arr(end+1) = a(i);
%           elseif cluster == 2
%                brr(end+1) = a(i);
%            elseif cluster == 3
%                crr(end+1) = a(i);
%            elseif cluster == 4
%                drr(end+1) = a(i);
%            end
%   end
%     
% end

function [A B C D] = createCluster(image,k)
    section_size = round((size(image,1)*size(image,2))./k);
        A = image(1:section_size);
        B = image(section_size+1:section_size*2);
        C = image(section_size*2+1:section_size*3);
        D = image(section_size*3+1:section_size*4);    
end
