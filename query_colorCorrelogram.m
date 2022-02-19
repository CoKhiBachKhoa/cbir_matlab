function [i] = query_colorCorrelogram(inputImg)
load('dataset.mat')

% Input image
%inputImg = imgetfile;
inputImg = imread(inputImg);
I=preprocessingImage(inputImg);

queryFeature = reshape(color_auto_correlogram(I,[1 3]),[1,512]);

% Canberra distance between feature = sum(abs(x_i-y_i)/(abs(x_i)+abs(y_i)))
canberra = zeros(1000,1);

for i=0:999
    sumall = 0;
    for ii=1:512
        sumall = sumall + abs(queryFeature(ii)-data(i+1,73+ii));%/(abs(queryFeature(ii))+abs(data(i+1,265+ii)));
    end
    canberra(i+1)=sumall;
end

[result, index] = sortrows(canberra,1,'ascend');

% figure
% subplot(2,4,1); imshow(hsv2rgb(I)); title('Origin image');
% 
% for i= 1:7
%     temp = fix(index(i+1)/100);
%     switch temp
%         case 0
%             class = 'Africa';
%         case 1
%             class = 'Beach';
%         case 2
%             class = 'Buildings';
%         case 3
%             class = 'Buses';
%         case 4
%             class = 'Dinosaurs';
%         case 5
%             class = 'Elephants';
%         case 6
%             class = 'Flowers';
%         case 7
%             class = 'Horses';
%         case 8
%             class = 'Mountains';
%         case 9
%             class = 'Food';
%         otherwise
%             class = '???';
%     end
%     location = sprintf('image.orig/%d.jpg',index(i+1)-1);
%     name = sprintf('image %d, class = %s',i+1,class);
%     subplot(2,4,i+1); imshow(location); title(name);    
% end
% sgtitle('CBIR by color correlogram');
i = index;