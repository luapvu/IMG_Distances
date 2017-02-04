%function calculates the mean of 10 images at each pixel, takes in 10 image
%matrixes
function [ meanVector ] = meanCalc( mugArr )

%determines number of mugshots being read
[mugShotTypes,numMugshots]=size(mugArr);
totalTypes = mugShotTypes; % will be 1, since i'm only importing MY mugshots
totalMugshots = numMugshots; % will be 10 in our case
sumVector = 0;
for i = 1: numMugshots
    sumVector = mugArr{i} + sumVector;

end
    meanVector = sumVector / totalMugshots;

end

