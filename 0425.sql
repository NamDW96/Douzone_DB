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
--분석함수 (조금씩) --개념(index)  --PL-SQL 진도 조금씩 할게요
--------------------------------------------------------------------------------
--담주 JDBC (JAVA) - MariaDB세팅 (기본작업)
--------------------------------------------------------------------------------
--분석함수 학습하기
--통계 쿼리 만들기
--집계 행 데이터 >> 열 데이터 바꾸기
--집계 열 데이터 >> 행 데이터 바꾸기
--기본 (decode ,  case) 사용 (장점  표준화)
--11g 버전 부터 (pivot 을 이용 행을 열으로 전환)

/*
행 을 열로 전환하기 
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
--deptno 컬럼은 의미가 없다
--dept_10 컬럼명 ... 10번 부서

select sum(case when deptno=10 then 1 else 0 end) as dept_10, --이름 의미 부여 >> 10부서
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
  FROM ( 피벗 대상 쿼리문 )
 PIVOT ( 그룹합수(집계컬럼) FOR 피벗컬럼 IN (피벗컬럼값 AS 별칭 ... )

오라클 11g부터 PIVOT 기능을 제공합니다. 
기존 이하버전에서는 DECODE 함수를 이용하여 로우를 컬럼으로 변경하는 작업을 하였습니다. 
PIVOT 기능을 이용하면 DECODE의 복잡하고 비직관적인 코드를 조금 더 직관적으로 작성할 수 있습니다.
아쉬운 접은 PIVOT 기능을 사용하더라도 PIVOT을 할 컬럼을 미리 정의를 해 놓아야 한다는 점이다.
*/      
--통계 , 차트 데이터 구현

--직종별 , 월별 입사 건수
select * from emp;

select job , to_char(hiredate,'FMMM') || '월' as hire_month from emp;

--       1월 , 2월 , 3월 , 4월 ...... 12월 컬럼으로
--CLERK   0    0     1     2 ....
--decode 12개 >> 1월 ~12월

select *
from  (
         select job , to_char(hiredate,'FMMM') || '월' as hire_month from emp 
      )
pivot( 
       count(*) for hire_month IN('1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월')
     );

--decode 구현한다면
SELECT job 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '1', 1, 0)) "1월" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '2', 1, 0)) "2월" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '3', 1, 0)) "3월" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '4', 1, 0)) "4월" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '5', 1, 0)) "5월" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '6', 1, 0)) "6월" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '7', 1, 0)) "7월" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '8', 1, 0)) "8월" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '9', 1, 0)) "9월" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '10', 1, 0)) "10월" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '11', 1, 0)) "11월" 
     , SUM(DECODE(TO_CHAR(hiredate, 'FMMM'), '12', 1, 0)) "12월" 
  FROM emp 
 GROUP BY job;     



--직종별 
--직종별 , 부서별 급여 합계
--select job , deptno ,sum(sal) from emp group by job , deptno order by job
select job , d10, d20, d30
from (
       select job , deptno , sal from emp
     )
pivot (
        sum(sal) for deptno  in ('10' as d10 , '20' as d20 , '30' as d30)    
      );  

