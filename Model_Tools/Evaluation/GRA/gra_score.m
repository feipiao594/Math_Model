function [score, zeta] = gra_score(type_vec, data_matrix, rho)
    arguments
        type_vec (:, 1) GRANomalizeType 
        data_matrix {mustBeMatchRow(type_vec, data_matrix)}
        rho (1,1) {mustBeGreaterThanOrEqual(rho,0),mustBeLessThanOrEqual(rho,1)}
    end
    
    [n, ~] = size(type_vec);
    seq = data_matrix;
    for i = 1 : n
        seq(i,:) = gra_vec_normalization(data_matrix(i,:), type_vec(i,1));
    end
    
    global_min = min(min(abs(seq(2:end,:) - repmat(seq(1,:), [n - 1, 1]))));
    global_max = max(max(abs(seq(2:end,:) - repmat(seq(1,:), [n - 1, 1]))));
    
    zeta = seq(2:end,:);
    
    for i = 2 : n
        zeta(i, :) = (global_min + rho * global_max) ./ (abs(seq(1,:) - seq(i,:)) + rho * global_max);
    end
    
    score_ = mean(zeta,2);
    score = score_ / sum(score_);
end


function mustBeMatchRow(type_vec, data_matrix)
    [M_,~]=size(type_vec);
    [M,~]=size(data_matrix);
    if(M ~= M_)
        eidType = 'mustBeMatchRow:notEqRow';
        msgType = 'Input type_vec cannot match with the data_matrix.';
        error(eidType,msgType)
    end
end