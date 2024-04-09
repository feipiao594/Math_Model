# Topsis

## function

### `topsis_score`

```matlab
function score = topsis_score(standardizedMatrix)
```

- 功能简介：工具函数，从标准化的矩阵获得评分向量，传入的参数为**标准化后的矩阵**

## 附加说明：
使用时使用以下方式获得正向化矩阵
```matlab
B(:,1) = vector_forwardization(PointerType.Maxinum,A(:,3))
B(:,2) = vector_forwardization(PointerType.Middle,A(:,3),7)
B(:,3) = vector_forwardization(PointerType.Mininum_nonpositive,A(:,3))
B(:,4) = vector_forwardization(PointerType.Intervel,A(:,4),20,10)
```