function [eigenvectors_sorted,eigenvalues_sorted,eigenvalues_cumsum] = pca_single(data)
    [n,~] = size(data);
    data_mean = repmat(mean(data,1),n);
    data_std = rempat(std(data,1),n);
    
    stand_data = (data - data_mean) ./ data_std;
    covariance_matrix = cov(stand_data);
    [eigenvectors, eigenvalues] = eig(covariance_matrix);
    eigenvalues_list = zeros(1,n);
    for i = 1:n
        eigenvalues_list(1,i) =  eigenvalues(i,i);
    end
    [eigenvalues_sorted, index] = sort(eigenvalues_list, 'descend');
    eigenvectors_sorted = eigenvectors(:,index);
    eigenvalues_sorted_ = eigenvalues_sorted ./ sum(eigenvalues_sorted);
    eigenvalues_cumsum = cumsum(eigenvalues_sorted_);
end

