function [UnDiffusedVector] = UnDiffuseImageMICML5(InputVector, numIterPWLCMDiffusion, paramPWLCMDiffusion, valDiffusion)

InputVector = double(InputVector);
InputVectorSize = length(InputVector);

% Use compound chaotic map
% But for now just use PWLCM

Phi = zeros(1, InputVectorSize);
Phi(1) = 0.395;
for k=2:InputVectorSize
%     Phi(k) = PiecewiseChaoticMap(Phi(k-1), paramPWLCMDiffusion, numIterPWLCMDiffusion);
      Phi(k) = PWLCM(numIterPWLCMDiffusion,paramPWLCMDiffusion,Phi(k-1));
end

% Digitize the chaotic values 
for k=1:InputVectorSize
    Phi(k) = floor(Phi(k)*255);
end

% I(0) = S
C(1) = valDiffusion; % between 0 - 255
I=zeros(1,InputVectorSize);

for k=InputVectorSize:-1:2
    I(k) = bitxor(Phi(k),InputVector(k));
    I(k) = bitxor(I(k),InputVector(k-1));
    I(k) = mod(I(k) - Phi(k) + 256, 256);
end

I(1) = bitxor(Phi(1),InputVector(1));
I(1) = bitxor(I(1),C(1));
I(1) = mod(I(1) - Phi(1) + 256, 256);

UnDiffusedVector = I;