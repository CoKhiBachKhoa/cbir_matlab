function extract_feature

% data = color histogram feature; data2 = color moments
% 1-256: hito ; 257-265: moments; 266-777:color correlogram
% 1-64: hito ; 65-73: moments; 74-585:color correlogram
data = zeros(1000,256);
data2 = zeros(1000,9);
data3 = zeros(1000,512);

for ii=0:999
    imgName = sprintf('image.orig/%d.jpg',ii);
    I = imread(imgName);
    I = preprocessingImage(I);
    
    % Histogram Extraction
    data(ii+1,1:256) = histogram(I,256).Values;
    
    % extract color channels
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
    
    data2(ii+1,1:9) = [meanH meanS meanV stdH stdS stdV sknH sknS sknV];
    
    data3(ii+1,1:512) = reshape(color_auto_correlogram(I,[1 3]),[1,512]);
end
data = [data data2 data3];
save('dataset.mat', 'data');