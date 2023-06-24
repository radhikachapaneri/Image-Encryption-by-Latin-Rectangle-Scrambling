%Function to to do color mixing og RGB value
% Input is color image
function  S = RGBColorMixingColumns2DLogistic(inputColorImage,twoDLY)

%Find size and number of planes of image 
[height,width,planes] = size(inputColorImage);

%Sort the output of twoDLY
[sortedLYValues, indexLYValues] = sort(twoDLY);

stackedColorImage = zeros(height,3*width);
stackedColorImage = [inputColorImage(:,:,1),inputColorImage(:,:,2),inputColorImage(:,:,3)];
 
columnScrambledImage = zeros(height,3*width);
columnScrambledImage = stackedColorImage(indexLYValues);
columnScrambledImage = reshape(columnScrambledImage,height,3*width);
columnScrambledImage = uint8(columnScrambledImage);

S = zeros(height,width,planes);
S(:,:,1) =  columnScrambledImage(:,1:width);
S(:,:,2) =  columnScrambledImage(:,width+1:2*height);
S(:,:,3) =  columnScrambledImage(:,2*width+1:3*height);
 
 
