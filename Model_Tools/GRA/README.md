# GRA
灰色关联度分析

注意这里的数据矩阵，要求以**行**为一个类型，以**列**为重复的数值
第一行代表**母序列**，其他均为**子序列**

## class

### `GRANomalizeType`
- 功能简介：枚举类，标识需要数据预处理时的方法，其具有以下两种
1.初值化(就是其他数都除以第一个数)/Initialization
2.均值化/Equalization

## function
```matlab
function [score, zeta] = gra_score(type_vec, data_matrix, rho)
```
- 功能简介：重点函数，传入数据矩阵，输出score向量与zeta矩阵
- 参数：传入一个GRANomalizeType类型的**列向量**，数据矩阵，还有一个rho
- 返回值：返回score向量与zeta矩阵

```matlab
function mustBeMatchRow(type_vec, data_matrix)
```
- 功能简介：用于arguments的检查函数，判断传入的数据矩阵与处理方法的向量是否具有相同的行数

```matlab
function ret_vec = gra_vec_normalization(vec,nomalize_type)
```
- 功能简介：工具函数之一，处理单行序列的初始化
- 参数：传入一个行序列(行向量)以及一个处理方法(即`GRANomalizeType`类型)
- 返回值：返回一个以该处理方法处理后的序列

```matlab
function ret_vec = gra_type_vec_create(data_matrix, one_type)
```
- 功能简介：便捷函数，通过传入的数据矩阵，生成一串one_type
- 参数：传入数据矩阵与一个处理方法(即`GRANomalizeType`类型)
- 返回值：返回一个可以直接传入`gra_score`函数的，所有元素均为one_type的，GRANomalizeType类型的**列向量**

