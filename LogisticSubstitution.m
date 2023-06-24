function C = LogisticSubstitution(P,R,para)

trun = @(x,low,high) floor(x.*10^high)-floor(x.*10^(low-1))*10^(high-low+1);
T = trun(R(:,:,1)+R(:,:,2),9,16);
gfun = @(B,F) [mod(B(1,1),F), floor(mod(B(1,2),F)), mod(B(1,3)^2,F), mod(2*B(1,4),F);...
    floor(mod(B(2,1),F)), mod(B(2,2)^2,F), mod(2*B(2,3),F),mod(B(2,4),F);...
    mod(B(3,1)^2,F), mod(2*B(3,2),F),mod(B(3,3),F),floor(mod(B(3,4),F));...
    mod(2*B(4,1),F),mod(B(4,2),F),floor(mod(B(4,3),F)),mod(B(4,4)^2,F)];
if max(P(:))>1
    F = 256;
else
    F = 2;
end
I = blkproc(T,[4,4],@(x) gfun(x,F));

switch para
    case 'encryption'
        C = mod(I+P,F);
    case 'decryption'
        C = mod(P-I,F);
end

