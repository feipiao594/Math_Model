function [status, Weight]=ahp_score(judge_matrix, n)
Weight = 0;

[status_1, Weight_1, ~, ~, ~, ~]=ahp_by_arithmetic_average(judge_matrix, n);
[status_2, Weight_2, ~, ~, ~, ~]=ahp_by_geometric_average(judge_matrix, n);
[status_3, Weight_3, ~, ~, ~, ~]=ahp_by_eigenvalue(judge_matrix, n);

status=status_1&&status_2&&status_3;
if(~status)
    return;
end

Weight=(Weight_1+Weight_2+Weight_3)./3;