function output = preprocessingImage(input)

%% Preprocessing
% Gaussian filter std = 0.5
I = imgaussfilt(input);

% Resize to a correct ratio
[m,n,~]=size(I);
if m*n ~=384*256
    if m>n
        I1(:,:,1)=imresize(I(:,:,1),[384 256]);
        I1(:,:,2)=imresize(I(:,:,2),[384 256]);
        I1(:,:,3)=imresize(I(:,:,3),[384 256]);
        I=I1;
    else
        I1(:,:,1)=imresize(I(:,:,1),[256 384]);
        I1(:,:,2)=imresize(I(:,:,2),[256 384]);
        I1(:,:,3)=imresize(I(:,:,3),[256 384]);
        I=I1;
    end
end
    
% Quantization
numberOfLevels = 8;
threshRGB = multithresh(I,numberOfLevels-1);
value = [0 threshRGB(2:end) 255]; 
I = imquantize(I, threshRGB, value);

% [Iquant,cmap] = rgb2ind(I,numberOfLevels);
% Iquant = ind2rgb(Iquant,cmap);
% Iquant = im2uint8(Iquant);
% Ihsv = rgb2hsv(Iquant);

Ihsv = rgb2hsv(I);

% Create threshold to remove outliner
% lower_mask = Ihsv(:,:,3) > graythresh(rgb2gray(I));
% upper_mask = Ihsv(:,:,3) < 0.99;
% mask = lower_mask.*upper_mask;
% mask = double(mask);
% [m,n,~]=size(I);
% Inew = zeros(m,n,3);
% for i=1:3
%     Inew(:,:,i) = mask.*Ihsv(:,:,i);
% end


output = Ihsv;