# 1.6.3 sum可以计算出累计值_那么max_min_avg可以算出什么值 

## max
```sql
select prc_date, prc_amount,
       max(prc_amount) over (order by prc_date
                            rows 2 preceding) mvg_sum
from accounts;
/*
  prc_date  | prc_amount | mvg_sum
------------+------------+---------
 2006-10-26 |      12000 |   12000
 2006-10-28 |       2500 |   12000
 2006-10-31 |     -15000 |   12000
 2006-11-03 |      34000 |   34000
 2006-11-04 |      -5000 |   34000
 2006-11-06 |       7200 |   34000
 2006-11-11 |      11000 |   11000
(7 rows)
*/
```

## min
```sql
select prc_date, prc_amount,
       min(prc_amount) over (order by prc_date
                            rows 2 preceding) mvg_sum
from accounts;
/*
  prc_date  | prc_amount | mvg_sum
------------+------------+---------
 2006-10-26 |      12000 |   12000
 2006-10-28 |       2500 |    2500
 2006-10-31 |     -15000 |  -15000
 2006-11-03 |      34000 |  -15000
 2006-11-04 |      -5000 |  -15000
 2006-11-06 |       7200 |   -5000
 2006-11-11 |      11000 |   -5000
(7 rows)
*/
```

## avg
```sql
select prc_date, prc_amount,
       avg(prc_amount) over (order by prc_date
                            rows 2 preceding) mvg_sum
from accounts;
/*
  prc_date  | prc_amount |        mvg_sum
------------+------------+------------------------
 2006-10-26 |      12000 | 12000.0000000000000000
 2006-10-28 |       2500 |  7250.0000000000000000
 2006-10-31 |     -15000 |  -166.6666666666666667
 2006-11-03 |      34000 |  7166.6666666666666667
 2006-11-04 |      -5000 |  4666.6666666666666667
 2006-11-06 |       7200 | 12066.6666666666666667
 2006-11-11 |      11000 |  4400.0000000000000000
(7 rows)
*/
```

