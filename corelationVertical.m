function corrvalueV =corelationVertical(image,numberOFPairs)
[row, col] = size(image);
totalPixels = row * col;
oneDimage =  twoDtooneD(image);
x = zeros(1,numberOFPairs);
y = zeros(1,numberOFPairs);
sumX = 0;
sumY = 0;

for k = 1:1:numberOFPairs
%     r = randint(1,1,[1,totalPixels]);
%     for i = 1:1:totalPixels
r = randi(totalPixels,1);
 while(r >= (totalPixels - col) && (r<totalPixels))
%             r = randint(1,1,[1,totalPixels]);
            r = randi(totalPixels,1);
 end       
        x(k) =  oneDimage(r);
        y(k) =  oneDimage(r+col);
        sumX = sumX + x(k);
        sumY = sumY + y(k);
        
%     end
end
Ex = sumX / numberOFPairs;
Ey = sumY / numberOFPairs;
sumDX = 0;
sumDY = 0;
sumCov = 0;
for j = 1:1:numberOFPairs
    sumDX = sumDX +((x(j) - Ex))^2;
    sumDY = sumDY +((y(j) - Ey))^2;
    sumCov = sumCov + ((x(j) - Ex)* (y(j) - Ey));
end
DX = sumDX / numberOFPairs;
DY = sumDY / numberOFPairs;
cov = sumCov / numberOFPairs;

 corrvalueV = cov/(sqrt(DX)* sqrt(DY));


    
    