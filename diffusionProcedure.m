function C = diffusionProcedure(inputImage,seed,initialConditionLi,controlParameter,numberOfIterations)
totalPixels = max(size(inputImage));

N = 256;
C = zeros(1,totalPixels);
phi = zeros(1,totalPixels);

% y = PWLCM(numberOFIteraions,controlParameter,initialCondition)
for i = 1 : 1: totalPixels
    phi(i) = PWLCM2(numberOfIterations,controlParameter,initialConditionLi);
    phi(i) = round(phi(i) * 255);
    if i ==1
        C(i) = seed;
    else
    temp = mod((inputImage(i) + phi(i)),N);
    C(i) =  bitxor(bitxor(phi(i),temp),C(i-1));
    end

end

end