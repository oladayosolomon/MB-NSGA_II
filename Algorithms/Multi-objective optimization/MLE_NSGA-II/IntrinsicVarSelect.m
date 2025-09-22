function UMB = IntrinsicVarSelect(X, Y, method)
% X : (N x D) decision variables
% Y : (N x M) objectives
% method : 'MLE' or 'TwoNN'

    % Step 1. Estimate intrinsic dimension
    if strcmp(method,'MLE')
        d = MLE_ID(X,10);
    elseif strcmp(method,'TwoNN')
        d = TwoNN_ID(X);
    else
        error('Unknown method');
    end

    % Step 2. Compute MI score for each variable wrt all objectives
    D = size(X,2);
    M = size(Y,2);
    scores = zeros(1,D);
    for j = 1:D
        mij = zeros(1,M);
        for m = 1:M
            mij(m) = MutualInfo(X(:,j), Y(:,m), 10);
        end
        scores(j) = mean(mij);   % average MI across objectives
    end

    % Step 3. Pick top-d variables
    [~,idx] = sort(scores,'descend');
    UMB = idx(1:min(d,D));
end
