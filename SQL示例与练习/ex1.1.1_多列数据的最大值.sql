-- page: 19 练习题1.1.1
/*
|key |x |y |z |
|A   |1 |2 |3 |
|B   |5 |5 |2 |
|C   |4 |7 |1 |
|D   |3 |3 |8 |
*/

-- 从两个值中选出较大的
select key,
       case when x > y then x
            else y
       end as greatest
    from greatests;    

-- 从三个值中选出较大的 
select key,
    case when (x > y and x > z) then x
        when (y > x and y > z) then y
        else z
    end as greatest
from greatests
order by key asc;

-- 更好的写法
-- -- 列转换成行格式, 然后使用max函数
select key, max(col) as greatest
    from (select key, x as col from greatests
        union all -- union all 允许有重复的行, union 只允许是不同的行
        select key, y as col from greatests
        union all
        select key, z as col from greatests)TMP
group by key;
