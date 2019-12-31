## 1.2.2 分地区排序

## 问题:
**准备数据:**
```sql
create table district_products(
	district text not null,
    name text not null,
    price numeric(10, 3) not null
);
insert into district_products(
	district,
    name,
    price
) values ('东北', '橘子', 100),
		('东北', '苹果', 50),
		('东北', '葡萄', 50),
		('东北', '柠檬', 30),
		('关东', '柠檬', 100),
		('关东', '菠萝', 100),
		('关东', '苹果', 100),
		('关东', '葡萄', 70),
		('关西', '柠檬', 70),
		('关西', '西瓜', 30),
		('关西', '苹果', 20);
```
**问题:**
按如下方式排序:
```textmate
 district | name |  price  | rank_1
----------+------+---------+--------
 东北     | 橘子 | 100.000 |      1
 东北     | 苹果 |  50.000 |      2
 东北     | 葡萄 |  50.000 |      2
 东北     | 柠檬 |  30.000 |      4
 关东     | 柠檬 | 100.000 |      1
 关东     | 菠萝 | 100.000 |      1
 关东     | 苹果 | 100.000 |      1
 关东     | 葡萄 |  70.000 |      4
 关西     | 柠檬 |  70.000 |      1
 关西     | 西瓜 |  30.000 |      2
 关西     | 苹果 |  20.000 |      3
```

## 答案:

**使用连接子查询:**
```sql
select district,
        name,
        price,
        (select count(*) + 1
            from district_products as d2
        where d2.district = d1.district
            and d2.price > d1.price) as rank_1
from district_products as d1
order by district, price desc;
```

**使用rank窗口函数:**
```sql
select district,
        name,
        price,
        rank() over(
            partition by d.district
            order by d.price desc
        ) as rank_1
from district_products as d;
```
