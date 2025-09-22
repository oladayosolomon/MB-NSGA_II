function d = MLE_ID(X, k)
    N = size(X,1);
    Dists = squareform(pdist(X));
    Dists = sort(Dists,2);
    Dk = Dists(:,2:k+1);
    logs = log(Dk ./ repmat(Dk(:,k),1,k));
    d   = -1 / mean(mean(logs,2));
    d   = max(1, round(d));   % round to integer >= 1
end
