function [i] = histQuery(inputImg)
load('dataset.mat')

% Input image
%inputImg = imgetfile;
inputImg = imread(inputImg);
I=preprocessingImage(inputImg);

%% Calculate histogram intersection
imHist = histogram(I,256);
result = zeros(1000,1);
for i = 0:999
    intersect = 0;
    for ii = 1:256
        intersect = intersect + min(imHist.Values(ii),data(i+1,ii));
    end    
    result(i+1) = intersect;
end

% Value & index for comparison intersect
[result, index] = sortrows(result,1,'descend');

%% Calculate color moments 
H = double(I(:, :, 1));
S = double(I(:, :, 2));
V = double(I(:, :, 3));

% compute 3 first color moments from each channel
meanH = mean( H(:) );
stdH  = std( H(:) );
sknH = skewness(H(:),1,'all');

meanS = mean( S(:) );
stdS  = std( S(:) );
sknS = skewness(S(:),1,'all');

meanV = mean( V(:) );
stdV  = std( V(:) );
sknV = skewness(V(:),1,'all');
% Weight matrix
weight = [2 2 2 1 1 1 1 1 1];
d_com = zeros(1000,1);

sumall = zeros(1,9);
for i = 0:999    
    sumall = data(i+1,257:265)-[meanH meanS meanV stdH stdS stdV sknH sknS sknV];
    d_com(i+1) = sum(weight.*abs(sumall),'double');
end

% Value & index for comparison intersect
[result1, index1] = sortrows(d_com,1,'ascend');

index3 = zeros(1000,1);
for i=1:1000
    ranking = 0;
    for ii=1:1000
        if index1(ii)==index(i)
            ranking = 0.8*i+0.2*ii;
        end
    end
    index3(i) = ranking;
end

ultimate = [index index3];
ultimate = sortrows(ultimate,2,'ascend');
index4 = ultimate(:,1);


figure
subplot(2,4,1); imshow(hsv2rgb(I)); title('Origin image');
for i= 1:7
    temp = fix(index4(i+1)/100);
    switch temp
        case 0
            class = 'Africa';
        case 1
            class = 'Beach';
        case 2
            class = 'Buildings';
        case 3
            class = 'Buses';
        case 4
            class = 'Dinosaurs';
        case 5
            class = 'Elephants';
        case 6
            class = 'Flowers';
        case 7
            class = 'Horses';
        case 8
            class = 'Mountains';
        case 9
            class = 'Food';
        otherwise
            class = '???';
    end
    location = sprintf('image.orig/%d.jpg',index4(i+1)-1);
    name = sprintf('image %d, class = %s',i+1,class);
    subplot(2,4,i+1); imshow(location); title(name);    
end
sgtitle('CBIR new method');
i=index4;



