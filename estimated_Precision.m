%function main
tic
% test number
numTest = 50;
storedNumMatch = zeros(numTest,1);

for i=0:numTest-1
    location = sprintf('image.orig/%d.jpg',i);
    index = query_histAndMoments(location); close all;
    inputClass = classFinder(i);
    
    % Get 7 most relevent image base on histogram
    numMatch = 0;
    for ii = 0:6
        class = classFinder(index(ii+1));
        if strcmp(class,inputClass)
            numMatch=numMatch+1;
        end
    end
    storedNumMatch(i+1)=numMatch;
    
end

fprintf('Precision ~ %.4f\n',sum(storedNumMatch)/(numTest*7));
toc
