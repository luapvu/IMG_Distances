%Read 10 mugshot images
mug1 = readImg('mugGray1.jpg');
mug2 = readImg('mugGray2.jpg');
mug3 = readImg('mugGray3.jpg');
mug4 = readImg('mugGray4.jpg');
mug5 = readImg('mugGray5.jpg');
mug6 = readImg('mugGray6.jpg');
mug7 = readImg('mugGray7.jpg');
mug8 = readImg('mugGray8.jpg');
mug9 = readImg('mugGray9.jpg');
mug10 = readImg('mugGray10.jpg');


%Store all the mugshots into a single cell array
mugArr = {mug1, mug2, mug3, mug4, mug5, mug6, mug7, mug8, mug9, mug10};

%calculate euclidean distance for each mugshot w.r.t all mugshots
eucArrMug1 = euclideanDis(mug1, mugArr);
eucArrMug2 = euclideanDis(mug2, mugArr);
eucArrMug3 = euclideanDis(mug3, mugArr);
eucArrMug4 = euclideanDis(mug4, mugArr);
eucArrMug5 = euclideanDis(mug5, mugArr);
eucArrMug6 = euclideanDis(mug6, mugArr);
eucArrMug7 = euclideanDis(mug7, mugArr);
eucArrMug8 = euclideanDis(mug8, mugArr);
eucArrMug9 = euclideanDis(mug9, mugArr);
eucArrMug10 = euclideanDis(mug10, mugArr);
%creates a 10x10 matrix holding all of the euclidean distance values
eucArr = vertcat(eucArrMug1, eucArrMug2,eucArrMug3,eucArrMug4,eucArrMug5,eucArrMug6,eucArrMug7,eucArrMug8,eucArrMug9,eucArrMug10);


%Creates an MxN array holding the mean of each cell
meanImg = meanCalc(mugArr);
stdImg = stdCalc(mugArr);

figure,imshow(meanImg);
title('Mean of mugshots');

figure,imshow(stdImg, [min(stdImg(:)), max(stdImg(:))]);
title('Standard Deviation of mugshots');

%calculate penrose distance of each mugshot w.r.t all mugshots and the mean
penArrMugMean = penroseD(meanImg, mugArr);
penArrMug1 = penroseD(mug1, mugArr);
penArrMug2 = penroseD(mug2, mugArr);
penArrMug3 = penroseD(mug3, mugArr);
penArrMug4 = penroseD(mug4, mugArr);
penArrMug5 = penroseD(mug5, mugArr);
penArrMug6 = penroseD(mug6, mugArr);
penArrMug7 = penroseD(mug7, mugArr);
penArrMug8 = penroseD(mug8, mugArr);
penArrMug9 = penroseD(mug9, mugArr);
penArrMug10 = penroseD(mug10, mugArr);
%creates a 10x10 matrix holding all of the euclidean distance values
penArr = vertcat(penArrMug1, penArrMug2,penArrMug3,penArrMug4,penArrMug5,penArrMug6,penArrMug7,penArrMug8,penArrMug9,penArrMug10);

%Comparing and calling penrose distance of objects w.r.t my mean image
class = readImg('class.jpg');
notes = readImg('notes.jpg');
bag = readImg('bag.jpg');
objArr = {class, notes, bag};
penMeanToObj = penroseD(meanImg, objArr);

%Part 2 of the assignment
%taken from lecture 8 example for FFT.
I = zeros(100,100);
I(50:100, 40:60) = 1;
F=fft2(I);
%matlab's fft function breaks the image and shifts it around, we need to
%shift if back via fftshift
shift = fftshift(F);
figure,imshow(I);
title('Image I');

figure,imshow(F);
title('FFT image F');

figure,imshow(log(abs(F)));
title('Absolute Log of image F');

figure,imshow(log(abs(F)+1));
title('Absolute Log of image F + 1');

%displaying the shifted value of fft transformation to show expected sinc function
figure,imshow(log(abs(shift)+1));
title('Shift Absolute Log of image F + 1');

%Displaying the spectrum of my mugshot 1 before and after log transformation
I2 = mug1;
mugFFT=fft2(I2);
figure,imshow(mugFFT);
title('Mugshot 1 FFT');

figure,imshow(log(abs(mugFFT)));
title('log absolute Mugshot 1 FFT');

figure,imshow(log(abs(mugFFT)+1));
title('log absolute mugshot 1 FFT + 1');

