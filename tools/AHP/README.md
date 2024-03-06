# AHP

## function

### `isJudgeMartix`

```matlab
function res=isJudgeMatrix(Matrix_, n)
```

- 功能简介：工具函数之一，判断传入矩阵左上角的n*n的分块矩阵是否是一个AHP中的判断矩阵
- 参数：传入一个矩阵以及一个维度n
- 返回值：返回一个逻辑值，当值为1时，其是一个合法的判断矩阵，值为0则不是
- 当函数传入的矩阵维度小于n时，会导致数组越界的运行时错误

### `AHP`

```matlab
function [status, Weight, lambda_max, eigenvec_match_eigenvalue, CI, CR]=AHP(judge_matrix, n)
```

- 功能简介，重要函数，计算层次分析法AHP的相关值
- 从左到右一共6个参数分别为：状态，权重矩阵，最大特征值，最大特征值对应的特征向量，一致性指标CI，一致性比率CR
- status表示是否计算成功的状态，成功则返回1，否则返回0，报错时也会提示0，此时后面得到的其余数据不具有有效意义
- 一致性比率CR计算出小于0.1时，会提示重写矩阵