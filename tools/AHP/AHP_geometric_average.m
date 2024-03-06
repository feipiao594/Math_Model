function [status, Weight, lambda_max, eigenvec_match_eigenvalue, CI, CR]=AHP_geometric_average(judge_matrix, n)
status=false;
CI=0; CR=0; lambda_max=0;
eigenvec_match_eigenvalue=0;
Weight = 0;
RI=[0,0,0.52,0.89,1.12,1.26,1.36,1.41,1.46,1.49,1.52,1.54,1.56,1.58,1.59];

if (~isJudgeMatrix(judge_matrix, n))
    return;
end

matrix_ = judge_matrix(1:1:n,1:1:n);
prod_matrix_=prod(matrix_,2).^(1/n);
eigenvec_match_eigenvalue = prod_matrix_./sum(prod_matrix_);
lambda_max = sum(matrix_*eigenvec_match_eigenvalue./eigenvec_match_eigenvalue)/n;

CI=(lambda_max-n)/(n-1);
CR=CI/(RI(n));

if CR>=0.1
   disp("ERROR: Consistency test is not passed, the judgment matrix needs to be reconstructed")
   return;
end

Weight = eigenvec_match_eigenvalue./sum(eigenvec_match_eigenvalue);
status=true;