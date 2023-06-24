function xconeDimensional = twoDtooneD(I)
[row, col] = size(I);
 xconeDimensional = zeros(1,row*col);
k =1;
for i = 1:1:row
    for j= 1:1:col
        xconeDimensional(k) = I(i,j);
        k = k + 1;
        %disp(xconeDimensional);
    end
end
% disp(xconeDimensional); 