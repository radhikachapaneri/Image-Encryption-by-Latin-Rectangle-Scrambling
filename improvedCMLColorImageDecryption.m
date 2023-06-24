%This function  is used for color image decryption using improved chaotic
%map lattice.(CML)
% Input to the function is Encrypted image, number of iterations and logistic
% control parameter for logistic function and number of cycles.
%
function DecryptedImage = improvedCMLColorImageDecryption(encryptedImage,numOfIterations,logisticControlParameter,numOfCycles)

% Separation of Red, green and blue planes.
PR = encryptedImage(:,:,1);
PG = encryptedImage(:,:,2);
PB = encryptedImage(:,:,3);

%Calling improved CML decryption function in raster form for all the three
%planes
EncryptedImageRed = improvedCMLDecryptionRaster(PR,numOfIterations,logisticControlParameter,numOfCycles);
EncryptedImageGreen = improvedCMLDecryptionRaster(PG,numOfIterations,logisticControlParameter,numOfCycles);
EncryptedImageBlue = improvedCMLDecryptionRaster(PB,numOfIterations,logisticControlParameter,numOfCycles);

% Superimposing all three planes to get decrypted color image
 DecryptedImage(:,:,1) = EncryptedImageRed;
 DecryptedImage(:,:,2) = EncryptedImageGreen;
 DecryptedImage(:,:,3) = EncryptedImageBlue;