# ex1.6.2 使用overlaps查询重叠的时间区间

## 问题:
sql-92提供了overlaps谓词, 目的使用来查询重叠的时间区间.
尝试使用overlaps来改写1.6.5中使用between的地方, 并比较两者的不同.
```sql
select reserver, start_date, end_date
    from reservations s1
where exists (select *
                from reservations s2
            where s1.reserver <> s2.reserver 
                and (s1.start_date between s2.start_date and s2.end_date
                    or s1.end_date between  s2.start_date and s2.end_date
                    or (s2.start_date between s1.start_date and s1.end_date
                        and s2.end_date between  s1.start_date and s1.end_date)));
/*
 reserver | start_date |  end_date
----------+------------+------------
 荒木     | 2006-10-28 | 2006-10-31
 堀       | 2006-10-31 | 2006-11-01
 山本     | 2006-11-03 | 2006-11-04
 内田     | 2006-11-03 | 2006-11-05
(4 rows)
*/
```

## 解法:

**使用overlaps替代between:**
```sql
select reserver, start_date, end_date
    from reservations s1
where exists (select *
                from reservations s2
            where s1.reserver <> s2.reserver 
                and (s1.start_date, s1.end_date) overlaps (s2.start_date, s2.end_date));
/*
reserver | start_date |  end_date
----------+------------+------------
 山本     | 2006-11-03 | 2006-11-04
 内田     | 2006-11-03 | 2006-11-05
(2 rows)
*/
```

**使用overlaps与使用between的区别:**
overlaps在判断两个时间区间是否重合时, 若是两个重合的时间想等, 则不认为连个时间区间重合,
只有当一个超过另一个的时候才算重合.


