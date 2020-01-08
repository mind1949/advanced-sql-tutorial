# ex1.5.1 先连接还是先聚合

## 问题:
在'1.5.3 在交叉表中制作嵌套表侧栏'中的解法使用了视图, 尝试减少视图

## 解法:

```postgresql
select tbl_age.age_range as age_range,
       tbl_sex.sex as  sex,
       case when sum(case when tbl_pop.pref_name  in ('青森', '秋田') then population else 0 end) > 0
                then sum(case when tbl_pop.pref_name  in ('青森', '秋田') then population else 0 end)
            else null end  as pop_tohoko,
       case when sum(case when tbl_pop.pref_name in ('东京', '千叶') then population else 0 end) > 0
                then sum(case when tbl_pop.pref_name in ('东京', '千叶') then population else 0 end)
            else null end  as pop_kanto
from tbl_age
         inner join tbl_sex
            on 1=1 /* 🤔这里必须加个on 再能执行否则会报错:
                        ERROR:  syntax error at or near "group"
                        LINE 15: group by tbl_age.age_range, tbl_sex.sex
                    这是为什么呢?
                    */
         left outer join tbl_pop
           on tbl_sex.sex_cd = tbl_pop.sex_cd
            and tbl_pop.age_class = tbl_age.age_class
group by tbl_age.age_range, tbl_sex.sex
order by tbl_age.age_range, tbl_sex.sex desc;
/*
 age_range | sex | pop_tohoko | pop_kanto
-----------+-----+------------+-----------
 21岁~30岁 | 男  |       1100 |      1800
 21岁~30岁 | 女  |       1300 |      2500
 31岁~40岁 | 男  |            |
 31岁~40岁 | 女  |            |
 41岁~50岁 | 男  |       1000 |
 41岁~50岁 | 女  |       1800 |      2100
(6 rows)
*/
```
