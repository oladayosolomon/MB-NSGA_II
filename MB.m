clear all
alg={'MBNSGAII','MBISDELS','MBIBEA'};
titles={'NSGA-II','ISDEplus','IBEA'};


M=[2,2,6,3,2,3,3];
D=[4612,4612,4482,5380,4482,5062,6472];
Prob={'DEEP_SEA_TREASURE_V0', 'DRL16', 'FRUIT_TREE_V0','FOUR_ROOM_V0','FISHWOOD_V0','MINECART_V0','MO_ANT_V4'};

MBv=[];

for j=1:length(alg)
    for i=1:length(Prob)
        for l=1:30
            A=load(['Data/',alg{j},'/',alg{j},'_',Prob{i},'_M',num2str(M(i)),'_D',num2str(D(i)),'_','MB',num2str(l),'.mat']);
            AA=A.deepc;
            %AA(cellfun(@isempty, AA)) = {0};
            for k = 1:numel(AA)
            MBv(l,k) = numel(AA{k});
            end
           clear A AA      
        end
        temp = mean(MBv); 
        clear MBv
        tempp{i,j} = temp;
    end
end


for k=1:7
Data1{k} = tempp{k,1};
Data2{k} = tempp{k,2};
Data3{k} = tempp{k,3};
end 




% MATLAB script to draw a heat map for a given array

% Sample data (replace with your own array)
data = [Data1{1,4};Data2{1,4};Data3{1,4}]; % 10x10 random matrix

% Create heat map

% Create heat map
figure;
colormap parula

h = heatmap(round(data),Colormap=turbo);
h.CellLabelFormat = '%.0f'; % Display values with 2 decimal places
h.ColorbarVisible = 'off';


title('Heat Map');
xlabel('X-axis');
ylabel('Y-axis');

title('Heat Map');
xlabel('X-axis');
ylabel('Y-axis');


for k =1:7
BM(k) = round(mean(Data1{1,k}));
SMB(k) = std(Data1{1,k});
PBM(k) = (D(k)-BM(k))/D(k);
end


