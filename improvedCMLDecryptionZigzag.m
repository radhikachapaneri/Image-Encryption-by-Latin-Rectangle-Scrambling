function DecryptedImage = improvedCMLDecryptionZigzag(encryptedImage,numOfIterations,logisticControlParameter,numOfCycles)
encryptedImage = double(encryptedImage);
[row, col] = size(encryptedImage);
oneDImage =  zigzag(encryptedImage);
totalPixels = row * col;
firstmap = oneDImage(totalPixels);
for j = 1:1:numOfCycles
for i = totalPixels:-1:1
    
          if i==1
            init = firstmap / 255;
         
        else
              init=oneDImage(i-1)/255;
          end
                             
        xn= logisticmap(numOfIterations,logisticControlParameter,init);
        oneDImage(i) = oneDImage(i) - round(xn * 255);

        if(oneDImage(i) < 0)
       oneDImage(i) = oneDImage(i) + 256;
        end
       
              
end
end
DecryptedImageZigZag = oneDImage;
DecryptedImage = izigzag(DecryptedImageZigZag ,row,col);
DecryptedImage = uint8(DecryptedImage);
