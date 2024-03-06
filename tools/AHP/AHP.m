function [status, Weight]=AHP(judge_matrix, n)
Weight = 0;

[status_1, Weight_1, ~, ~, ~, ~]=AHP_arithmetic_average(judge_matrix, n);
[status_2, Weight_2, ~, ~, ~, ~]=AHP_geometric_average(judge_matrix, n);
[status_3, Weight_3, ~, ~, ~, ~]=AHP_eigenvalue(judge_matrix, n);

status=status_1&&status_2&&status_3;
if(~status)
    return;
end

Weight=(Weight_1+Weight_2+Weight_3)./3;