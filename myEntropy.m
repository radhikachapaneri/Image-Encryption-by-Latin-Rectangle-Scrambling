%Calculate entropy of an image
function H = myEntropy(I)
[height,width] = size(I);
prob = zeros(1,256);
for i = 1: height
    for j = 1: width
        value = I(i, j)+1;
        prob(1,value) = prob(1,value)+1;
    end
end
prob = prob./(height*width);
sum = 0;
for i = 1:256
    if (prob(1,i)~=0)
        sum = sum + prob(1,i)*log2(prob(1,i));
    end
end
H = -sum;


