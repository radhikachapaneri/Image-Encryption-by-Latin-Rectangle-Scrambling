%Function to to do color mixing og RGB value
% Input is color image
function  S = RGBColorMixingRow2DLogistic(inputColorImage,twoDLX)

%Find size and number of planes of image 
[height,width,planes] = size(inputColorImage);

%Sort the output of twoDLX
[sortedLXValues, indexLXValues] = sort(twoDLX);

stackedColorImage = zeros(3*height,width);
stackedColorImage = [inputColorImage(:,:,1);inputColorImage(:,:,2);inputColorImage(:,:,3)];
 
rowScrambledImage = zeros(3*height,width);
rowScrambledImage = stackedColorImage(indexLXValues);
rowScrambledImage = reshape(rowScrambledImage,3*height,width);
rowScrambledImage = uint8(rowScrambledImage);

S = zeros(height,width,planes);
S(:,:,1) =  rowScrambledImage(1:height,:);
S(:,:,2) =  rowScrambledImage(height+1:2*height,:);
S(:,:,3) =  rowScrambledImage(2*height+1:3*height,:);

