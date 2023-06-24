function corrvalueH =corelationHorizontal(image,numberOFPairs)
[row, col] = size(image);
totalPixels = row * col;
oneDimage =  twoDtooneD(image);
x = zeros(1,numberOFPairs);
y = zeros(1,numberOFPairs);
sumX = 0;
sumY = 0;

for k = 1:1:numberOFPairs
%     r = randi(totalPixels,1);
    r = randint(1,1,[1,totalPixels]);
%     for i = 1:1:totalPixels
        if mod(r,col) == 0
%         if r ==  totalPixels
%             r = randi(totalPixels,1);
            r = randint(1,1,[1,totalPixels]);
        end
        x(k) =  oneDimage(r);
        y(k) =  oneDimage(r+1);
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

 corrvalueH = cov/(sqrt(DX)* sqrt(DY));


    
    