-- page: 20 1.1.2


select case when sex = '1' then '男'
            when sex = '2' then '女'
            else '其他'
        end as "性别",
        sum(population) as "全国",
        sum(case when pref_name = '德岛' then population
                else 0
            end) as "德岛",
        sum(case when pref_name = '香川' then population
                else 0
            end) as "香川",
        sum(case when pref_name = '爱媛' then population
                else 0
            end) as "爱媛",
        sum(case when pref_name = '高知' then population
                else 0
            end) as "高知",
        sum(case when pref_name in ('德岛', '香川', '爱媛', '高知') then population
                else 0
            end) as "四国(再揭)"
    from pop_tbl2
group by sex;