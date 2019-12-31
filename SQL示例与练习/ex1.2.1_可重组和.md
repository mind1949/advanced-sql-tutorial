# 1.2.1 可重组和

## 问题:
将products表中的数据按如下方式输出:
```textmate
 name_1 | name_2
--------+--------
 香蕉   | 苹果
 香蕉   | 香蕉
 香蕉   | 草莓
 香蕉   | 柠檬
 香蕉   | 西瓜
 香蕉   | 葡萄
 香蕉   | 橘子
 西瓜   | 柠檬
 西瓜   | 苹果
 西瓜   | 橘子
 西瓜   | 葡萄
 西瓜   | 西瓜
 西瓜   | 草莓
 葡萄   | 橘子
 葡萄   | 柠檬
 葡萄   | 草莓
 葡萄   | 苹果
 葡萄   | 葡萄
 草莓   | 橘子
 草莓   | 柠檬
 草莓   | 草莓
 草莓   | 苹果
 苹果   | 柠檬
 苹果   | 苹果
 苹果   | 橘子
 橘子   | 柠檬
 橘子   | 橘子
 柠檬   | 柠檬
```
**解释:**
* 因为是组和所以是无序的;
* 因为可重所以允许name_1等于name_2;

## 解法:
**使用自连接**
```sql
select p1.name as name_1, p2.name as name_2
from products as p1, products as p2
where p1.name > p2.name or p1.name = p2.name
order by p1.name desc
```


