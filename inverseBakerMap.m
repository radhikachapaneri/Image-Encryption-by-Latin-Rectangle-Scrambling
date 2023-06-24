function newImage = inverseBakerMap(inputImage,numOfIterations)
[height,width] = size(inputImage);
newImage = zeros(height,width);
% newLocation = zeros(height,width);
for k = 1:1:numOfIterations
for i = 1:1:height
    for j = 1:1:width
        newi = i-1;
        newj = j -1;
        if newj<= (height/2)-1
            newLocationi =floor(newi/2);
            newLocationj = 2*newj+mod(newi,2);
%             newImage(i,j) = inputImage((2*newi+mod(newj,2)),floor(newj/2));
        end
        if (newj>=height/2) && (newj <= height -1)
            newLocationi =floor((newi+width)/2);
            newLocationj = 2*newj-height+mod(newi,2);
%              newLocation(newi,newj) = inputImage((2*newi-width+mod(newj,2)),floor(newj+height/2));
        end
        newImage(i,j) = inputImage(newLocationi+1,newLocationj + 1);
            
    end
end 
inputImage = newImage;
end
