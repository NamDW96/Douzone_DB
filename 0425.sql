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

