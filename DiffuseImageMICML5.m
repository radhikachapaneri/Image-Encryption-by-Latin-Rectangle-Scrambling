function [DiffusedVector] = DiffuseImageMICML5(InputVector, numIterPWLCMDiffusion, paramPWLCMDiffusion, valDiffusion)

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
I(1) = valDiffusion; % between 0 - 255
C=zeros(1,InputVectorSize);

C(1) = mod(InputVector(1)+Phi(1),256);
C(1) = bitxor(C(1),Phi(1));
C(1) = bitxor(C(1),I(1));

for k=2:InputVectorSize
    C(k) = mod(InputVector(k)+Phi(k),256);
    C(k) = bitxor(C(k),Phi(k));
    C(k) = bitxor(C(k),C(k-1));
end

DiffusedVector = C;