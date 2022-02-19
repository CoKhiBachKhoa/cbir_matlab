function [i]=query_colorMoments(inputImg)
% Input: image to be analyzed and extract 3 first moments from each H,S,V
% Output: 1x9 vector containing the 3 first color momenst from each H,S,V
% channel
load('dataset.mat')

% Input image
%inputImg = imgetfile;
inputImg = imread(inputImg);
I = preprocessingImage(inputImg);

% Calculate input image's color moments
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
[result, index] = sortrows(d_com,1,'ascend');

figure
subplot(2,4,1); imshow(hsv2rgb(I)); title('Origin image'); 
for i= 1:7
    temp = fix(index(i+1)/100);
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
    location = sprintf('image.orig/%d.jpg',index(i+1)-1);
    name = sprintf('image %d, class = %s',i+1,class);
    subplot(2,4,i+1); imshow(location); title(name);    
end
sgtitle('CBIR by color moments');
i = index;



