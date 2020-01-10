# ex1.6.1 简化多行数据的比较

## 简化 1.6.2中的sql语句:
原本的sql语句:
```sql
select s1.year,
    s1.sale,
    case when s1.sale = (select sale from sales s2 where s2.year+1 = s1.year) then '→'
        when s1.sale > (select sale from sales s2 where s2.year+1 = s1.year) then '↑'
        when s1.sale < (select sale from sales s2 where s2.year+1 = s1.year) then '↓'
    else '▬' end var
    from sales s1;
```
上述三个when子句里, 同样的子查询执行了三次, 尝试将他们整合到一个when子句中, 从而提升性能

## 解法:
```sql
select s1.year,
    s1.sale,
    case sign(s1.sale - (select sale
                            from sales s2
                        where s2.year+1 = s1.year))
        when 0 then '→'
        when 1 then '↑'
        when -1 then '↓'
    else '▬' end var
    from sales s1;
```
**解析:**
> 这里使用了sign数学函数

## 参考资料: 
* [postgresql中的数学运算符与数学函数](https://www.postgresql.org/docs/9.1/functions-math.html)
