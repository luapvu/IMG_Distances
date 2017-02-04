%function calculates the standard deviation of 10 images at each pixel, takes in 10 image
%matrixes
function [ standardDevationVector ] = stdCalc(mugArr )
%determines number of mugshots being read
[mugShotTypes,numMugshots]=size(mugArr);
% will be 1, since i'm only importing MY mugshots
% will be 10 in our case

%creates an image matrix that will hold the standardDeviation values

mean = meanCalc(mugArr);
imgDevationSquaredTotal= 0;

for i = 1:numMugshots
    %subtract the value at each pixel with the calcualted mean at each
    %pixel, squares the differences and sums this with all 10 image
    %devations. The mean is then taken by dividing by the total amount of
    %images, 10 which gives the standard deviation vector.
     imgDevationSquaredTotal = ((mugArr{i} - mean).^2) + imgDevationSquaredTotal;

end
%divide by total amount of mugshots and square root
standardDevationVector = (imgDevationSquaredTotal ./ numMugshots).^.5;
end

