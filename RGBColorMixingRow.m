%Function to to do color mixing og RGB value
% Input is color image
function  S = RGBColorMixingRow(inputColorImage,PWLCMControlParameter,PWLCMInitialCondition)

%Find size and number of planes of image 
[height,width,planes] = size(inputColorImage);
PWLCMValues = zeros(height);

%Genrate (3 x height) number of PWLCM values 
PWLCMValues =  PWLCMArray( 3*height,PWLCMControlParameter,PWLCMInitialCondition);

%Sort the output of PWLCM
sortedPWLCMValues = sort(PWLCMValues);

[numOfPWLCMValues] = max(size(sortedPWLCMValues));
%  T = zeros(numOfPWLCMValues);

 for i = 1:1:numOfPWLCMValues
     for j = 1:1:numOfPWLCMValues
        if(sortedPWLCMValues(i) == PWLCMValues(j))
            T(i) = j;
        end
     end
 end
 stackedColorImage = zeros(3*height,width);
 stackedColorImage = [inputColorImage(:,:,1);inputColorImage(:,:,2);inputColorImage(:,:,3)];
 
 rowScrambledImage = zeros(3*height,width);
 for i = 1:1:3*height
     row = T(i);
     rowScrambledImage(i,:) = stackedColorImage(row,:);
    
 end
 
 rowScrambledImage = uint8(rowScrambledImage);
 S = zeros(height,width,planes);
 S(:,:,1) =  rowScrambledImage(1:height,:);
 S(:,:,2) =  rowScrambledImage(height+1:2*height,:);
 S(:,:,3) =  rowScrambledImage(2*height+1:3*height,:);

