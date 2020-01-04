# 1.4.2 练习特征函数

## 问题:
**准备数据:**
```sql
create table students1(
    student_id int not null , -- 学生id
    dpt varchar(50) not null, -- 学院
    sbmt_at timestamp with time zone -- 提交时间
);
insert into students1(student_id, dpt, sbmt_at)
                    values(100, '理学院', 'now()'),
                            (101, '理学院', 'now()'),
                            (102, '文学院', null),
                            (103, '文学院', 'now()'),
                            (104, '文学院', 'now()'),
                            (105, '文学院', null),
                            (106, '工学院', null),
                            (107, '经济学院', 'now()');               
```
**问题:**
找出所有学生都在九月份提交了数据的学院

## 解法:
```sql
select dpt
    from students1
group by dpt
having sum(*) = sum(case sbmt_at between '2005-09-1' and '2005-09-31' then 1 else 0 end);
```
