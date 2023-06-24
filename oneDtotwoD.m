function  X = oneDtotwoD(A,row,col)
k =1;
X = zeros(row,col);
for i = 1:1:row
    for j= 1:1:col
        X(i,j) = A(k);
        k = k+1;
    end
end
 X = uint8(X);
%end
%disp(X);