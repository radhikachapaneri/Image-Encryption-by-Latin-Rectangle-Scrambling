function uaci = UACI(ciphertextOne,ciphertextTwo)
ciphertextOne = double(ciphertextOne);
ciphertextTwo = double(ciphertextTwo);
[row col] = size(ciphertextOne);
F = 255;
totalPixels = row * col;
absoluteDifference = 0.0;
% z = 0;
% z = double(z);
for i = 1:1:row
    for j = 1:1:col
%         z = abs(ciphertextOne(i,j)- ciphertextTwo(i,j));
        absoluteDifference = absoluteDifference + abs(ciphertextOne(i,j)- ciphertextTwo(i,j)); 
     end
end
uaci = (absoluteDifference /(F* totalPixels))*100;
           
          