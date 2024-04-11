# Single
记录单独的算法

## function

### pca_single
```matlab
function [eigenvectors_sorted,eigenvalues_sorted,eigenvalues_cumsum] = pca_single(data)
```

- 功能简介：工具函数，假设有n个样本，p个指标，n为行p为列的数据矩阵，依次输出排序后的特征向量，特征值，累计贡献度