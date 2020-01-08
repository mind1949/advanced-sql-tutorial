# ex1.5.2 请留意孩子的人数

## 问题:
在1.5.2 中我们求得了单位员工/孩子列表,
下面我们来求得单位员工/孩子个数列表.

## 解法:

### 解法一:
```sql
select employee,
       (case when child_1 is null then 0 else 1 end
        +
        case when child_2 is null then 0 else 1 end
        +
        case when child_3 is null then 0 else 1 end) as childs_count
    from personnel
```

### 解法二:
```sql
select p.employee, count(childs.child)
    from personnel p
        left outer join (select child_1 child from personnel
                        union
                        select child_2 child from personnel
                        union
                        select child_3 child from personnel) childs
            on childs.child in (p.child_1, p.child_2, p.child_3)
group by p.employee;
/*
 employee | count
----------+-------
 工藤     |     2
 铃木     |     1
 赤井     |     3
 吉田     |     0
(4 rows)
*/
```
