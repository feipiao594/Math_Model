function retMatrix = matrix_standardize(matrix)
    retMatrix = matrix./ repmat(sum(matrix.*matrix).^0.5,size(matrix,1),1);
end