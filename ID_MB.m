clear all
close all
alg={'MBNSGAII','MBplusNSGAIIb','MLENSGAII'};


M=[3,2,3,3,3,4];
D=[5380,4482,5062,6472,5123,4996];
Prob={'FOUR_ROOM_V0','FISHWOOD_V0','MINECART_V0','MO_ANT_V4','MO_HOPPER_V4','DRL15'};

MBv=[];
raw =[];

for j=1:length(alg)
    for i=1:length(Prob)
        for l=1:21
            A=load(['Data/',alg{j},'/',alg{j},'_',Prob{i},'_M',num2str(M(i)),'_D',num2str(D(i)),'_','MB',num2str(l),'.mat']);
            AA=A.deepc;
            MBv(l) = numel(AA{1});
           clear A AA      
        end
        temp = mean(MBv); 
        stemp = std(MBv);
        ID{i,j} = temp;
        ID_std{i,j} =stemp;
        raw{i} = MBv;
        clear MBv
    end
end