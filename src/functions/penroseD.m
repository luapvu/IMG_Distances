function [ penArr ] = penroseD( referenceImg, mugArr )
%determines number of mugshots being read
[mugShotTypes,numMugshots]=size(mugArr);
% will be 1, since i'm only importing MY mugshots
% will be 10 in our case
[m,n] = size(mugArr{1});

%creates a 1 row, numMugshots column vector
penDistance = [zeros(1:numMugshots)];

%converts it to a numMugshots rows, 1 column vector
penDistance = penDistance(:);
stdImg = stdCalc(mugArr);

% to take into account a standard deviation of zero. 
threshHold = 0.001;
scaledStandardDeviation = stdImg + threshHold;

for i = 1: numMugshots

%Matrix which is MxN holding the difference squared between the reference
%and compared image
difMatrix = (referenceImg - mugArr{i}).^2;
penMatrix = difMatrix./scaledStandardDeviation;
%creates an (mxn):1 vector
vector = penMatrix( : );
%sums each cell one after the other, the cumulative sum will be 
%the MxN'th element in this vector
sumVector = cumsum(vector);
%finally we square root the sum of all these values which gives the
%euclidean distance
penDistance(i) = (sumVector(m*n))^.5;
end;

%takes the ten distance values calculated for each mugshot and puts it in
%an output array, eucArr. It should be a 1x10 Array
for j =1: numMugshots
    penArr(j) = penDistance(j);
end

end

