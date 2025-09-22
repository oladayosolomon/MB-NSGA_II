classdef MBNSGAII < ALGORITHM
% <multi> <real/integer/label/binary/permutation> <constrained/none>
% Nondominated sorting genetic algorithm II

%------------------------------- Reference --------------------------------
% K. Deb, A. Pratap, S. Agarwal, and T. Meyarivan, A fast and elitist
% multiobjective genetic algorithm: NSGA-II, IEEE Transactions on
% Evolutionary Computation, 2002, 6(2): 182-197.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2023 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

    methods
        function main(Algorithm,Problem)
            %% Generate random population
            Population = Problem.Initialization();
            [~,FrontNo,CrowdDis] = EnvironmentalSelection(Population,Problem.N);
            count = 0;
            folder = fullfile('D:\MBDRL\PlatEMO\Data',class(Algorithm));
            UMB    = LSMB(Population,Problem);

            %% Optimization
            while Algorithm.NotTerminated(Population)
                count= count+1;
                MatingPool = TournamentSelection(2,Problem.N,FrontNo,-CrowdDis);
                %Offspring  = OperatorGA(Problem,Population(MatingPool));
                Offspring  = OperatorGAhalfMB(Problem,Population(MatingPool),UMB);
                [Population,FrontNo,CrowdDis] = EnvironmentalSelection([Population,Offspring],Problem.N);
                deepc{count} = UMB;
        if Problem.FE >= Problem.maxFE
             runNo  = 1;
             file   = fullfile(folder,sprintf('%s_%s_M%d_D%d_%s',class(Algorithm),class(Problem),Problem.M,Problem.D,'MB'));
             while exist([file,num2str(runNo),'.mat'],'file') == 2
                runNo = runNo + 1;
            end
            save([file, num2str(runNo),'.mat'],"deepc");
        end
            end
        end
    end
end