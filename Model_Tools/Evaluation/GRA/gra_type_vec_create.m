function ret_vec = gra_type_vec_create(data_matrix, one_type)
arguments
    data_matrix
    one_type (1,1) GRANomalizeType
end
    [n,~] = size(data_matrix);
    ret_vec = repmat(one_type,[n,1]);
end

