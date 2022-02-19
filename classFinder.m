function [class] = classFinder(imName)
temp = fix(imName/100);
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
return;
