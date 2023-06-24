clc;

I=imread('peppers.tif');
[height width planes] = size(I);

K = round(rand(1,256));
% Translate K to map formats
transFrac = @(K,st,ed) sum(K(st:ed).*2.^(-(1:(ed-st+1))));
x0 = transFrac(K,1,52);
y0 = transFrac(K,53,104);
r = transFrac(K,105,156)*.08+1.11;
T = transFrac(K,157,208);
turb = blkproc(K(209:256),[1,8],@(x) bi2de(x));

% 2D Logistic map
Logistic2D = @(x,y,r) [r*(3*y+1)*x*(1-x), r*(3*(r*(3*y+1)*x*(1-x))+1)*y*(1-y)];
format long eng

MN = numel(I(:,:,1));
tx0 = mod(log(turb(mod(1-1,6)+1)+1)*x0+T,1);
ty0 = mod(log(turb(mod(1-1,6)+1)+1)*y0+T,1);
xy = zeros(MN,2);
for n = 1:MN
    if n == 1
        xy(n,:) = abs(Logistic2D(tx0,ty0,r)); 
    else
        xy(n,:) = abs(Logistic2D(xy(n-1,1),xy(n-1,2),r));
    end
end
A = cat(3,reshape(xy(:,1),size(I(:,:,1),1),size(I(:,:,1),2)),reshape(xy(:,2),size(I(:,:,1),1),size(I(:,:,1),2)));

%% Encryption
I=double(I);
S = RGBColorMixingRow(I,0.3,0.25);
S = RGBColorMixingColumns(S,0.1,0.4);

R = S(:,:,1);
G = S(:,:,2);
B = S(:,:,3);

% R component
% C = LogisticSubstitution(R,A,'encryption');
C = R;
Rone = twoDtooneD(C);
[RDiffusedVector] = DiffuseImageMICML5(Rone, 45, 0.15, 100);
Rtwo = oneDtotwoD(RDiffusedVector,height,width);
Rtwo = uint8(Rtwo);

% G component
% C = LogisticSubstitution(G,A,'encryption');
C = G;
Gone = twoDtooneD(C);
[GDiffusedVector] = DiffuseImageMICML5(Gone, 45, 0.15, 100);
Gtwo = oneDtotwoD(GDiffusedVector,height,width);
Gtwo = uint8(Gtwo);

% B component
% C = LogisticSubstitution(B,A,'encryption');
C = B;
Bone = twoDtooneD(C);
[BDiffusedVector] = DiffuseImageMICML5(Bone, 45, 0.15, 100);
Btwo = oneDtotwoD(BDiffusedVector,height,width);
Btwo = uint8(Btwo);

E=zeros(height,width,planes);
E(:,:,1) = Rtwo;
E(:,:,2) = Gtwo;
E(:,:,3) = Btwo;

imwrite(uint8(E),'colorenc.tif');


%% Differential NPCR
J = I;
J(1,1,:)=128;
S2 = RGBColorMixingRow(J,0.3,0.25);
S2 = RGBColorMixingColumns(S2,0.1,0.4);

R2 = S2(:,:,1);
G2 = S2(:,:,2);
B2 = S2(:,:,3);

% R component
% C2 = LogisticSubstitution(R2,A,'encryption');
C2 = R2;
R2one = twoDtooneD(C2);
[R2DiffusedVector] = DiffuseImageMICML5(R2one, 45, 0.15, 100);
R2two = oneDtotwoD(R2DiffusedVector,height,width);
R2two = uint8(R2two);

% G component
% C2 = LogisticSubstitution(G2,A,'encryption');
C2 = G2;
G2one = twoDtooneD(C2);
[G2DiffusedVector] = DiffuseImageMICML5(G2one, 45, 0.15, 100);
G2two = oneDtotwoD(G2DiffusedVector,height,width);
G2two = uint8(G2two);

% B component
% C2 = LogisticSubstitution(B2,A,'encryption');
C2 = B2;
B2one = twoDtooneD(C2);
[B2DiffusedVector] = DiffuseImageMICML5(B2one, 45, 0.15, 100);
B2two = oneDtotwoD(B2DiffusedVector,height,width);
B2two = uint8(B2two);

E2=zeros(height,width,planes);
E2(:,:,1) = R2two;
E2(:,:,2) = G2two;
E2(:,:,3) = B2two;

imwrite(uint8(E2),'colorenc2.tif');

npcrR = NPCR(R2,R2two)
npcrG = NPCR(G2,G2two)
npcrB = NPCR(B2,B2two)

