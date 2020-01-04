# 1.4.3 购物篮问题分析一般化

## 问题:
**准备数据:**
```sql
create table items(
    item varchar(100) not null -- 商品
);
insert into items(item)
            values('啤酒'),
                   ('纸尿裤'),
                    ('自行车');
/*
  item
--------
 啤酒
 纸尿裤
 自行车
(3 rows)
*/
create table shop_items(
    shop varchar(100) not null, -- 店铺
    item varchar(100) not null -- 商品
);
insert into shop_items(shop, item)
                values('仙台', '啤酒'),
                        ('仙台', '纸尿裤'),
                        ('仙台', '自行车'),
                        ('仙台', '窗帘'),
                        ('东京', '啤酒'),
                        ('东京', '纸尿裤'),
                        ('东京', '自行车'),
                        ('大阪', '电视'),
                        ('大阪', '纸尿裤'),
                        ('大阪', '自行车');
/*
shop |  item
------+--------
 仙台 | 啤酒
 仙台 | 纸尿裤
 仙台 | 自行车
 仙台 | 窗帘
 东京 | 啤酒
 东京 | 纸尿裤
 东京 | 自行车
 大阪 | 电视
 大阪 | 纸尿裤
 大阪 | 自行车
*/
```

**问题:**
列出所有店铺拥有的商品数和缺少的商品数
如下:
```textmate
 shop | my_item_cnt | diff_cnt
------+-------------+----------
 仙台 |           3 |        0
 东京 |           3 |        0
 大阪 |           2 |        1
```

**解法:**
```sql
select si.shop, count(*) my_item_cnt, (select count(*) from items) - count(*) diff_cnt
    from shop_items si, items i
where si.item = i.item
group by si.shop;
```
