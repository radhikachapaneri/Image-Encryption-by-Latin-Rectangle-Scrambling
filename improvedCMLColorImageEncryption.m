%This function  is used for color image encryption using improved chaotic
%map lattice.
% Input to the function is PlainImage,number of iterations and logistic
% control parameter for logistic function and number of cycles.
%
function EncryptedImage = improvedCMLColorImageEncryption(PlainImage,numOfIterations,logisticControlParameter,numOfCycles)

% Separation of Red, green and blue planes.
PR = PlainImage(:,:,1);
PG = PlainImage(:,:,2);
PB = PlainImage(:,:,3);

%Calling improved CML encryption function in raster form for all the three
%planes
EncryptedImageRed = improvedCMLEncryptionRaster(PR,numOfIterations,logisticControlParameter,numOfCycles);
EncryptedImageGreen = improvedCMLEncryptionRaster(PG,numOfIterations,logisticControlParameter,numOfCycles);
EncryptedImageBlue = improvedCMLEncryptionRaster(PB,numOfIterations,logisticControlParameter,numOfCycles);

% Superimposing all three planes to get encrypted color image
 EncryptedImage(:,:,1) = EncryptedImageRed;
 EncryptedImage(:,:,2) = EncryptedImageGreen;
 EncryptedImage(:,:,3) = EncryptedImageBlue;

 
 
 
