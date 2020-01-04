# 1.4.1 修改编号缺失的检查逻辑, 使结果总返回一行数据

## 问题描述:
**准备数据:**
```sql
create table seq_tbl(
    seq int not null,
    name text not null
);
insert into seq_tbl(seq, name)
        values(1, '迪克'),
                (2, '安'),
                (3, '莱露'),
                (5, '卡'),
                (6, '玛丽'),
                (8, '本');
/*
 seq | name
-----+------
   1 | 迪克
   2 | 安
   3 | 莱露
   5 | 卡
   6 | 玛丽
   8 | 本
*/
```
若存在缺失的编号就返回 "存在缺失的编号";
若不存在缺失的编号就返回 "不存在缺失的编号";

## 解法:
```sql
select case when (select count(seq) < max(seq) from seq_tbl) then '存在缺失的编号'
       else '不存在缺失的编号' end
```
