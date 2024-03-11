# Topsis

## class

### `PointerType`
- 功能简介：枚举类，标识需要正向化或者标准化的指标类型，其具有以下四种
1.极大型指标/Maxinum
2.极小型指标(存在负数)/Mininum_nonpositive
3.极小型指标(均为正数)Mininum_positive
4.区间型指标/Intervel
5.中间型指标/Middle
6.特殊枚举/Error
- PointerType.Error通常不使用，只在内部作处理，用作特殊的占位符

## function

### `vector_forwardization`

```matlab
function forward_vec = vector_forwardization(vecType, dataVector, maxOrBestdata, minData)
```

- 功能简介：工具函数，用于一个向量的正向化，传入的参数第一个为这个向量中数据的类型`PointerType`，例如对于极大型指标，传入的是`PointerType.Maxinum`，而第二个参数为具体的向量(一维)
- 如果向量不是一维的将会报错，如果向量无法与传入的`PointerType`对应将会报错(即向量中可能有负数，但标记的是极小型指标(均为正数)Mininum_positive)
- 注意，对于一个极大值指标，正向化其实就是什么都不做，返回它的本身
- 该函数可以计算所有类型，如果传入的是`PointerType.Middle`，则在maxOrBestdata(第三个参数)处传入最佳值，如果传入的是`PointerType.Intervel`，则分别传入**上界**，**下界**

#### `mustBeMatchMininumPositive`/`mustBeMatchExtraData`
```matlab
function mustBeMatchMininumPositive(vecType, vec)
function mustBeMatchExtraData(vecType, maxOrBestdata, minData)
```
- 功能简介：外部不会调用的内部函数，用于`vector_forwardization`函数的参数验证，验证是否符合MininumPositive

### `matrix_standardize`

```matlab
function retMatrix = matrix_standardize(matrix)
```

- 功能简介：工具函数，用于一个矩阵的标准化，传入的参数即为将要被标准化的矩阵

### `topsis_score`

```matlab
function score = topsis_score(standardizedMatrix)
```

- 功能简介：工具函数，从标准化的矩阵获得评分向量，传入的参数为**标准化后的矩阵**

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