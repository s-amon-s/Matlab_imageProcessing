function MyKmean() % can edit input arguments to take the folowing --<image,k>--
   tic; % start timer
%% Read image
% store RGB image in original variable
    original = imread('kodim03.png');
    image = rgb2gray(original); % for TEST ==>> [213 100 30 46;65 8 72 231;34 19 87 4;90 85 253 131]; should yield in 4 times
 
%% Initialize cluster
%in this exam we use Cluster of 4,  
k = 4;
clusters = createCluster(image,k);

%% Main method
% define neccessary variables
temp = zeros(1,k);
time = 1;

while true
    means = calMean(clusters,k,temp); % calculate mean of each cluster
   
   if temp(1:k) == means(1:k)  % if current mean == previous(temp) mean, no more clustering needed
       break;
   end
   
    add = cell(1,k);
    for i=1:k
        adjusted{i} = adjustCluster(clusters{i},means); %group pixels in to right cluster, based on K-MEAN
        clusters{i} = adjusted{i}{i};
        for j=1:k
            if j~=i
                add{j} = cat(2,add{j},adjusted{i}{j});                
            end
            if i==k
                clusters{j} = cat(2,clusters{j},add{j});
            end
        end
        
    end
    
    temp(1:k) = means(1:k);%store previous mean into temp
    time = time+1; %increase no. of times taken
    
end

%% Display thresholded image
  text = sprintf('No. of times taken = %d',time);
  disp(text);
  for i =1:k
      maxx(i) = max(clusters{i});
      minn(i) = min(clusters{i});
  end
  
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

%% Adjust cluster
% change the cluster of each pixel to satisfy K-MEAN clustering
% input =  1x(k)  cell of clusters , array of mean of each cluster ;  k = # of clusters
% output = 1x(k) cell of adjusted image cluster; k = # of clusters
function section = adjustCluster(cluster,means)
    section = cell(size(means));
    cluster = double(cluster);
    means = double(means);
    size_mean = size(means,2);
    for i=1:(size(cluster,1)*size(cluster,2))
        for j=1:size_mean
            chk(j)= abs(cluster(i) - means(j));
        end
  
        [mn loc] = min(chk);
        
        for k=1:size_mean
            if k == loc
                section{k} = cat(2,section{k},cluster(i));
            end
        end      
    end
end

%% Divide image in to cluster for the first time
% input = 2d image,k ; k = # of clusters
% output = 1x(k) cell of image clusters; k = # of clusters

function output = createCluster(image,k)
    section_size = round((size(image,1)*size(image,2))./k);
    first_section = section_size;
    if isfloat(section_size)
        first_section = first_section+1;
    end
    output = {1,k};
    for i=1:k
        if i == 1
            output{i} = image(1:first_section);
        end
        if i == 2
            output{i} = image(first_section+1:section_size*2);
        end
            output{i} = image(section_size*(i-1)+1:section_size*i);
    end
end
%% Calculate mean of each clusters
function means = calMean(clusters,k,temp)
      for i=1:k
           if isempty(clusters{i}) %avoid errors from empty cluster
               means(i) = temp(i);
           else
               means(i) = mean(clusters{i});
           end
      end
end