 function EncryptedImage = improvedCMLEncryptionZigzag(originalImage,numOfIterations,logisticControlParameter,numOfCycles,seed,diffusionInitialCondition,diffusioncontrolParameter,diffusionIterations)

[row, col] = size(originalImage);
oneDImage =  zigzag(originalImage);
totalPixels = row * col;
for j = 1:1:numOfCycles
for i = 1:1:totalPixels
    
          if i==1 
            init = oneDImage(totalPixels)/255;
         
        else
              init=oneDImage(i-1)/255; 
          end
                             
%         xn= logisticmap(numOfIterations,logisticControlParameter,init);
        xn= PWLCM2(numOfIterations,logisticControlParameter,init);
        oneDImage(i) = oneDImage(i) + round(xn * 255);

        if(oneDImage(i) > 255)
       oneDImage(i) = oneDImage(i) - 256;
        end
       
              
end
oneDImage = diffusionProcedure(oneDImage,seed,diffusionInitialCondition,diffusioncontrolParameter,diffusionIterations);
end

EncryptedImageZigZag = oneDImage;
EncryptedImage = izigzag(EncryptedImageZigZag ,row,col);
EncryptedImage = uint8(EncryptedImage);

 