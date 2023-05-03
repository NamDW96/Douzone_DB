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

---------------------------------------------------------------------------------
select deptno, job , sal from emp;

select * 
from (
        select deptno, job , sal from emp
     )
pivot (sum(sal) for job in ('PRISIDENT' as p, 'ANALYST' as a, 'MANAGER' as m, 'SALESMAN' as s , 'CLERK' as c));

--Quiz
-- 동일한 결과 decode를 생성하세요

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
 
-- 동일한 결과 case를 생성
select deptno , sum(case when job = 'PRESIDENT' then sal else null end) as p,
                sum(case when job = 'ANALYST' then sal else null end) as a,
                sum(case when job = 'MANAGER' then sal else null end) as m,
                sum(case when job = 'SALESMAN' then sal else null end) as s,
                sum(case when job = 'CLERK' then sal else null end) as c
from emp
group by deptno;

--------------------------------------------------------------------------------
--사원테이블에서 부서별 급여합계와 전체급여합을 출력하세요.

select dpetno,sum(sal)
from emp
group by deptno;

select sum(sal) from emp;

select deptno, sum(sal) from emp group by deptno
union all
select null , sum(sal) from emp;
--------------------------------------------------------------------------------
--Rollup, Cube 소개 (레포팅, 출력 : GLAP)
--다차원 분석 쿼리에 사용 (소개를 만드는 방법)

select job, deptno, sum(sal), count(sal)
from emp
group by job, deptno
order by job, deptno;

select job, sum(sal)
from emp
group by rollup(job); --직종별 급여의 합을 구하고, 모든 직종의 그병의 합도 구한다.

select job , deptno, sum(sal)
from emp
group by rollup(job, deptno);  -- 우측 끝 컬럼에서부터 소계에서 제외

/*
CLERK   	10	1300
CLERK	    20	1900
CLERK	    30	950
CLERK	      	4150 --CLERK 의 합 (소계)
ANALYST	    20	6000
ANALYST		    6000 --ANALYST 의 합 (소계)
MANAGER		10  2450
MANAGER		20  2975
MANAGER		30  2850
MANAGER		    8275      --(소계)
SALESMAN	30	5600 
SALESMAN		5600      --(소계)
PRESIDENT	10	5000
PRESIDENT		5000      --(소계)
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

-- 기준 소계 : deptno 별 소개, job 별 소개, 전체합

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

-- 복잡한 쿼리(union), rollup(모든 컬럼의 집계는 안된다) >> cube >> 모든 컬럼의 소계
select deptno, job , sum(sal)
from emp
group by cube(deptno, job)
order by deptno, job;

--------------------------------------------------------------------------------
-- 순위 함수 
--rownum (select 한 결과에 순번 처리)
--RANK
--DENSE_RANK
--순위가 동일한 결과 ( 같은 점수가 여러명 ) (100,90,80) (1,2,3 등) (100,80,80,60)(1등,2등,2등,3?4?등) 에 대한 내용
select * from emp;

select ename, sal,
rank() over(order by sal desc) as 순위,           --1 2 2 4
dense_rank() over(order by sal desc) as 순위2     --1 2 2 3
from emp
order by sal desc;
/*
동률을 줄이는 방법 - 기준을 더 만들어서 적용
*/

select ename, sal, comm,hiredate,
rank() over(order by sal desc, comm desc, hiredate desc) as 순위  -- 기준을 추가 .. --더 많은 기준
from emp
order by sal desc;

--조건 그룹안에서 순위 정하기
--A 조 순위매기기 B group 순위매기기

select job, ename, sal, comm,
       rank() over(partition by job order by sal desc, comm desc) as 그룹순위
from emp
order by job asc, sal desc, comm desc;

-- 집계 함수 (단점 : select 절 집계함수 이외에 나머지 컬럼은 group by 절)
-- in line view (서브쿼리) JOIN
-- create view 가상테이블  JOIN

select job, sum(sal), count(sal)
from emp
where job in('MANAGER','SALESMAN')
group by job
order by job;
--이름, 사번 이 궁금해 (그룹에서는 불가능)

select empno, job, sum(sal), count(sal) (X)

--단점 해결
select empno, ename, job, sum(sal) over (partition by job)
from emp
where job in('MANAGER','SALESMAN')
order by job;


-- with절
--PARTITION BY https://cafe.naver.com/erpzone/501
----------------------------------
--JDBC 활용 프로시져 만들기
create or replace procedure usp_EmpList
(
    p_sal IN number,
    p_cursor OUT SYS_REFCURSOR -- APP 사용하기 타입
)
is
    begin
        open p_cursor
        for select empno, ename, sal from emp where sal> p_sal;       
    end;
    
    
    
---------------------------------------------------------------------------------
--JDBC
--JDBC 활용 프로시져 만들기
create or replace procedure usp_EmpList
(
  p_sal IN number,
  p_cursor OUT SYS_REFCURSOR -- APP 사용하기 타입
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