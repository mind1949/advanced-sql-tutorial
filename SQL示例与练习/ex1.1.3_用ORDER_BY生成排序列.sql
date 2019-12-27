-- page: 20

/*
将1.1.1练习题中的结果按照key字段"B-A-D-C"排序
*/
select key,
    case when (x > y and x > z) then x
        when (y > x and y > z) then y
        else z
    end as greatest
from greatests
order by case key when 'B' then 0
                when 'A' then 1
                when 'D' then 2
                when 'C' then 3
                else null
        end;