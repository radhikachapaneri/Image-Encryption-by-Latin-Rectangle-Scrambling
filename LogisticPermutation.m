function C = LogisticPermutation(P,R,para)

C0 = zeros(size(P));
C = C0;
switch para
    case 'encryption'
        % 1. Shuffling within a Column
        [v,Epix] = sort(R(:,:,1),1);
        for i = 1:size(R,1)
            C0(:,i) = P(Epix(:,i),i);
        end
        % 2. Shuffling within a Row
        [v,Epiy] = sort(R(:,:,2),2);
        for j = 1:size(R,2)
            C(j,:) = C0(j,Epiy(j,:));
        end
    case 'decryption'
        % 1. Shuffling within a Row
        [v,Epiy] = sort(R(:,:,2),2);
        for j = 1:size(R,2)
            C0(j,Epiy(j,:)) = P(j,:);
        end
        % 2. Shuffling within a Column
        [v,Epix] = sort(R(:,:,1),1);
        for i = 1:size(R,1)
            C(Epix(:,i),i) = C0(:,i);
        end
end