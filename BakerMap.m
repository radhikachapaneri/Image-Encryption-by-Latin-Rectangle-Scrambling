%This function implements Baker map
%Input to the function is original image and number of iterations(secret
%parameter).
%The output is scrambeed image after given numbar of iteration

function newImage = BakerMap(inputImage,numOfIterations)
% finds size of the image
[height,width] = size(inputImage);

%Initialization of new image
newImage = zeros(height,width);

for k = 1:1:numOfIterations
for i = 1:1:height
    for j = 1:1:width
        % As matlab 2D array begins from (1,1) and input to baker starts
        % from(0,0), we deduct 1 from x,y cordinates.
        newi = i-1;
        newj = j -1;
        % Formula of Baker's map
        if newi<= (width/2)-1
            newLocationi =2*newi+mod(newj,2);
            newLocationj = floor(newj/2);
        end
        if (newi>=width/2) && (newi <= width -1)

            newLocationi =2*newi-width+mod(newj,2);
            newLocationj = floor((newj+height)/2);
        end
        % Convert Baker's pixel location back to matalb notation
        newImage(i,j) = inputImage(newLocationi+1,newLocationj + 1);
            
    end
end
% For next iteration input is scrambled image of previous iteration
inputImage = newImage;
end

    