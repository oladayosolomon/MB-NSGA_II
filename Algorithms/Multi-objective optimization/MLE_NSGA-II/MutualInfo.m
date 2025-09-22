function mi = MutualInfo(x, y, nbins)
% Estimate mutual information between scalar x and y
% x, y : column vectors
% nbins : number of bins for discretization

    if nargin < 3
        nbins = 10;
    end

    % Discretize
    xbins = discretize(x, nbins);
    ybins = discretize(y, nbins);

    % Joint histogram
    jointHist = accumarray([xbins ybins],1,[nbins nbins]);
    jointProb = jointHist / sum(jointHist(:));

    % Marginals
    px = sum(jointProb,2);
    py = sum(jointProb,1);

    % MI computation
    [Xind,Yind] = find(jointProb>0);
    mi = 0;
    for k = 1:length(Xind)
        i = Xind(k); j = Yind(k);
        mi = mi + jointProb(i,j) * log(jointProb(i,j)/(px(i)*py(j)));
    end
end
