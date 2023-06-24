%Function to to do color mixing og RGB value
% Input is color image
function  S = RGBColorMixingColumns(inputColorImage,PWLCMControlParameter,PWLCMInitialCondition)

%Find size and number of planes of image 
[height,width,planes] = size(inputColorImage);
PWLCMValues = zeros(3*width);

%Genrate (3 x height) number of PWLCM values 
PWLCMValues =  PWLCMArray( 3*width,PWLCMControlParameter,PWLCMInitialCondition);

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
 
 stackedColorImage = zeros(height,3*width);
 stackedColorImage = [inputColorImage(:,:,1),inputColorImage(:,:,2),inputColorImage(:,:,3)];
 
 columnScrambledImage = zeros(height,3*width);
 for i = 1:1:3*width
     column = T(i);
     columnScrambledImage(:,i) = stackedColorImage(:,column);
    
 end
 S = zeros(height,width,planes);
 S(:,:,1) =  columnScrambledImage(:,1:width);
 S(:,:,2) =  columnScrambledImage(:,width+1:2*height);
 S(:,:,3) =  columnScrambledImage(:,2*width+1:3*height);
 
 
