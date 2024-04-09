# AHP

## function

### `is_judge_martix`

```matlab
function res=isJudgeMatrix(Matrix_, n)
```

- 功能简介：工具函数之一，判断传入矩阵左上角的n*n的分块矩阵是否是一个AHP中的判断矩阵
- 参数：传入一个矩阵以及一个维度n
- 返回值：返回一个逻辑值，当值为1时，其是一个合法的判断矩阵，值为0则不是
- 当函数传入的矩阵维度小于n时，会导致数组越界的运行时错误

### `ahp_*`

```matlab
function [status, Weight, lambda_max, eigenvec_match_eigenvalue, CI, CR]=ahp_*(judge_matrix, n)
```

- 功能简介，重要函数，计算层次分析法AHP的相关值
- 注意这边的*对应三种方法，其中内容类似
- 从左到右一共6个参数分别为：状态，权重矩阵，最大特征值，最大特征值对应的特征向量，一致性指标CI，一致性比率CR
- status表示是否计算成功的状态，成功则返回1，否则返回0，报错时也会提示0，此时后面得到的其余数据不具有有效意义
- 一致性比率CR计算出小于0.1时，会提示重写矩阵，并且此时status返回0，代表无意义

### `ahp`

```matlab
function [status, Weight]=ahp(judge_matrix, n)
```

- 功能简介，重要函数，计算层次分析法AHP最终所得到的权重值
- 相比上面的三个函数，这个函数只会返回status和权重值，如果有错误，需要三个函数一起使用