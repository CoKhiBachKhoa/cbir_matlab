function [i] = query_Hist(inputImg)
%clc;    % Clear the command window.
%close all;  % Close all figures (except those of imtool.)
%clear;  % Erase all existing variables. Or clearvars if you want.
%workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
fontSize = 15;
load('dataset.mat')

% Input image
%inputImg = imgetfile;
inputImg = imread(inputImg);
inputImg = preprocessingImage(inputImg);

imHist = histogram(inputImg,256);

result = zeros(1000,1);
for i = 1:1000
    intersect = 0;
    for ii = 1:256
        intersect = intersect + min(imHist.Values(ii),data(i,ii));
    end    
    result(i) = intersect;
end

% Value & index for comparison intersect
[result, index] = sortrows(result,'descend');

figure
subplot(2,4,1); imshow(hsv2rgb(inputImg)); title('Origin image'); 
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
sgtitle('CBIR by histogram intersection');
i = index;



