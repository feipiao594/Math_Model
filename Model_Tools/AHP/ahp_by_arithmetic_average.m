function [status, Weight, lambda_max, eigenvec_match_eigenvalue, CI, CR]=ahp_arithmetic_average(judge_matrix, n)
status=false;
CI=0; CR=0; lambda_max=0;
eigenvec_match_eigenvalue=0;
Weight = 0;
RI=[0,0,0.52,0.89,1.12,1.26,1.36,1.41,1.46,1.49,1.52,1.54,1.56,1.58,1.59];

if (~isJudgeMatrix(judge_matrix, n))
    return;
end

matrix_ = judge_matrix(1:1:n,1:1:n);
matrix__ = matrix_./repmat(sum(matrix_),n,1);
matrix___ = sum(matrix__,2);
eigenvec_match_eigenvalue=matrix___/sum(matrix___);
lambda_max=sum((matrix_*eigenvec_match_eigenvalue)./eigenvec_match_eigenvalue)/n;

CI=(lambda_max-n)/(n-1);
CR=CI/(RI(n));

if CR>=0.1
   disp("ERROR: Consistency test is not passed, the judgment matrix needs to be reconstructed")
   return;
end

Weight = eigenvec_match_eigenvalue./sum(eigenvec_match_eigenvalue);
status=true;