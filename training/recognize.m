function recognize()
%% Preprocessing --> featureExtration --> Classification:
    %Odd Gabor filters can be used to highlights the veins
    [orgT,test,stat] = getProperty('leaf_testing.bmp',30); %image name, opening pixel 
    maL = stat.MajorAxisLength;
    com1 = [];
    com2 = [];
%% Classification    
  % using majorAxislength and cross-correlation
    for i=1:5
            [org{i},leaf{i},stat] = getProperty(sprintf('leaf%d (1).bmp',i),50);
            leaf_2 = imresize(leaf{i},size(test));
            property2 = abs(maL - stat.MajorAxisLength);
            coeff = corr2(test,leaf_2);
            com2 = [com2 coeff]
            if property2 < 200
                com1 = [com1 coeff]
            end
    end
        index = find(com2 == max(com1));

%% Display
        figure('units','normalized','outerposition',[0 0 1 1]);
        subplot(121),imshow(orgT),title('Test Image');
        subplot(122),imshow(org{index}),title(sprintf('Matched Image, Leaf(#%d)',index));
end

function [org,img,struct] =  getProperty(image,piXel)
%% Preprocessing
    org = imread(image);
    img = (rgb2gray(org));
    thresh = graythresh(img);
    img = img<thresh*255;
    img = bwareaopen(img,piXel);
    img = imfill(double(img),'holes');

%%  Feature Extraction
    struct = regionprops(img,{'Area','Centroid','MajorAxisLength','MinorAxisLength','Extrema'});
    imshow(img,[]);hold on;
    if numel(struct.Centroid) >1
        disp('More than one centroid found');
    end
        plot(struct.Centroid(1), struct.Centroid(2), 'bo');
    for i=1:8
        plot(struct.Extrema(i,1), struct.Extrema(i,2), 'bo');
    end
    pause(0.5);
    hold off;
end