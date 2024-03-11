function score = topsis_score(standardizedMatrix)
    n = size(standardizedMatrix,1);
    if ~(min(standardizedMatrix)<=1)
        eid = 'Size:notstandardizedMatrix';
        msg = 'The matrix input must be a standardized matrix.';
        error(eid,msg)
    end
    D_plus = sum((standardizedMatrix-repmat(max(standardizedMatrix),n,1)).^2,2).^0.5;
    D_minus = sum((standardizedMatrix-repmat(min(standardizedMatrix),n,1)).^2,2).^0.5;
    score_ = D_minus ./ (D_plus + D_minus);
    score = score_ ./ sum(score_);
end