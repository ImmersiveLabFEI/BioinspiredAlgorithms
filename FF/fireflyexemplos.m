


function fireflyexemplos(ind,L)

close all

path = strcat('D:\Dropbox\MidiaDataSet\Berkeley-new 300\gray\imgo',num2str(ind),'.jpg'); 

im0 = imread(path);

H = psrGrayHistogram(im0);

plot(H)

bests = gpsFireflyThresholds(H,L,50,100,'TE');

im1 = psrMultiLimiarizacao(im0,bests,1);

figure;
imshow(im1)