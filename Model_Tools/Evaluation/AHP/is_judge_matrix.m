function res=is_judge_matrix(Matrix_, n)
res=false;
if(n<2)
    disp("ERROR: The matrix dimension is less than 2")
    return;
end
for i=1:1:n
    if (Matrix_(i,i) ~= 1)
        disp("ERROR: A matrix is not a reflexive matrix")
        return;
    end
end
for i=1:1:n-1
    for j=i+1:1:n 
        if(abs(Matrix_(i,j)*Matrix_(j,i)-1)>0.0001 || Matrix_(i,j)<1/9 || Matrix_(i,j)>9)
            disp("ERROR: The element of matrix x cannot satisfy 1/9 <= x <= 9 ")
            return;
        end
    end
end
res=true;