-- 简单CASE表达式
CASE sex
    WHEN '1' THEN '男'
    WHEN '2' THEN '女'
ELSE '其他' END

-- 搜索CASE表达式
CASE WHEN sex = '1' THEN '男'
     WHEN sex = '2' THEN '女'
ELSE '其他' END

/*
点评:
    搜索表达式虽然看上去有点冗余,
    但是比简单CASE表达式表达能力要强
    所以要用就用搜索CASE表达式
*/