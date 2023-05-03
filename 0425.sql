show user;

create table trans_A(
    num number,
    name varchar2(20)
);

create table trans_B(
    num number constraint pk_trans_B_num primary key,
    name varchar2(20)
);

select * from trans_A;
select * from trans_B;

select * from dept;
select * from emp;

select * from emp where ename like  '%DONG%';

--------------
--------------------------------------------------------------------------------
--�м��Լ� (���ݾ�) --����(index)  --PL-SQL ���� ���ݾ� �ҰԿ�
--------------------------------------------------------------------------------
--���� JDBC (JAVA) - MariaDB���� (�⺻�۾�)
--------------------------------------------------------------------------------
--�м��Լ� �н��ϱ�
--��� ���� �����
--���� �� ������ >> �� ������ �ٲٱ�
--���� �� ������ >> �� ������ �ٲٱ�
--�⺻ (decode ,  case) ��� (����  ǥ��ȭ)
--11g ���� ���� (pivot �� �̿� ���� ������ ��ȯ)

/*
�� �� ���� ��ȯ�ϱ� 
deptno  , cnt
10         3
20         5
30         6

deptno_10     deptno_20    deptno_30
    3             5          6

*/

select deptno, count(*) as cnt from emp group by deptno order by deptno asc;

select deptno , case when deptno=10 then 1 else 0 end as dept_10,
                case when deptno=20 then 1 else 0 end as dept_20,
                case when deptno=30 then 1 else 0 end as dept_30
from emp
order by 1;  -- order by deptno asc 
--------------------------------------------------------------------------------

select deptno , sum(case when deptno=10 then 1 else 0 end) as dept_10,
                sum(case when deptno=20 then 1 else 0 end) as dept_20,
                sum(case when deptno=30 then 1 else 0 end) as dept_30
from emp
group by deptno;
--deptno �÷��� �ǹ̰� ����
--dept_10 �÷��� ... 10�� �μ�

select sum(case when deptno=10 then 1 else 0 end) as dept_10, --�̸� �ǹ� �ο� >> 10�μ�
       sum(case when deptno=20 then 1 else 0 end) as dept_20,
       sum(case when deptno=30 then 1 else 0 end) as dept_30
from emp;

select case when deptno=10 then ecount else null end as dept_10,
       case when deptno=20 then ecount else null end as dept_20,
       case when deptno=30 then ecount else null end as dept_30
from (
        select deptno , count(*) as ecount
        from emp
        group by deptno
     ) x;  

select max(case when deptno=10 then ecount else null end) as dept_10,
       max(case when deptno=20 then ecount else null end) as dept_20,
       max(case when deptno=30 then ecount else null end) as dept_30
from (
        select deptno , count(*) as ecount
        from emp
        group by deptno
     ) x;   
     
/*
SELECT *
  FROM ( �ǹ� ��� ������ )
 PIVOT ( �׷��ռ�(�����÷�) FOR �ǹ��÷� IN (�ǹ��÷��� AS ��Ī ... )

����Ŭ 11g���� PIVOT ����� �����մϴ�. 
���� ���Ϲ��������� DECODE �Լ��� �̿��Ͽ� �ο츦 �÷����� �����ϴ� �۾��� �Ͽ����ϴ�. 
PIVOT ����� �̿��ϸ� DECODE�� �����ϰ� ���������� �ڵ带 ���� �� ���������� �ۼ��� �� �ֽ��ϴ�.
�ƽ��� ���� PIVOT ����� ����ϴ��� PIVOT�� �� �÷��� �̸� ���Ǹ� �� ���ƾ� �Ѵٴ� ���̴�.
*/      
--��� , ��Ʈ ������ ����

--������ , ���� �Ի� �Ǽ�
select * from emp;

select job , to_char(hiredate,'FMMM') || '��' as hire_month from emp;

--       1�� , 2�� , 3�� , 4�� ...... 12�� �÷�����
--CLERK   0    0     1     2 ....
--decode 12�� >> 1�� ~12��

select *
from  (
         select job , to_char(hiredate,'FMMM') || '��' as hire_month from emp 
      )
pivot( 
       count(*) for hire_month IN('1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��')
     );

--decode �����Ѵٸ�
SELECT job 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '1', 1, 0)) "1��" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '2', 1, 0)) "2��" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '3', 1, 0)) "3��" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '4', 1, 0)) "4��" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '5', 1, 0)) "5��" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '6', 1, 0)) "6��" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '7', 1, 0)) "7��" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '8', 1, 0)) "8��" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '9', 1, 0)) "9��" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '10', 1, 0)) "10��" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '11', 1, 0)) "11��" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '12', 1, 0)) "12��" 
  FROM emp 
 GROUP BY job;     




--������ 
--������ , �μ��� �޿� �հ�
--select job , deptno ,sum(sal) from emp group by job , deptno order by job
select job , d10, d20, d30
from (
       select job , deptno , sal from emp
     )
pivot (
        sum(sal) for deptno  in ('10' as d10 , '20' as d20 , '30' as d30)    
      );  

---------------------------------------------------------------------------------
select deptno, job , sal from emp;

select * 
from (
        select deptno, job , sal from emp
     )
pivot (sum(sal) for job in ('PRISIDENT' as p, 'ANALYST' as a, 'MANAGER' as m, 'SALESMAN' as s , 'CLERK' as c));

--Quiz
-- ������ ��� decode�� �����ϼ���

SELECT deptno
     , SUM(DECODE(job, 'PRISIDENT', sal, null)) "p" 
     , SUM(DECODE(job, 'ANALYST', sal, null)) "a" 
     , SUM(DECODE(job, 'MANAGER', sal, null)) "m" 
     , SUM(DECODE(job, 'SALESMAN', sal, null)) "s" 
     , SUM(DECODE(job, 'CLERK', sal, null)) "c" 
  FROM emp 
 GROUP BY deptno;     

SELECT deptno 
     , DECODE(job, 'PRISIDENT', sal)as "p" 
     , DECODE(job, 'ANALYST', sal)as "a" 
     , DECODE(job, 'MANAGER', sal)as "m" 
     , DECODE(job, 'SALESMAN', sal)as "s" 
     , DECODE(job, 'CLERK', sal)as "c" 
  FROM emp ;
 
-- ������ ��� case�� ����
select deptno , sum(case when job = 'PRESIDENT' then sal else null end) as p,
                sum(case when job = 'ANALYST' then sal else null end) as a,
                sum(case when job = 'MANAGER' then sal else null end) as m,
                sum(case when job = 'SALESMAN' then sal else null end) as s,
                sum(case when job = 'CLERK' then sal else null end) as c
from emp
group by deptno;

--------------------------------------------------------------------------------
--������̺��� �μ��� �޿��հ�� ��ü�޿����� ����ϼ���.

select dpetno,sum(sal)
from emp
group by deptno;

select sum(sal) from emp;

select deptno, sum(sal) from emp group by deptno
union all
select null , sum(sal) from emp;
--------------------------------------------------------------------------------
--Rollup, Cube �Ұ� (������, ��� : GLAP)
--������ �м� ������ ��� (�Ұ��� ����� ���)

select job, deptno, sum(sal), count(sal)
from emp
group by job, deptno
order by job, deptno;

select job, sum(sal)
from emp
group by rollup(job); --������ �޿��� ���� ���ϰ�, ��� ������ �׺��� �յ� ���Ѵ�.

select job , deptno, sum(sal)
from emp
group by rollup(job, deptno);  -- ���� �� �÷��������� �Ұ迡�� ����

/*
CLERK   	10	1300
CLERK	    20	1900
CLERK	    30	950
CLERK	      	4150 --CLERK �� �� (�Ұ�)
ANALYST	    20	6000
ANALYST		    6000 --ANALYST �� �� (�Ұ�)
MANAGER		10  2450
MANAGER		20  2975
MANAGER		30  2850
MANAGER		    8275      --(�Ұ�)
SALESMAN	30	5600 
SALESMAN		5600      --(�Ұ�)
PRESIDENT	10	5000
PRESIDENT		5000      --(�Ұ�)
		       29025
*/

select deptno, job , sum(sal)
from emp
group by rollup(deptno, job);
-------------------------------------------------------------------

select job, deptno, sum(sal), count(sal)
from emp
group by job, deptno
order by job, deptno;

-- ���� �Ұ� : deptno �� �Ұ�, job �� �Ұ�, ��ü��

select deptno, job, sum(sal)
from emp
group by deptno, job
union all
select deptno, null, sum(sal)
from emp
group by deptno
union all
select null, job, sum(sal)
from emp
group by job
union all
select null, null, sum(sal)
from emp;

-- ������ ����(union), rollup(��� �÷��� ����� �ȵȴ�) >> cube >> ��� �÷��� �Ұ�
select deptno, job , sum(sal)
from emp
group by cube(deptno, job)
order by deptno, job;

--------------------------------------------------------------------------------
-- ���� �Լ� 
--rownum (select �� ����� ���� ó��)
--RANK
--DENSE_RANK
--������ ������ ��� ( ���� ������ ������ ) (100,90,80) (1,2,3 ��) (100,80,80,60)(1��,2��,2��,3?4?��) �� ���� ����
select * from emp;

select ename, sal,
rank() over(order by sal desc) as ����,           --1 2 2 4
dense_rank() over(order by sal desc) as ����2     --1 2 2 3
from emp
order by sal desc;
/*
������ ���̴� ��� - ������ �� ���� ����
*/

select ename, sal, comm,hiredate,
rank() over(order by sal desc, comm desc, hiredate desc) as ����  -- ������ �߰� .. --�� ���� ����
from emp
order by sal desc;

--���� �׷�ȿ��� ���� ���ϱ�
--A �� �����ű�� B group �����ű��

select job, ename, sal, comm,
       rank() over(partition by job order by sal desc, comm desc) as �׷����
from emp
order by job asc, sal desc, comm desc;

-- ���� �Լ� (���� : select �� �����Լ� �̿ܿ� ������ �÷��� group by ��)
-- in line view (��������) JOIN
-- create view �������̺�  JOIN

select job, sum(sal), count(sal)
from emp
where job in('MANAGER','SALESMAN')
group by job
order by job;
--�̸�, ��� �� �ñ��� (�׷쿡���� �Ұ���)

select empno, job, sum(sal), count(sal) (X)

--���� �ذ�
select empno, ename, job, sum(sal) over (partition by job)
from emp
where job in('MANAGER','SALESMAN')
order by job;


-- with��
--PARTITION BY https://cafe.naver.com/erpzone/501
----------------------------------
--JDBC Ȱ�� ���ν��� �����
create or replace procedure usp_EmpList
(
    p_sal IN number,
    p_cursor OUT SYS_REFCURSOR -- APP ����ϱ� Ÿ��
)
is
    begin
        open p_cursor
        for select empno, ename, sal from emp where sal> p_sal;       
    end;
    
    
    
---------------------------------------------------------------------------------
--JDBC
--JDBC Ȱ�� ���ν��� �����
create or replace procedure usp_EmpList
(
  p_sal IN number,
  p_cursor OUT SYS_REFCURSOR -- APP ����ϱ� Ÿ��
)
is
    begin
        open p_cursor 
        for select empno, ename ,sal from emp where sal > p_sal;
    end;

    var out_cursor REFCURSOR
    exec usp_EmpList(3000,:out_cursor)
    print out_cursor;

create or replace procedure usp_Insert_Emp
(
    vempno IN emp.empno%TYPE,
    vname IN emp.ename%TYPE,
    vjob IN emp.job%TYPE,
    p_outmsg OUT varchar2
)
is 
    begin
        insert into emp(empno,ename,job) values(vempno,vname,vjob);
        commit;
        p_outmsg := 'success';
        EXCEPTION WHEN OTHERS THEN
        p_outmsg := SQLERRM;
        rollback;
    end;
    
alter table emp
add constraint pk_emp_empno primary key(empno);

select * from user_constraints where table_name ='EMP';
    
    
    drop table emp2;
    
select * from d_dept;