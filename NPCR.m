function npcr = NPCR(ciphertextOne,ciphertextTwo)
[row col] = size(ciphertextOne);
totalPixels = row * col;
D = zeros(row,col);
sum = 0.0; 
for i = 1:1:row
    for j = 1:1:col
        if(ciphertextOne(i,j) == ciphertextTwo(i,j))
            D(i,j) = 0;
        else
             D(i,j) = 1;
        end
        sum = sum +  D(i,j);
     end
end
npcr = (sum / totalPixels)*100;
           
          