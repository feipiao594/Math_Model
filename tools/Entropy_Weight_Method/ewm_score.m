function score = ewm_score(standardizedMatrix)
    n = size(standardizedMatrix,1);
    if ~(min(standardizedMatrix)<=1)
        eid = 'Size:notstandardizedMatrix';
        msg = 'The matrix input must be a standardized matrix.';
        error(eid,msg)
    end
    [n,m]=size(standardizedMatrix);
    proportion=zeros(n,m);
    for i=1:n
        for j=1:m
            proportion(i,j)=standardizedMatrix(i,j)/sum(standardizedMatrix(:,j));
        end
    end
    k=1/log(n);
    entropy_weight=zeros(1,m);
    for j=1:m
        entropy_weight(j)=-k*sum(proportion(:,j).*log(proportion(:,j)));
    end
    disp(entropy_weight);
    coefficient_variation=ones(1,m)-entropy_weight; % caculate coefficient of variation(dj)
    score=coefficient_variation./sum(coefficient_variation);
end