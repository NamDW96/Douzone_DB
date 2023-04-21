/*
1일차 수업

1. 소프트웨어 다운로드
https://www.oracle.com/database/technologies/xe-prior-release-downloads.html

2. Oracle 설치 ( SYS, SYSTEM 계정에 대한 암호 설정 : 1004)

3. sqlplus 프로그램 제공 (CMD) : 단점 GUI 환경을 제공하지 않는다.

4. 별도의 프로그램 접속 : Tool
4.1 SqlDeveloper 무료, dbeaver 무료
4.2 토드, 오렌지, SqlGate ...

5. SqlDeveloper 실행 >> Oracle 서버 접속 >> GUI
5.1 HR 계정 사용 (unlocak)

-- USER SQL
ALTER USER "HR" IDENTIFIED BY "1004" 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP"
ACCOUNT UNLOCK ;

-- QUOTAS
ALTER USER "HR" QUOTA UNLIMITED ON "USERS";

-- ROLES
ALTER USER "HR" DEFAULT ROLE "CONNECT","RESOURCE";

-- SYSTEM PRIVILEGES

5.2 KOSA 계정 생성

-- USER SQL
CREATE USER "KOSA" IDENTIFIED BY "1004"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS

-- ROLES
GRANT "CONNECT" TO "KOSA" WITH ADMIN OPTION;
GRANT "RESOURCE" TO "KOSA" WITH ADMIN OPTION;
ALTER USER "KOSA" DEFAULT ROLE "CONNECT","RESOURCE";

-- SYSTEM PRIVILEGES




*/

/*
[1일차 수업]
1. 오라클 소프트웨어 다운로드
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (무료설치)

3. Oracle 설치(SYS, SYSTEM 계정의 대한 암호 : 1004)

4.Sqlplus 프로그램 제공(CMD) : GUI 환경 일반개발자 사용 불편

5.별도의 Tool 설치 무료(SqlDeveloper , https://dbeaver.io/)  ,
                 유료(토드 , 오렌지 , SqlGate) 프로젝트시 설치 활용 ^^

6. SqlDeveloper 툴을 통해서 Oracle Server 접속 ....
   >> HR 계정 : 암호 1004 , Unlock 2가지 사용가능 .... (사원관리 실습 테이블)
   >> 새로운 계정 : BITUSER

-- USER SQL
ALTER USER "HR" IDENTIFIED BY 1004 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP"
ACCOUNT UNLOCK ;

-- QUOTAS
ALTER USER "HR" QUOTA UNLIMITED ON USERS;

-- ROLES
ALTER USER "HR" DEFAULT ROLE "RESOURCE","CONNECT";

-- SYSTEM PRIVILEGES


7. 현재 접속 계정 확인 : show user;   >> USER이(가) "BITUSER"입니다.


-- USER SQL
CREATE USER "BITUSER" IDENTIFIED BY "1004"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS

-- ROLES
GRANT "CONNECT" TO "BITUSER" WITH ADMIN OPTION;
GRANT "RESOURCE" TO "BITUSER" WITH ADMIN OPTION;
ALTER USER "BITUSER" DEFAULT ROLE "CONNECT","RESOURCE";

-- SYSTEM PRIVILEGES


*/

/*
실습코드

CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;



CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

*/



show user;

select * from emp;

select * from dept;

select * from salgrade;


--------------------------------------------------------------------------------
--1. 사원 테이블에서 모든 데이터를 출력하세요.

select * from emp;
SELECT * FROM EMP; //대소문자를 구분하지 않고 규칙을 정해서 사용한다


/* 2. 특정 컬럼 데이터 출력하기 */

select empno, ename, sal 
from emp;

select ename from emp;

--3. 가명칭 사용하기 (별칭 : alias)
select empno 사번, ename 이름
from emp;

select empno 사   번, ename 이   름
from emp; --오류발생

select empno "사   번", ename "이   름"
from emp;

-- 권장 문법(ANSI)>> 표준 >> 어떤 구문을 작성하면 (Oracle, Ms-spl, Mysql) 모두 동작
select empno "사   번", ename "이   름"
from emp;

-- Oracle 문자열 데이터 엄격하게 새도문작 

/*
JAVA : 문자 >' A' , 문자열> "AAAA"
ORACLE : 문자열 >'A', ,"AAAA", 'AVEWEWED' 
ORACLE : 데이터로 'a', 'A' 다른 문자열
*/
select*
from emp
where ename= "king";

select*
from emp
where ename= "KING"; - 대소문자를 엄격하게 구분

/*
select 절 3
from 절   1
where절   2

-- Oracle Query (질의어) : 언어

연산자  
JAVA  + 숫자(산술연산), + 문자열(결합연산)

---------------------------------------
Oracle
결합 연산자 ||
산술 연산자 + <-산술
결합

MS-SQL + (산술, 결합)




DB분야
개발자 (CRUD)(insert, select, update, delete) >> DML + DDL(create , alter, drop)

관리자 (DBA) 데이터 백업, 복원 , 네트워크 관리, 자원관리, 하드웨어 관리

튜너 : SQL 튜너(문장) >> 속도 >> index >> 자료구조
        하드웨어(네트워크) 튜너

모델러 : 설계 (PM) - ERD 요구사항 분석 ERD

분석가 (데이터 분석) 석사급 이상 ... 논문 read ........


*/
show user;

select * from emp;
select * from dept;
select * from salgrade;
--------------------------------------------------------------------------------
--1. 사원테이블에서 모든 데이터를 출력하세요
select * from emp;
SELECT * FROM EMP;
SELECT * FROM emp;

--2. 특정 컬럼 데이터 출력하기
select empno , ename , sal 
from emp;

select ename from emp;

--3. 가명칭 사용하기 (별칭: alias)
select empno 사번 , ename 이름
from emp;

select empno "사  번" , ename "이   름"
from emp;

--권장 문법(ANSI) >> 표준 >> 구문을 작성하면 (Oracle , Ms-sql , Mysql) 모두 동작
select empno as "사 번" , ename as "이 름"
from emp;

--Oracle 문자열 데이터 엄격하게 대소문자 구별
/*
JAVA : 문자> 'A' , 문자열> "AAAA"
ORACLE : 문자열 'A'   ,  'AAAA'  , 'AVBWEDWED'
ORACLE : 데이터로 'a' 'A' 다른문자열
*/
select * 
from emp
where ename='king'; --대소문자

select * 
from emp
where ename='KING'; --대소문자


/*
select 절     3
from 절       1
where 절      2
*/

--Oracle Query (질의어) : 언어
/*
연산자
JAVA : + 숫자(산술연산) , + 문자열(결합연산)
----------------------------------------
ORACLE :
결합 연산자  ||
산술 연산자  + (산술연산)

MS-SQL : + (산술, 결합)
*/

select '사원의 이름은' || ename || ' 입니다' as 사원정보
from emp;

--테이블의 기본 정보 ( 컬럼 , 타입)
desc emp;
--ENAME             VARCHAR2(10)   문자열 타입  결합가능 ...인지

/*
JAVA : class Emp {private int emnpno , private String ename}
ORACLE : create Table Emp( empno number , ename varchar2(20));
*/

--형변환(자동) >> 숫자를 문자열로 변환 
select empno || ename from emp;

select empno + ename from emp; --01722. 00000 -  "invalid number"

--사장님 ... 우리 회사에 직종이 몇개나 있나
select job from emp;

--중복 행 제거 키워드 : distinct

select distinct job from emp;
--grouping

--distinct 
--재미로 >> grouping
select distinct job , deptno
from emp
order by job;

--Oracle SQL 언어
--JAVA     : ( + , - , * /)  나머지 %
--ORACLE   : ( + , - , * /)  나머지 % 는 다른 곳에 사용 ...  함수 mod()
--문자열 패턴 검색 : ename like '%신%'

--사원테이블에서 사원의 급여를 100달라 인상한 결과를 출력하세요
select empno, ename , sal , sal + 100 as 인상급여 from emp;

--dual 임시 테이블
select 100 + 100 from dual;
select 100 || 100 from dual; -- 100100
select '100' + 100 from dual; --200 --'100' 숫자형 문자 ex)'123456'
select 'A100' + 100 from dual; --Error

--비교연산자
-- <  >   <=  
--주의
--JAVA : 같다 (==)  할당(=) , JavaScript : (== , ===)
--ORACLE : 같다 =    같지않다 !=

--논리연산자 (AND , OR , NOT)

select empno , ename ,sal
from emp
where sal >= 2000;

--사번이 7788번인 사원의 사번 , 이름 , 직종 , 입사일을 출력하세요
select empno, ename , job , hiredate
from emp
where empno=7788;

--사원의 이름이 king 사원의 사번 , 이름 , 급여 정보를 출력하세요
select empno , ename, sal
from emp
where ename ='KING';

/*    AND  , OR
 0 0   0     0
 1 0   0     1
 0 1   0     1
 1 1   1     1

*/
--초과 , 미만
--이상 , 이하 (=)

--급여가 2000달러 이상이면서 직종이 manager 인 사원의 모든 정보를 출력하세요
select *
from emp
where sal >= 2000 and job='MANAGER';


--급여가 2000달러 이상이거나 (또는) 직종이 manager 인 사원의 모든 정보를 출력하세요
select *
from emp
where sal >= 2000 or job='MANAGER';

--급여가 2000달러 초과이면서 직종이 manager 인 사원의 모든 정보를 출력하세요
select *
from emp
where sal > 2000 and job='MANAGER';

--오라클 날짜 (DB 서버의 날짜)
--sysdate
select sysdate from dual;
--23/04/17

select * from nls_session_parameters;
/*
NLS_LANGUAGE	        KOREAN
NLS_DATE_FORMAT	        RR/MM/DD
NLS_DATE_LANGUAGE	    KOREAN
NLS_TIME_FORMAT	        HH24:MI:SSXFF
*/
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select sysdate from dual; --2023-04-17 14:35:54
--도구 >> 환경설정 >> 데이터베이스 확장 >> NLS >> 날짜형식 수정하셔도 됩니다

select * from emp;

--날짜 데이터 검색 >> 문자열 검색 처럼 >>  '날짜'
select * from emp
where hiredate ='1980-12-17';

select * from emp
where hiredate ='1980/12/17';

select * from emp
where hiredate ='1980.12.17';

select * from emp
where hiredate ='80-12-17'; --현재 날짜 (yyyy-MM-dd)

select '사원의 이름은' || ename || ' 입니다' as 사원정보
from emp;

테이블의 기본 정보 *(컬럼, 타입)*
desc emp;
}
 -- ENAME             VARCHAR2(10)  문자열 타입 결합가능 ...
 
 
 /*
 
 JAVA : class Emp(private int empno, private String ename)
 ORACLE : create Table Temp(empno number, ename varchar2(20)); 
 
 */

select job from emp;
-- distinct
select distinct job from emp;

select distinct job, deptno
from emp
order by job;

-- Oracle SQL 언어 : +, - , * /  %는 다른 곳에 사용 / 나머지 구하는 함수 mod()
-- JAVA I : +, - , * / 나머지 %
-- 문자열 패턴 검색 : ename like "%신%"








select * from emp;

-- 사원의 급여가 2000 이상이고 4000 이하인 모든 사원의 정보를 출력하세요
select * from emp
where SAL>=2000 and SAL<=4000;  --중복제거

--between A and B 연산자

select *
from emp
where sal between 2000 and 4000; --between A and B 는 이상 이하만 적용할 수 있다.

--사원의 급여가 2000초과 4000미만 인 모든 사원의 정보를 출력하세요
--요것은 SAL을 2번 사용하는 수 밖에 없다.
select * from emp
where SAL>2000 and SAL<4000;

--부서번호가 10번 또는 20번 또는 30번 인 사원의 사번, 이름, 급여, 부서번호를 출력하세요
select EMPNO, ENAME,SAL,DEPTNO FROM EMP 
WHERE DEPTNO=10 OR DEPTNO=20 OR DEPTNO=30;

--똑같은 컬럼을 두번사용하는것은 매우 불편하다.
--매우중요 
--IN 연산자 (다중 연산자라고도 함)
select *
from emp
where deptno in (10,20,30); --where DEPTNO=10 or DEPTNO=20 or DEPTNO=30;

-- 부서번호가 10번 또는 20번이 아닌 사원의 정보를 출력
select * from emp
where deptno not in (10,20); --  dept != 10 and detpno != 20;

--TODAY POINT 
-- IN의 부정 (NOT IN) -> 부정의 AND


-- ☆TODAY POINT★
-- null 에 대한 이야기
-- 값이 없다 
-- 필요악 

create table member (
    userid varchar2 (20) not null , --null을 허용하지 않겠다 (필수입력)
    name varchar(20) not null, -- 필수입력으로 입력을 강제하겠다.
    hobby varchar2(50) --default null 허용 (선택입력)
);
desc member;
insert into member (userid, hobby) values ('kim','농구');
-- cannot insert Null into 

insert into member(userid, name) values ('hong','홍길동');
commit;
select * from member;


/*
DB마다 설정
Oracle
insert, update, delete 명령
기본적으로 쿼리문 시행시 begin tran 구문이 자동 ~~~ 개발자는 end (완료, 취소)
오라클은 대기상태 ..... 마지막 명령 (commit - 실제반영, rollback 취소) 작업완료

MS-sql
자동 auto-commit
delete from emp; 자동 commit;

begin tran
    delete from emp;
    
    commit or rollback 하지 않으면 데이터 처리 불가능

*/

delete from emp;
select * from emp;
commit;

-- 원칙적으로 commit 한 데이터는 살릴 수 없다. 하지만 백업이 있다면 그 시점까지는 백업을 할 수 있다.

-- DB Transaction : 논리적인 작업 단위 (성공 ,실패)
OLTP (웹 환경 : 실시간으로 데이터 처리)
은행업무 이체

    update -- 계좌 -1000
    updtate -- 동생 계좌 1000
    둥

-- OLAP (데이터 분속 : 일정기간 데이터를 모아서 분석)
-- 오라클에서 insert, update,delete 하면 반드시
-- commit, rollback 처리여부 결정

-- 수당(comm)을 받지 않은 모든 사람의 정보를 입력하세
-- 실습 데이터 0 이 있는데 데이터 받는 것으로 보세요

--comm 컬럼의 데이터가 null 인것만
selecet *
from emp
where comm = null; --문법x

select *
from emp
where comm is null;
--암기 null 의 비교는 is null & in not null

--comm을 받는 사원들 comm 컬럼의 데이터가 null 이 아닌것
select *
from emp
where comm is not null;

-- 사원테이블에서 사번, 이름, 급여, 수당, 총급여, (급여+수당) 을 출력하세요

select empno, ename, sal ,comm, sal+comm as 총급여
from emp;
/*
null 이란 녀석
1. null 과의 모든 연산 결과는 null ex) null+100 >> null
2. null .. 함수 >> nv1(), nv2() 암기

ex) nv1(컬럼명,대체값) >> 치환

Tip)
Mysql > null > IFNULL() > select if(null,'');
MS-SQL > null > Convert()
*/

select empno, ename, sal ,comm, sal+comm(comm,0) as 총급여
from emp;

select * from emp;
select 1000 + null from dual; --null
select 1000 +nv1(null,0) from dual;
select comm , nv1(comm,111111) from emp;
select nvl(null,'hello world') from dual;

--사원의 급여가 1000이상이고 수당을 받지 않는 사원의 사번, 이름 ,직종, 급여
select * from emp
where SAL >1000 and comm is null;

--문자열 검색
--주소검색 >> 역삼 >> 역삼 단어가 있는 모든 주소가 나오는 것
-- LIKE 문자열 패턴
-- 와일드카드 ( %(모든것), _(한문자))

select *
from emp
where ename like '%A%';

select *
from emp
where ename like 'A%'; -- A로 시작하는 모든 단어 찾기

where ename like '%E"; --E로 끝나는 단어


select *
from emp
where ename like '%A%A%'; -- A가 2개 들어있는 단어  ex)AdAmas

select *
from emp
where ename like '%A%A%'; -- A가 2개 들어있는 단어  ex)AdAmas

select *
from emp
where ename like '_A%'; - -- 두번째 글자가 A이고

--정규표현식 regewx_like()
select * from emp where regexp_like (ename,'[A-C]');

--과제 정규표현식 5개 만들기 / 추후에 카페

--데이터 정렬하기

--order by 컬럼명 : 문자, 숫자, 날짜 정렬가능
--오름차순 : asc : 낮은순 :default;
--내림차순 : desc: 높은순
--정렬(알고리즘) >> 비용이 많이 드는 작업(cost)

select * 
from emp
order by sal; --default order by sal asc

select *
from emp
order by sal desc;

--입사일이 가장 늦은 순으로 정렬해서 사번, 이름, 급여, 입사일 출력하세요

select EMPNO, ENAME, SAL, HIREDATE
from emp
order by HIREDATE desc;

/*
select 절      3
from 절        1
where 절       2
order by 절    4 (select 결과를 정렬)
*/

select empno, ename, sal, job, hiredate
from emp
where job='MANAGER'
order by hiredate desc;

--emp 테이블에서 job이 MANAGER인 사원의 사번, 이름, 급여, 직업, hiredate 를 hiredate의 내림차순(최근입사)으로 정렬하라.

select job, deptno
from emp
order by job asc, deptno desc; --job을 내림차순으로 정렬하고, job이 같다면 deptno 의 오름차순으로 정렬하라. >>grouping
--order by 컬럼명, asc, 컬럼명 asc, ....

--연산자 
--합집합(union)     : 테이블과 테이블의 데이터를 합치는 것 (중복값 배제)
--합집합(union all) : 테이블과 테이블의 데이터를 합치는 것 (중복값 허용)

create table uta(name varchar2 (20));
insert into uta (name) values('AAA');
insert into uta (name) values('BBB');
insert into uta (name) values('CCC');
insert into uta (name) values('DDD');
commit;

create table ut(name varchar2 (20));
insert into ut (name) values('AAA');
insert into ut (name) values('BBB');
insert into ut (name) values('CCC');
commit;

select * from uta;
select * from ut;


select * from ut
union
select * from uta;
--ut 집에 uta 식구들이 놀러가는 것 (중복 데이터 제거)

select * from ut
union all
select * from uta;
--ut 집에 uta 식구들이 놀러가는 것 (중복 데이터 안됨)

--union
--1. [대응]하는 [컬럼]의 [타입]이 동일

select empno, ename from emp  --순서 : 숫자 - 문자열
union
select dname, deptno from dept; --순서 : 문자열 - 숫자

select empno, ename from emp
union
select deptno, dname from dept;

--순서 나중에 subquery 를 사용해서 가상 테이블 ...

select *
from (
        select empno , ename from emp
        union
        select deptno, dname from dept
     ) m
order by m.empno desc;

--subquery 배울 때 in-lin view

--2. [대응]되는 [컬럼]의 개수가 [동일]

select empno, ename,  job, sal from emp
union
select deptno, dname, loc from dept; --union 불가

-- 필요악 (null) 컬럼의 대체
select empno, ename,  job, sal from emp
union
select deptno, dname, loc, null from dept;


------------------------------------------ null 이 컬럼을 대체
-- 초급 개발자 의무적으로 해야하는 코드 (단일 테이블 select)
-- 오라클.pdf (47 page)

show user;
select sysdate from dual;

/*
단일 행 함수의 종류 
1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다.
2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다.
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를
제외하고 모두 날짜 데이터형의 값을 RETURN 한다.
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다.
5) 일반적인 함수 : NVL, DECODE
*/

--문자열 함수 

select initcap('the super man') from dual; --단어의 첫글자를 대문자로

select lower('AAA'), upper('aaa') from dual;

select ename , lower(ename)as ename from emp;
select ename , lower(ename)as ename from emp;

select * from emp where lower(ename) = 'king';
select * from emp where ename = 'king';

select length('abcd') from dual; --문자열의 개수

select length('홍길동') from dual; --3개

select length('      홍  길  동 a') from dual; -- 15개 공백도 문자열로 읽음

select concat('a','b') from dual;
--select concat('a','b','c','d') from dual;
select 'a' || 'b' || 'c' from dual;

select concat(ename,job) from emp;
select ename || ' ' || job  from emp;

-- JAVA : substring
-- ORACLE : substr

select substr('ABCDE',2,3) from dual; --BCD 번호로부터'2' n개('3')를 출력 (시작점은 1이다)
select substr('ABCDE'1,1) from dual; --A 
select substr('ABCDE'3,1) from dual;

select substr('dfsfdfsfdsfsxxzfsfsfsdfs',3) from dual;

/*
사원테이블에서 ename 컬럼의 데이터에 대해서 첫글자는 소문자로 나머지 글자는 대문자로 출력하되
하나의 컬름으로 만들어서 출력하고, 컬럼의 별칭은 fullname 하고 첫글자와 
나머지 문자 사이에는 공백 하나를 작성
*/

select lower(substr(ename,1,1)) from emp;
select upper(substr(ename,2)) from emp ;
select upper(substr(ename,2,length(ename))) from emp;

select lower(substr(ename,1,1)) ||' '|| upper(substr(ename,2)) as fullname
from emp;

select lpad('ABC',10,'*') from dual; --*******ABC

select rpad('ABC',10,'*') from dual; --ABC*******

select rpad('ABC',5,'%') from dual; --ABC%%

-- 사용자의 비번 : kong1004 or k1234
-- 화면 출력 : ko****** or k1***

select rpad(substr('hong1004',1,2),length('hong1004'),'*') from dual;
select rpad(substr('k1234',1,2),length('k1234'),'*')from dual;

-- emp 테이블에서 ename 컬럼의 데이터를 출력하되 첫글자만 출력하고 나머지는 * 출력하세요

select rpad(substr(ename,1,1),length(ename),'*') as ename from emp;

create table member2(
    id number,
    jumin varchar2(14)
);

insert into member2(id,jumin) values(100,'123456-1234567');
insert into member2(id,jumin) values(200,'234567-2345678');
commit;

select * from member2;

select id ||' : '|| rpad(substr(jumin,1,7),length(jumin),'*') as jumin from member2;

--rtrim 함수
--오른쪽 문자를 지워라
select rtrim('MILLER','ER') from dual; --MILL

--ltrim
--왼쪽 문자를 지워라
select ltrim('MILLLLLLER','MIL') from dual; --ER

--공백제거
--select '>' ||'MILLAR'|| '<' from dual;

select '>' || rtrim('MILLAR              ',' ')|| '<' from dual;
select '>' || ltrim('MILLAR              ',' ')|| '<' from dual;

--치환함수
select ename, replace(ename,'A','와우') from emp;

--숫자함수
--round (반올림함수)
--trunc (절삭함수)
--mod() 나머지 구하는 함수

--    0(정수)
select round(12.345,0) as r from dual;  --정수부만 남겨라

select round(12.567,0) as r from dual; --13

select round(12.345,1) as r from dual; --12.3

select round(12.567,1) as r from dual; --12.6

select round(12.345,-1) as r from dual; -- 10

select round(15.345,-1) as r from dual; --20

select round(12.567,-2) as r from dual; --0



--trunc 버림
select trunc(12.345,0) as r from dual;  --12

select trunc(12.567,0) as r from dual; --12

select trunc(12.345,1) as r from dual; --12.3

select trunc(12.567,1) as r from dual; --12.5

select trunc(12.345,-1) as r from dual; -- 10

select trunc(15.345,-1) as r from dual; --10

select trunc(12.567,-2) as r from dual; --0

--나머지

select 12/10 from dual; --1.2 몫과 나머지

select mod(12, 10) from dual; -- 나머지 함수

select mod(0,0) from dual; --0으로 나눌 수 있다

select mod(50,0) from dual;
---------------------------------------------

-- 날짜 함수 (연산)

select sysdate from dual;
--POINT
--1. Date + Number >> DATE
--2. Date - Number >> DATE
--3. Date - Date   >> Number  (일수) ^^

select sysdate + 100 from dual;
select sysdate + 1000 from dual;
select sysdate - 1000 from dual;

select hiredate from emp;

select months_between('2022-09-27','2020-09-27') from dual; --개월을 구하는 함수
select trunc(months_between('2022-09-27','2020-09-27'),0) from dual; --trunc 을 사용해서 소숫점을 버림(정확한 개월수만 구함)

select months_between(sysdate, '2020-01-01') from dual;
select trunc(months_between(sysdate, '2020-01-01'),0) from dual;

--주의사항
select '2022-01-01' + 100 from dual; --'2022-01-01'을 [날짜형식]이지만 문자열로 생각한다
--해결 함수 : 문자를 날짜로 변경하는 함수 to_date()

select to_date('2022-01-01') + 100 from dual;


-- 사원테이블에서 사원들의 이사일에서 현재날짜까지의 근속 월수를 구하세요.
-- 사원이름, 입사일, 근속월수 출력
-- 단 근속월수는 정수부만 출력

select ename,hiredate,trunc(months_between(sysdate, hiredate),0) as 근속월수 from emp;

--한달이 31일 이라고 가정하고 ..... 기준에서 근 속 월수를 구하세요
--함수는 사용하지 마세요 (반올림하지마세요_)

select ename,hiredate,trunc((sysdate-hiredate)/31,0) as 근속월수 from emp;

----------------------------------------------------------------------------
--------------------문자함수, 숫자함수, 날짜함수 END---------------------------

--변환함수 TODAY POINT
--오라클 데이터 유형 : 문자열, 숫자, 날짜

--to_char() : 숫자 -> 형식문자 (100000(숫자) -> $100,000(문자)) >> format 출력형식정의
--to_char() : 날짜 -> 형식문자 ('2023-01-01' -> 2023년01월01일) >> format 출력형식정의


--to_date() : 문자(날짜형식) -> 날짜
--select to_date('2023-01-01') + 100 from dual;

--to_number() : 문자 -> 숫자 (자동 형변환)
select '100' + 100 from dual;
select to_number('100') + 100 from dual; 
--둘의 결과가 같다 to_number는크게 사용되지 않음.

--변환시 표 참조(오라클 교재 69~71 page)
--형식 format

select sysdate , to_char(sysdate,'YYYY') || '년' as yyyy ,
to_char(sysdate, 'YEAR') as YEAR ,
to_char(sysdate, 'MM') as MM ,
to_char(sysdate, 'DD') as DD ,
to_char(sysdate, 'DAY') as DAY
from dual;

-- 입사일이 12월인 사원의 사번, 이름, 입사일, 입사년도, 입사월을 출력하세요.

select empno, ename, hiredate ,to_char(hiredate,'YYYY') as 입사년도 ,to_char(hiredate, 'MM') 입사월
from emp
where to_char(hiredate,'MM') ='12';


select '>'|| to_char(12345,'999999999999')|| '<' from dual; --공백출력

select '>'|| ltrim(to_char(12345,'999999999999'),' ')|| '<' from dual; -- 공백제거

select '>'|| to_char(12345,'$999,999,999,999,999,999') || '<' from dual;

select sal ,to_char(sal,'$999,999')as 급여 from emp;

-- HP계정 이동

show user;
select * from employees;

--select first_name || last_name as fullname

select concat(first_name,last_name) as fullname, to_char(hire_date,'YYYY_MM_DD') as 입사일, to_char((SALARY*12)*1.1,'$999,999,999,999,999,999') as 연봉인상액
from employees
where to_char(hire_date,'YYYY') >= '2005' 
order by 연봉인상액 desc; 
--select 한 결과를 정렬하기 때문에 select 컬럼명

show user;

select 'A' as a, 10 as b, null as c, empno from emp;
from emp;
---------------------------------------------------------------------
--문자, 숫자, 날짜, 변환함수(to_..)
---------------------------------------------------------------------
--일반함수 (프로그래밍 성격이 강하다)
--SQL (변수, 제어문 개념이 없다)
--PL-SQL (programming language)(변수, 제어문 ......)고급기능 (트리거, 커서, 프로시져)

--nvl() null 처리하는 함수
--decode() >> java의 if문    >> 통계 데이터(분석) >> pivot , cube , rollup
--case() >> java switch문


select comm, nvl(comm,0) from emp;

create table t_emp(
    id number(6), --정수 6자리
    job nvarchar2(20) --unicode 영문자, 한글 2byte ...... 20자 >>40byte
);

delete table t_emp;

desc t_emp;

insert into t_emp(id,job) values(100,'IT');
insert into t_emp(id,job) values(200,'SALES');
insert into t_emp(id,job) values(300,'MANAGER');
insert into t_emp(id,job) values(400);
insert into t_emp(id,job) values(500,'MANAGER');
commit;

select * from t_emp;

select id, decode(id,100,'아이티',
                    200,'영업팀',
                    300,'관리팀',
                    '기타부서') as부서이름
from t_emp;

select empno, ename , deptno, decode(deptno, 10 , '인사부',
                                             20 , '관리부',
                                             30 , '회계부',
                                             40 , '일반부서',
                                             'ETC')as 부서이름
from emp;

create table t_emp2(
    id number(2),
    jumin char(7) -- char 고정길이 문자열  -- data가 고정적일때 사용하는 타입  (// varchar 가변길이 문자열)
);

desc t_emp2;
insert into t_emp2(id,jumin) values(1,'1234567');
insert into t_emp2(id,jumin) values(2,'2234567');
insert into t_emp2(id,jumin) values(3,'3234567');
insert into t_emp2(id,jumin) values(4,'4234567');
insert into t_emp2(id,jumin) values(5,'5234567');
commit;

select * from t_emp2;

/*

t_emp2 테이블에서 id, jumin 데이터를 출력하되 jumin컬럼의 앞자리가 
1이면 남성, 2이면 여성, 3이면 중성 기외는 기타.
*/

select id, jumin, decode( substr(jumin,1,1) , 1,'남성',
                                          2,'여성',
                                          3,'중성',
                                         '기타')as 성별
from t_emp2;


--if안에 if 올 수 있다.
--decode 안에 decode 가질 수 있다
--decode(decode())

/* 응용문제
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이라면 HELLO
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이 아니라면 WORLD
부서번호가 20번이 아이면 ETC
*/
select empno, ename, decode(empno,20,decode(ename ,'SMITH', 'HELLO','WORLD'),
                                        'ETC')from emp;
                                        
--CASE 문
/*

CASE 조건식 WHEN 결과1 THEN 출력1
           WHEN 결과2 THEN 출력2
           WHEN 결과3 THEN 출력3
           WHEN 결과4 THEN 출력4
           ELSE 출력5
from "컬럼명"
*/

create table t_zip(
    zipcode number(10)
);

desc t_zip;

insert into t_zip(zipcode) values(2);
insert into t_zip(zipcode) values(31);
insert into t_zip(zipcode) values(16);
insert into t_zip(zipcode) values(45);
commit;

select * from t_zip;

select '0' || to_char(zipcode) ,case zipcode when 2  then '서울'
                                             when 31 then '경기'
                                             when 16 then '폰'
                                             when 45 then '제주'
                                             else '기타'
                                end 지역이름
from t_zip;


/*

사원테이블 사원급여가 1000 이하면 급
2000 3급 , 3000 2급 , 4000 1급, 위로 특급

CASE 조건식 WHEN 결과1 THEN 출력1.

2. 조건식이 필요하다면
case when 조건 비교식 then 결과,
case when 조건 비교식 then 결과,
case when 조건 비교식 then 결과,
else
*/
select * from emp;

select ename, sal, deptno, case  when sal <=1000 then '4급'
                                when sal between 1001 and 2000 then '3급'
                                when sal between 2001 and 3000 then '2급'
                                when sal between 3001 and 4000 then '1급'
                                else '특급'
                                end 등급
from emp;

select ename, sal, deptno, case when sal <=1000 then '4급'
                                when sal >1000 and sal <=2000 then '3급'
                                when sal >2000 and sal <=3000 then '2급'
                                when sal >3000 and sal <=4000 then '1급'
                                else '특급'
                                end 등급
from emp;
--------------------------------------------------------------------------
--문자함수, 숫자함수, 날짜함수, 변환함수, 일반함수 (nvl, decode, case)
--------------------------------------------------------------------------
--pdf교재 75page

--집계함수(그룹)
/*
1. count(*) >> row수 , count(컬럼명)>> 데이터 건수
2. sum()
3. avg()
4. max()
5. min()
기타

1. 집계함수는 group by 결과 같이 사용
2. 모든 집계함수는 null 값을 무시한다
3. select 절에 집계함수 이외에 다른 column이 오면 반드시 그 러럼은 group by 절에 명시
*/

select count(*) from emp; -- 14개의 row 데이의 개수

select count(empno) from emp; --14개

select count(comm) from emp; --집계함수는 null값을 인지하지 못한다. null이 아닌 데이터만 카운팅한다.

select count(nvl(comm,0)) from emp; --14건 nvl로 null을 0으로 채웠기 때문에 count 됨.

--급여의 합
select sum(sal) from emp;

select trunc(avg(sal)) from emp;

--사장님 .... 총 수당이 얼마나 지급되었나?

select sum(comm) from emp;

--수당의 평균은 얼마지?

select trunc(avg(comm)) from emp; --721

select comm from emp;


select (300+200+30+300+3500+0)/6 from dual; --null을 무시하기 때문에 comm이 없는 직원의 수는 고려하지 않음

select (300+200+30+300+3500+0)/6 from dual;
select trunc(avg(nvl(comm,0)))from emp;

--comm 이 있는 사원들만의 평균, comm이 없는 사원도 포함된 평균 모두 맞다. (기준에 따라 달라진다)

-- 결론 : null에 대한 고민이 필요하다!!

select max(sal) from emp;
select min(sal) from emp;

select sum(sal), avg(sal), max(sal), min(sal), count(sal) -- 각각의 데이터가 1건이기 때문에 실행 가능하다
from emp;

select empno, count(empno) from emp;  --"not a single-group group function"


--부서별 평균 급여를 구하세요
select deptno, avg(sal)
from emp
group by deptno;


--직종별 평균 급여
select job , avg(sal)
from emp
group by job; -- 문법적인 오류는 없지만 (판단 할 수 없다.)\\

select job, avg(sal), sum(sal),max(sal),min,(sal)count(sal)
from emp
group by job

-- group
-- disctinct 컬럼명1. 컬럼명2
-- order by 럴럼명1. 컬럼명2

-- 부서별 직종별 급여의 합을 구하셍

select deptno, job, sum(sal), count(sal)
from emp
group by deptno, job
order by deptno; --부서번호 ..그안에서 작품별 그룹 ... 합계
/*
select 절        4
from 절          1
where 절         2
group by 절      3
order by 절      5
*/

-- 직종별 평균급여가 3000 달러 이상인 직종과 평균 급여를 출력하세

--select deptno, ename, job ,avg(sal)
--from emp
--where avg(sal) >=3000;

select job, avg(sal)
from emp
group by job
having avg(sal) >=3000;

--from 절의 조건절 >> where
-- group by 절의 조건절 >> having (집계함수 조건을 쳐라)

/*
select 절        5
from 절          1
where 절         2
group by 절      3
having 절        4
order by 절      6

단일 테이블에 처리할 수 있는 모든 구문
*/


/* 사원테이블에서 직종별 급여합을 출력하되 수당은 지급받고 급여의 합이 5000 이상인
사원들의 목록을 출력하시ㅇ. (comm 0인 사원도 받는 것으로 취급)
급여의 합이 낮은 순으로 출력하시오
*/
select job ,sum(sal) as sumsal
from emp
where comm is not null
group by job
having sum(sal) >=5000
order by sumsal asc;

/*
사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력하시오.
*/
select * from emp;

select deptno, count(deptno), sum(sal)
from emp
group by deptno
having count(*) >4;
-- select count(*) from emp where job is null; -- null 여부 확인하자


/*
사원테이블에서 직종별 급여의 합이 5000를 초과하는 직종과 급여의 합을 출력하세요
단 판매직종 은 제외하고 급여의 합으로 내림차순 정렬하시오
*/
select job, sum(sal) 
from emp
where job != 'SALESMAN'
group by job
having sum(sal) >5000
order by sum(sal) desc;

/*
HR 계정으로 이동하세요

1. EMPLOYEES 테이블을 이용하여 다음 조건에 만족하는 행을 검색하세요. 
2005년이후에 입사한 사원 중에 부서번호가 있고, 급여가 5000~10000 사이인 사원을 검색합니다. 
가) 테이블 : employees 
나) 검색 : employee_id, last_name, hire_date, job_id, salary, department_id 
다) 조건
    ① 2005년 1월 1일 이후 입사한 사원
    ② 부서번호가 NULL이 아닌 사원 
    ③ 급여가 5,000보다 크거나 같고, 10,000 보다 작거나 같은 사원 
    ④ 위의 조건을 모두 만족하는 행을 검색 
라) 정렬: department_id 오름차순, salary 내림차순
*/
select * from employees;
select employee_id, last_name,hire_date, salary
from employees
where department_id is not null 
        and SALARY between 5000 and 10000 
        and hire_date > to_date('2005-01-01') -- hire_date > '2005/01/01'
order by department_id asc , salary desc;


/*
2. EMPLOYEES 테이블을 이용하여 다음 조건에 만족하는 행을 검색하세요. 
부서번호가 있고, 부서별 근무 인원수가 2명 이상인 행을 검색하여 부서별 최대 급여와 최소 급여를 계산하
고 그 차이를 검색합니다. 
가) 테이블 : employees 
나) 검색 : department_id, MAX(salary), MIN(salary), difference 
        - MAX(salary) 와 MIN(salary)의 차이를 DIFFERENCE로 검색 
다) 조건
    ① 부서번호가 NULL이 아닌 사원 
    ② 부서별 근무 인원수가 2명 이상인 집합 
라) 그룹 : 부서번호가 같은 행
마) 정렬 : department_id 
*/
select * from employees;

select department_id, MAX(salary), MIN(salary), MAX(salary)-MIN(salary) as difference
from employees
where department_id is not null 
group by department_id
having count(*) >=2
order by department_id;
show user;

-----------------------------------------------------------------------------------------
--단일 테이블 쿼리 END---------------------------------------------------------------------

--ETC
--create table 테이블명 (컬럼명 타입, 컬럼명 타입)
create table member3(age number);

--데이터 1건
insert into member3(age) values (100);

--데이터 여러건
insert into member3(age) values (200);
insert into member3(age) values (300);
insert into member3(age) values (400);

------------------------------------------------------------------------
/*
JAVA
class Member3 { private int age; setter, getter}

--1건
Member3 member = new Member3()
member.setAge(100);

-- 다수의 데이터
List<Member3> mlist = new ArrayList<>();
mlist.add(new Member3(100));
mlist.add(new Member3(200));
mlist.add(new Member3(300));


데이터 타입
문자열 데이터 타입
char(10)    >>10byte >> 한글 5자, 영문자, 특수, 공백 10자 >> 고정길이 문자열
varchar(10) >>10byte >> 한글 5자, 영문자, 특수, 공백 10자 >> 가변길이 문자열

고정길이 (데이터와 상관없이 크기를 갖는것)
가변길이 (들어오는 데이터 크기만큼 확보)

char(10) >> 'abc' >> [a][b][c][][][][][][][] >> 공간의 크기는 변화가 없다
varchar2(10) >> 'abc' >>[a][b][c] >> 데이터 크기 만큼 공간 확보

데이터 검색에 있어서 >> char() 가 더 성능이 좋다. >> 고정길이.... 가변보다는 좀 앞서서 검색

char 와 varchar의 사용

char(2) : 고정길이 ex) 남,여 ... 대,중,소 ... 주민번호.... << 검색성능이 좋다
varchar : 사람의 이름, 취미,주소 ...  <<입력받을 데이터의 크기를 예측할 수 없을 때.

한글, 영어권 >> 한문자 >> unicode >>한글, 영문 >> 2byte >>nchar 한문자의 크기를 고정으로 /타입이 가지는 숫자는 문자의 길이

nchar(20) >> 20자 >> 영어 특수문자 공백 상관없이 20자를 기본으로 한다 >> 40byte
nvarchar2(20) >> 20자





*/

--오라클 함수 ......
select * from SYS.NLS_DATABASE_PARAMETERS;
--NLS_CHARACTERSET  : 	AL32UTF8  한글 3byte 인식
--KO16KSC5601 2Byte (현재 변환하면 한글 다깨짐)
select * from nls_database_parameters where parameter like '%CHAR%';
------------------------------------------------------------------------------
create table test2(name varchar2(2));

insert into test2(name) values('a');
insert into test2(name) values('aa');
insert into test2(name) values('가'); --한글 1자 3byte 인지 // 오라클 영문판 // 이럴수도 있다? 고민해야할 수 도 있다>?
-------------------------------------------------------------------------------
?-- 오라클 pdf 파일 5장
/*
--JOIN
Cartesian Product   모든 가능한 행들의 Join
Equijoin Join       조건이 정확히 일치하는 경우 사용(일반적으로 PK 와 FK 사용)
Non-Equijoin Join   조건이 정확히 일치하지 않는 경우에 사용(등급,학점)
Outer Join Join     조건이 정확히 일치하지 않는 경우에도 모든 행들을 출력
Self Join           하나의 테이블에서 행들을 Join 하고자 할 경우에 사용
Set Operators       여러 개의 SELECT 문장을 연결하여 작성한다

Equijoin
Non-Equijoin
Outer Join
Self Join

관계형 DB (RDBMS)

관계 (테이블과 테이블의 관계)
(클래스 (자바) 비교) >> 연관관계 존재 

1:1
1:N (70%)
M:N

create table M (M1 char(6) , M2 char(10));
create table S (S1 char(6) , S2 char(10));
create table X (X1 char(6) , X2 char(10));

insert into M values('A','1');
insert into M values('B','1');
insert into M values('C','3');
insert into M values(null,'3');
commit;

insert into S values('A','X');
insert into S values('B','Y');
insert into S values(null,'Z');
commit;

insert into X values('A','DATA');
commit;

*/

show user;

select * from M;
select * from S;
select * from X;1

--1. 등가조인 (equi join)
--원테이블과 대응되는 테이블에 있는 컬럼의 데이터를 1:1 매핑
--SQL JOIN 문법 (오라클) 간단
--ANSI 문법(권장) >> 다른 SQL에서도 공통적임 >> [inner]join  on 조건절

select * 
from m, s
where m.m1 = s.s1;

--기본 SQL 문법
select m.m1 , m.m2, s.s2
from m, s
where m.m1 = s.s1;

--ANSI (표준문법)
select *
from m join s -- m inner join s
on m.m1 = s.s1;

select * from emp;

-- 사원번호, 사원이름, 부서번호, 부서이름을 출력하세요
select emp.empno, emp.ename, emp.deptno, dept.dname
from emp join dept
on emp.deptno = dept.deptno;

--현업에서는 table이름이 길다
--현업 (테이블 가명칭 부여)
select e.empno, e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;

--***조인은 select * 하고 나서 컬럼을 명시
select s.s1, s.s2, x.x2
from s join x
on s.s1 = x.x1;
--테이블과 테이블의 컬럼이 1대1 매핑 :등가조인

select sysdate from dual;
-----------------------------------------------------------------------
--0419

--SQL JOIN 문법
select *
from m, s, x
where m.m1 = s.s1 and s.s1=x.x1;

-- SQL 문법의 단점 : where의 조건문이 어느절의 조건문인지 알기어려움.

--ANSI 문법(권장)
select*
from m join s on m.m1 = s.s1
       join x on s.s1 = x.x1;
--     Join y on x.x1 = y.y1;

show user;
select * from employees;
select * from departments;
select * from locations;


select count(*) from employees;
--사번, 이름(last name), 부서번호, 부서이름 출력
select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

select  e.employee_id, e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;
--1명 누락(department_id =null) >>outer join을사용

--사번, 이름 ,부서번호, 부서이름, 지역코드 ,도시명
select e.employee_id, e.last_name, e.department_id, d.department_name, d.location_id, l.city
from employees e join departments d on e.department_id = d.department_id
                 join locations l on d.department_id = l.location_id;
                 
show user;

select * from emp;
select * from salgrade;              

--사원의 등급 (하나의 컬럼으로 매핑 안되요)>> 컬럼 2개
--비등가 조인 (non-equi) 1:1
--문법 : 등가와 동일(의미)

select e.empno, e.ename, d.grade, e.sal
from emp e join salgrade d
on e.sal between d.losal and d.hisal;

-- outer join equi 조인 선행되고 나서 >> 남아있는 데이터를 가져오는 방법
-- 1. 주종 관계 (주인이 되는 쪽에 남아있는 데이터를 가져오는 방법)
-- 2. left outer join
-- 3. right outer join
-- 2.2 full outer join >>(left, right >> union)

select *
from m left outer join s
on m.m1 = s.s1;

select *
from m right outer join s
on m.m1 = s.s1;

select *
from m full outer join s
on m.m1 = s.s1;


--사번, 이름(last name), 부서번호, 부서이름 출력
select  e.employee_id, e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;
--1명 누락(department_id =null) >>outer join을사용

select  e.employee_id, e.last_name, e.department_id, d.department_name
from employees e left join departments d
on e.department_id = d.department_id;
-- 현업 데이터 (null 고민 JOIN >> outer join)
select *from employees where department_id is null;

-- self join(재기참조) -> 문법(X) -> 의미만 존재 -> 등가조인 문법
-- 하나의 테이블에 있는 컬럼이 자신의 테이블에 있는 특정 컬럼을 참조하는 경우

select * from emp;
-- SMITH 사원의 사수 이름 -> MGR, EMPNO로 찾는다.
-- 관리자 테이블을 따로 생성해서 만드는 건 어떤가요?
-- 데이터 중복이 발생 -> 비효율
-- 테이블에 가명칭 >> 2개, 3개 있는 것처럼

--13명출력
select e.empno , e.ename , m.empno, m.ename
from emp e  join emp m
on e.mgr = m.empno;

--14명출력
select e.empno , e.ename , m.empno, m.ename
from emp e left join emp m
on e.mgr = m.empno;


select count(*) from emp where mgr is null;

-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
    
select * from emp;   
select * from dept;

select e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;

-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을

-- 출력하라.

select e.ename , e.job, e.deptno,d.dname 
from emp e join dept d 
on e.deptno = d.deptno
where d.loc = 'DALLAS';



-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.

select e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.ename like '%A%';




-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을

--출력하는데 월급이 3000이상인 사원을 출력하라.

select e.ename , d.dname, e.sal 
from emp e join dept d
on e.deptno = d.deptno
where e.sal >=3000;

select e.ename, d.dname, e.sal
from emp e join dept d
on e.deptno = d.deptno
where sal >= 3000;


-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고

-- 그 사원이 속한 부서 이름을 출력하라.

select * from emp;
select * from dept;
select * from salgrade;

select e.job , e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';




-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,

-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',

-- '연봉','실급여', '급여등급'으로 하여 출력하라.

--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다

select * from salgrade;

select e.empno as 사원번호, e.ename as 사원이름, 
       e.sal*12+comm as 연봉,sal as 실급여, s.grade as 등급
from emp e join salgrade s 
on e.sal between s.losal and s.hisal
where e.comm is not null;

-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,

-- 월급, 급여등급을 출력하라.

select e.empno, d.dname, e.ename ,e.sal ,s.grade
from emp e join dept d on e.deptno = d.deptno
           join salgrade s on e.sal between s.losal and s.hisal
where e.deptno = '10' ;



-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,

-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된

-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로

-- 정렬하라.
select * from dept;
select * from salgrade;
select * from dept;
select * from emp;
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join dept d on e.deptno = d.deptno
           join salgrade s on e.sal between s.losal and s.hisal
where e.deptno = '10' or e.deptno = '20';      
                 

-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의

-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',

-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.

-- SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)

select e.empno as 사원번호 , e.ename as 사원이름 , e.mgr as  관리자번호, p.ename as  관리자이름
from emp e left join emp p
on e.empno = p.mgr;





-------------------------------------------------------------------------------
--JOIN END ---------------------------------------------------------

--subquery(서브쿼리) 100page
--sql 꽃 -> 만능 해결사

--1. 함수 > 단일 테이블 > 다중 테이블 (join, union) > 해결 안될때 >> subquery 해결

--사원테이블 사원들의 평균 월급보다 더 많은 월급을 받는 사원의 사번,이름 ,급여 를 추력

-- 불가능 : 이유

--1. 평균급여
select avg(sal) from emp;

select empno, ename 
from emp  
where sal > 2073;--avg(sal);

--두개의 쿼리는 통합해서 하나의 쿼리로 작성

select empno, ename, sal
from emp
where sal > (select avg(sal) from emp);

--subquery
/*
1. single row subquery : 서브쿼리의 실행결과가 단일 컬럼에 단일로우값 인 경우 (한개의 값)
ex) select sum(sal) from emp, select max(sal) from emp
연산자 : = , !=, <, >

2. multi row subquery : 실행 결과가 단일컬럼에 여러개의 로우값인 경우
ex) select deptno from emp, select sal from emp
연산자 : IN, NOT IN, ANY, ALL
ALL : sal> 1000 and sal >40000 and ...
ANY : sal> 100 or sal > 400 or .....

문법)
1. 괄호안에 있어야 된다. (select max(sal) from emp)
2. 단일 컬럼 구성       (select max(sal), min(sal) from emp) 서브쿼리 안된다.
3. 서브쿼리가 단독으로 실행 가능

서브 쿼리 외의 메인 쿼리
1. 서브쿼리 실행되고 그 결과를 가지고
2. 메인쿼리가 실행된다.

TIP) 
select (subquery) >> scala subquery
from (subquery) >> in lin view (가상테이블)
where (subquery) >> 조건
https://cafe.naver.com/erpzone

*/

--사원테이블에서 jones의 급여보다 더 많은 급여를 받는 사원의 사번, 이름, 급여를 출력
-- jones의 급여를 우선 알아야한다
-- 1.select sal from emp where ename='JONES';

select empno, ename, sal
from emp
where sal >(select sal from emp where ename='JONES');

-- 부서번호가 30번인 사원과 같은 급여를 받는 모든 사원의 정보를 출력
-- select sal from emp where deptno=30; multi row


select *
from emp 
where sal in (select sal from emp where deptno=30);
-- sal=1600 or sal =1250

select *
from emp 
where sal not in (select sal from emp where deptno=30);
-- sal != 1600 and sal !=1250.....

--부하직원이 있는 사원의 사번과 이름을 출력

select mgr from emp;

select empno,ename
from emp
where empno in (select mgr from emp);


select empno,ename
from emp
where empno not in (select nvlmgr from emp);
-- empno != 7902 and emp != 7698 ... empno != null
-- and 연산에 null 이 있으면 결과는 모두 null
-- not in 은 부정의 and

select empno,ename
from emp
where empno not in (select nvl(mgr,0) from emp);

-- king에게 보고하는 즉 직속상관이 king인 사원의 사번,이름,직종 ,관리자사바ㅓㄴ을 출력
select empno, ename, job ,mgr
from emp
where mgr IN (select empno from emp where ename='KING');


--20번 부서의 사원중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 사원의
-- 사번, 이름, 급여, 부서번호를 출력

select empno, ename, sal , deptno
from emp
where sal > (select max(sal) from emp where deptno ='20');

--JOIN하지말고 부서이름도 출력?
--스칼라 서브쿼리

select e.empno, e.ename , e.deptno, (select d.dname from dept d where d.deptno = e.deptno)
from emp e
where e.sal >= 3000;

--자기 부서의 평균 월급보다 더 많은 월급을 받는 사원의 사번, 이름, 부서번호, 부서별 평균월급

select avg(sal) from emp where deptno;

select e.ename, e.empno, e.deptno, e.sal, s.avgsal
from emp e left join (select deptno, trunc(avg(sal),0) as avgsal from emp group by deptno) s
on e.deptno = s.deptno
where e.sal > s.avgsal;




select deptno,avg(sal)as avg from emp group by deptno;


select e.ename, e.empno, e.deptno, e.sal, s.avgsal
from emp e left join (select deptno, trunc(avg(sal),0) as avgsal from emp group by deptno) s
on e.deptno = s.deptno
where e.sal > s.avgsal;

--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.

?
SELECT ENAME , SAL
FROM EMP 
WHERE sal > (SELECT sal FROM emp WHERE ENAME ='SMITH');
?

--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,

-- 부서번호를 출력하라.

?
SELECT ename, sal, deptno
from emp
where sal in (select sal 
              from emp 
              where deptno='10');
?

--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데

-- 'BLAKE'는 빼고 출력하라.

?

select ename, hiredate
from emp
where deptno= (select deptno 
               from emp 
               where ename='BLAKE') 
        and ename!='BLAKE';
?

?

--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을

-- 출력하되, 월급이 높은 사람 순으로 출력하라.

?
select e.ename, e.empno, e.sal
from emp e
where sal >(select trunc(avg(sal),0) from emp)
order by sal desc;

--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고

-- 있는 사원의 사원번호와 이름을 출력하라.

select ename, empno
from emp
where deptno in (select deptno 
                 from emp 
                where ename like '%T%');
?

--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다

-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.

--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)

?
select ename , deptno, sal 
from emp
where sal > (select max(sal) 
             from emp 
             where deptno='30');
?
select ename , deptno, sal 
from emp
where sal > ALL(select sal 
             from emp 
             where deptno='30');
             
-- where sal > 100 and sal > 1250 .... >> ALL 을 사용하면 max값과 비교한 것과 같다.



--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의

-- 이름, 부서번호, 직업을 출력하라.

?
select distinct e.ename, e.deptno, e.job
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO    -- = 이 맞는데  IN
                FROM DEPT
                WHERE LOC='DALLAS');

--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.


select e.ename, e.deptno, e.job
from emp e
where deptno = (select distinct deptno from dept where dname='SALES');


?

?

--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라

--king 이 사수인 사람 (mgr 데이터가 king 사번)

?
select ename, sal
from emp
where mgr = (select empno 
             from emp 
             where ename='KING');
?

?


?

--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는

-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,

-- 급여를 출력하라.

?

select empno, ename, sal
from emp
where sal> (select avg(sal) from emp) 
      and deptno in (select deptno from emp where ename like '%S%');
?

?

?

--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의

-- 이름, 월급, 부서번호를 출력하라.

?
select ename, sal, deptno
from emp
where deptno in (select deptno from emp where comm is not null)
and sal in (select sal from emp where comm is not null);
?

?

--12. 30번 부서 사원들과 월급과 커미션이 같지 않은

-- 사원들의 이름, 월급, 커미션을 출력하라.

select ename, sal ,comm
from emp
where sal not in (select sal from emp where deptno ='30') 
      and comm not in(select comm from emp where deptno ='30' and comm is not null);
      
SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL NOT IN(SELECT SAL
                 FROM EMP
                 WHERE DEPTNO=30)
AND COMM NOT IN(SELECT NVL(COMM, 0)
                FROM EMP
                WHERE DEPTNO=30 and comm is not null);
     
     
------------------------------------------------------------------
-- 기본적인 DML 구분 (필수암기)---------------------------------------

-- 데이터 조작(DML) 입니다.
--168page
--insert, update, delete (반드시 암기)

/*
DDL(데이터 정의어) : create, alter, drop, trucate(공간까지지워), rename, modify
DML(데이터 조작어) : 트랜잭션을 일으키는 작업 : insert, update, delete

--재미있는 이야기
ex) DB의 select는 잘되는데, insert,update, delete 안된다. Why?
   >> 갑자기 log write 를 수행하는 작업 (누가, 언제, 어떤, 무슨기록)
   >> DISK 기록 (log file full) - log wirte 불가능 (기록공간부족) >>DML 작업 불가능
   >> log backup >> backup을 해야 log를 삭제가능 
   
   >> commit 하지 않은 경우..
   
DQL(데이터 질의어) : select
DCL(데이터 제어어) control language : 관리자 - 권한부여 / 다루지않음

TCL(트랜젝션) : commit , rollback, savepoint
*/

-- 오라클 insert, update, delete 작업 후 반드시 commit, rollback 처리 필수

select * from tab; --사용자(KOSA) 계정이 가지고 있는 table 목록

-- 내가 테이블을 생성 ... 그 이름이 있는지 없는지
select * from tab where tname='BOARD';
select * from tab where tname='EMP'; --table 명은 반드시 대문자로 작성

select * from col where tname = 'EMP'; 
-- TIP) tab, col 테이블 사용하기

-------------------------------------------------------------------------------
--insert, update, delete 무조건 암기

--1. INSERT
create table temp(
    id number primary key, --not null, unique 받겠다. (회원ID...)
    name varchar2(20)
);

desc temp;

--1. 일반적인 insert
insert into temp (id, name) values (100,'홍길동');

--commit, rollback 하기 전까지 실반영하지 않아요.
select * from temp;
commit;

--2. 컬럼 목록 생략 (insert) 쓰지마세요
insert into temp values(200,'김유신');
-- 컬럼리스트를 생략하면 주어진 모든 컬럼에 값을 넣어야한다.

select * from temp; --김유신 데이터 확인
rollback; -- 김유신 데이터 사라짐

--3. 문제 .... insert
insert into temp(name) values ('아무개');

--자동 id 컬럼 >> null >> PK >> 오류발생 >>ORA-01400: cannot insert NULL into ("KOSA"."TEMP"."ID")

insert into temp(id,name) values(100,'개동이');
--PK컬럼의 중복데이터 입력 >> 오류발생 >>ORA-00001: unique constraint (KOSA.SYS_C007000) violated

insert into temp(id,name) values (200,'정상값');
select * from temp;
commit;

------------------------------------------------------------------------------
--TIP
--SQL 은 프로그램의 요소가 없다. 
--PL-SQL은 변수, 제어문 
create table temp2 (id varchar(50));
desc temp2;
--PL-SQL
/*
BEGIN
    FOR i IN 1..100 LOOP
        insert into temp2(id) values('A'|| to_char(i));
    END LOOP;
END;
*/

select * from temp2;

create table temp3(
    memberid number(3) not null, --3자리 정수
    name varchar2(10), -- null 허용
    regdata date default sysdate -- 테이블 기본값 설정 insert 하지 않으면 자동 (날짜) 들어가게 한다.
);

desc temp3;

select sysdate from dual;

-- 1. 정상
insert into temp3(memberid, name, regdata) values (100,'홍길동','2023-04-19');

select* from temp3;

-- 2. 날짜
insert into temp3(memberid,name) values (200,'김유신'); --default sysdate

select * from temp3;

--3. 컬럼 하나
insert into temp3(memberid) values (300);
select * from temp3;

--4. 오류
insert into temp3(name) values('나누구');
--id 컬럼의 null << not null << ORA-01400: cannot insert NULL into ("KOSA"."TEMP3"."MEMBERID")

------------------------------------------------------------------------------------------------
-- TIP)
create table temp4(
    id number
);

create table temp5(
    num number
);

desc temp4;
desc temp5;

insert into temp4(id) values(1);
insert into temp4(id) values(2);
insert into temp4(id) values(3);
insert into temp4(id) values(4);
insert into temp4(id) values(5);
insert into temp4(id) values(6);
insert into temp4(id) values(7);
insert into temp4(id) values(8);
insert into temp4(id) values(9);
insert into temp4(id) values(10);
commit;

select * from temp4;

-- 대량 데이터 삽입하기

select * from temp5; -- 현재 값이 없음.

-- 하고싶은것 : temp4 테이블의 모든 데이터를 temp5에 넣고싶다.
--insert into 테이블명(컬럼리스트) values (value 리스트);
--insert into 테이블명(컬럼리스트) valuse select 절~~~`
insert into temp5(num) select id from temp4;
-- 조건 데이터 타입일치
select * from temp5; 
--대량 데이터 삽입하기
commit;

--2번째 대량 데이터 삽입하기

--조건 : 데이터를 담을 table이 없는상황
-- >> 테이블 구조(복제):스키마 + 데이터삽입 방법
-- 단, 제약정보는 복제할 수 없다.(PK, FK)
-- 순수한 데이터 구조 + 데이터

create table copyemp
as 
select * from emp;

select * from copyemp;

drop table copyemp;

select * from copyemp;

create table copyemp2
as
    select empno,ename , sal
    from emp
    where deptno =30;

select * from copyemp2;

-- 토막퀴즈
-- 틀만(스키마) 복제 데이터는 복제하고 싶지 않다.
create table copyemp3
as 
    select * from emp where 1=1; --복제
    
desc copyemp3;

select * from copyemp3;


create table copyemp31
as 
    select * from emp where 1=2; --부정 >> 틀만 복제
    
select * from copyemp31;
-------------------------------------------------------------------------------

---UPDATE

/*
UPDATE 테이블명
set 컬럼명 = 값 , 컬럼명 = 값, 컬럼명 = 값,컬럼명 = 값 ......
where 조건절

update 테이블명
set 컬럼명 = subquery가 올 수 있다.
where 컬럼명 = subquery가 올 수 있다.
update subquery 가 잘 온다

*/

select *from copyemp;

update copyemp
set sal = 0;

select * from copyemp;
rollback;

update copyemp
set sal = 1111
where deptno=20;

select * from copyemp;
rollback;

update copyemp 
set sal = (select sum(sal) from emp);
--copyemp 의 sal 컬럼의 값을 모두 sal의 합의 값으로 변환

select * from copyemp;
rollback;

update copyemp
set ename ='AAA' , job='BBB', hiredate =sysdate , sal = (select sum(sal) from emp)
where empno=7788;

select *from copyemp;
commit;
-----------------------------------------------------------------------------
-------------------------------- UPDATE END ---------------------------------

--DELETE
delete from copyemp;

select * from copyemp;
rollback;

delete from copyemp
where deptno=20;

select * from copyemp where deptno ='20';
commit;

------------------------------------------------------------------------------
--- DELETE END ---------------------------------------------------------------

--0420------

/*
개발자 (SQL)

1. CRUD (create > insert , read > select, update ,delete )
2. APP(JAVA) - 표준(JDBC API) - Oracle
3. insert , update , delete ,select (70%)

하나의 테이블에 대해서 작업가능
JAVA 에서 EMP 테이블 접근 (CRUD)
APP(JAVA)
MVC(패턴) >> model(DTO,DAO,SERVICE) - View(html,jsp) - Controller(servlet) (니가 잘하는 것만 해)

DB 작업 (DAO) >> EmpDao.java >> DB연결(CRUD)
기본적으로 5개의 함수 생성 .....
1. 전체조회 (함수) : select * from emp 처리 함수
>> public list<Emp> getEmpList() {쿼리문 return null;}
>> 데이터 여러건
2. 조건조회 (함수) : select * from emp where empno=
>> public Emp getEmpListByEmpno(int empno) { select * from emp where empno=? return null;}
>> 데이터 한건
3. 삽입 (함수)    : insert into emp(..) values(...)
>> public int insertEmp(Emp emp) {insert ... return row;}
4. 수정 (함수)    : update emp(...) set(....) where (...)
5. 삭제 (함수)    : delete emp where ....
*/

-- 9장 테이블 생성하기
-- page 138


--DDL(create, alter, drop , rename ) 테이블(객체) 생성, 수정, 삭제
--코드를 모르더라도 할 수는 있다... -> 코드를 작성하자!

select * from tab;

select * from tab where tname =lower('board');

create table board(
    boardid number,
    title nvarchar2(50), --영문자 특수문자 공백 상관없이 50자
    content nvarchar2(2000), --2000자 4000byte
    regdate date
);

drop table board;
desc board;
--Tip)
select * from user_tables where lower(table_name) = 'board';
select * from col where lower(tname) = 'board';
--제약정보 확인하기(반드시)
select * from user_constraints where lower(table_name) = 'board';
select * from user_constraints where lower(table_name) = 'emp';

--oracle 11g >> 실무 >> 가상컬럼(조합컬럼)
--학생 성적 테이블 (국어, 영어, 수학)
--합계, 평균...
--학생 성적 테이블(국어, 영어, 수학, 평균) <- 좋지않은 테이블 - 국영수의 변화에 의해 변하는 값
-- 각각의 점수 변화 >> 평균값도 변화 보장 >> 무결성

create table vtable(
    no1 number,
    no2 number,
    no3 number GENERATED ALWAYS as (no1 +no2) VIRTUAL
);

select * from col where lower(tname) = 'vtable';



insert into vtable(no1,no2) values (100,50);
select * from vtable;

--insert into vtable(no1,no2,no3) values (20,10,30); -- 오류 : VIRTURE로 지정된 컬럼에는 값을 입력받지 않는다

-- 실무에서 활용되는 코드
-- 제품정보 (입고) : 분기별 데이터 추출(4분기)

create table vtable2(
    no number, --순번
    p_code char(4), --제품코드 (a001,b003)
    p_date char(8), --입고일 (20230101)
    p_qty number, --수량
    p_bungi number(1) GENERATED ALWAYS as (
                                            case when substr(p_date,5,2) in ('01','02','03') then 1
                                                 when substr(p_date,5,2) in ('04','05','06') then 2
                                                 when substr(p_date,5,2) in ('07','08','09') then 3
                                                 else 4
                                            end
                                          ) VIRTUAL
);

select * from col where lower(tname) = 'vtable2';

insert into vtable2(p_date) values('20220101');
insert into vtable2(p_date) values('20220501');
insert into vtable2(p_date) values('20220601');
insert into vtable2(p_date) values('20220901');
insert into vtable2(p_date) values('20221101');
commit;


select * from vtable2;

select * from vtable2 where p_bungi = 2;

--------------------------------------------------------------------------------
-- 테이블 만들고 수정 삭제
1. 테이블 생성하기
create table temp6(id number);

desc temp6;

--2. 이미 생성된 테이블에 컬럼 추가하기

alter table temp6
add ename varchar2(20);

desc temp6;


--3. 기존 테이블에 있는 컬럼 이름 잘못 표기 (ename -> username)
-- 기존 테이블에 있는 기존 컬럼 이름 바꾸기(rename)

alter table temp6
rename column ename to username;

desc temp6;

--4. 기존 테이블에 있는 기존 컬럼의 타입의 크기를 수정 modify
alter table temp6
modify (username varchar2(2000));

desc temp6;

--5. 기존 테이블에 기존 컬럼 삭제

alter table temp6
drop column username;

desc temp6;
-- 모든 작업은 TOOL 에서 가능 

--6. 테이블 전체가 필요 없어졌다.
--6.1 delelte 데이터만 삭제
--테이블 처음 만들면 처음 크기설정 >> 데이터 넣으면 >> 데이터 크기만큼 테이블 크기 증가
-- 처음 1MB >> 데이터 100만건(insert) >> 100MB >> delete 100만건 삭제 >> 테이블 크기 100MB

--테이블 (데이터) 삭제(공간의 크기도 줄일 수 없을까)
--truncate (단점 : where 절 사용 못한다)
-- 처음 1MB >> 데이터 100만건(insert) >> 100MB >> truncate  >> 테이블 크기 1MB
--truncate table emp --DBA (관리자)

--테이블 삭제
drop table temp6;

desc temp6;

-------------------------------------------------------------------------------
-- 테이블에 제약 설정하기 page 144

/*
1.2.2 데이터 무결성 제약 조건의 종류 
제 약 조 건 설 명
PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL 과 UNIQUE 조건을 만족)
FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다.
UNIQUE key(UK) 테이블의 모든 행을 유일하게 하는 값을 가진 열(NULL 을 허용)
NOT NULL(NN) 열은 NULL 값을 포함할 수 없습니다.
CHECK(CK) 참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정

제약은 아니지만 default sysdate ...
*/


--PRIMARY KEY(PK) : NOT NULL 과 UNIQUE 조건 (null 데이터와 중복값은 허락하지 않겠다.)
--보장 (유일값)
-- empno primary key >> where empno=7788 >> 데이터 1건 보장
-- PK (주민번호, 회원ID, 상품ID)
-- 성능 (PK 자동으로 index ...) >> 조회 empno >> 성능 >> index >> 자동생성
-- PK는 테이블당 1개만 설정할 수 있다. (1개의 의미는 (묶어서)) >> 복합키


--언제
--1. create table 생성시 제약 생성
--2. create table 생성후에 필요에 따라서 추가 (alter table emp add constraint ..)

--제약확인 
select * from user_constraints where table_name ='EMP';

create table temp7(
    -- id number primary key 권장하지 않는 방법 (제약이름 자동설정 ... 제약 편집 ...)
    id number constraint pk_temp7_id primary key, -- 개발자 제약 이름 : pk_temp7_id
    name varchar(20) not null,
    addr varchar2(50)
);

desc temp7;
select * from user_constraints where lower(table_name)='temp7';


insert into temp7(id,name,addr) values(10,'홍길동','서울시 강남구');
select * from temp7;
commit;

insert into temp7(id,name,addr) values(10,'야무지개','서울시 강남구');


--Unique (UK) 테이블의 모든 행을 유일하게 하는 값을 가진 열(NULL을 허용);
--컬럼수만큼 생성 가능 , NULL 허용
--Unique 제약을 걸고 추가적으로 not null >> 여러개

create table temp8(
    id number constraint pk_temp8_id primary key, -- 개발자 제약 이름 : pk_temp7_id
    name varchar2(20) not null,
    jumin nvarchar2(6) constraint uk_temp8_jumin unique,
    addr varchar2(50)
);

select * from user_constraints where lower(table_name)='temp8';

insert into temp8(id,name,jumin,addr)
values(10,'홍길동','123456','경기도');

select * from temp8;

insert into temp8(id,name,jumin,addr)
values(20,'길동','123456','서울'); -- 유니크 제약 ORA-00001: unique constraint (KOSA.UK_TEMP8_JUMIN) violated

insert into temp8(id,name,addr)
values(30,'홍길동','경기도'); -- unique null 허락

select * from temp8;

insert into temp8(id,name,addr)
values(40,'순신','서울');
--unique 옵션은 null 의 중복은 체크하지 않는다.

--not null 하고싶으면--jumin nvarchar2(6) not null constraint uk_temp8_jumin unique,


-- 테이블 생성 후에 제약 걸기 (추천)
create table temp9(id number);
-- 기존 테이블에 제약 추가하기 (대부분의 툴이 이 방법_)
alter table temp9
add constraint pk_temp9_id primary key(id);

select * from user_constraints where lower(table_name)='temp9';


create table temp9(id number, num number);

--alter table temp9
--add constraint pk_temp9_id primary key(id,num); --복합키
-- 유일한 한개의 row    >> where id = 100 and num =1; (복합키 -기본키)


--컬럼 추가
alter table temp9
add ename varchar2(50);

desc temp9;

--ename column 에 not null을 추가

alter table temp9
modify(ename not null);

--------------------------------------------------------------
--check 제약 (업무 규칙 where 조건을 쓰는 것 처럼)
--where gender in ('남','여') 

create table temp10(
    id number constraint pk_temp10_id primary key,
    name varchar2(20) not null,
    jumin char(6) not null constraint uk_temp10_jumin unique,
    addr varchar2(30),
    age number constraint ck_temp10_age check(age >= 19) -- where age >= 19
);

select * from user_constraints where table_name = 'TEMP10';

insert into temp10(id,name,jumin,addr,age)
values(100,'홍길동','123456','서울시 강남구',20);

select * from temp10;

insert into temp10(id,name,jumin,addr,age)
values(200,'아무개','123666','서울시 강남구',18); -- ORA-02290: check constraint (KOSA.CK_TEMP10_AGE) violated check제약 오류
commit;

----------------------------------------------------------------------------------------------------------
-- FOREIGN KEY(FK) : 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다.
-- 참조제약 (테이블과 테이블과의 관계 설정)

create table c_emp
as
    select empno, ename, deptno from emp where 1=2;
    
select * from c_emp;

create table c_dept
as
    select deptno, dname from dept where 1=2;

select * from c_dept;

desc c_emp;
desc c_dept;
--c_emp 테이블에 있는 deptno 컬럼의 데이터는 c_dept 테이블에 있는 deptno 컬럼에 있는 데이터만 쓰겠다.

-- 강제(FK)

--c_dept 가 기본키를 가지고 있지 않다. (PK, UNIQUE)..
--alter table c_emp
--add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);

alter table c_dept
add constraint pk_c_dept_deptno primary key(deptno);


alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);


select * from user_constraints where table_name = 'C_DEPT';
select * from user_constraints where table_name = 'C_EMP';

-- 부서
insert into c_dept(deptno,dname) values(100,'인사팀');
insert into c_dept(deptno,dname) values(200,'관리팀');
insert into c_dept(deptno,dname) values(300,'회계팀');
commit;

select * from c_dept;

--신입사원 입사
insert into c_emp(empno,ename,deptno)
values (1,'신입이',100);

select * from c_emp;

insert into c_emp(empno,ename,deptno)
values (2,'신입이',101); --FK 제약 위반 : violated - parent key not found 참조하는 table에 값이 없다.

commit;
----------------------------------------------------------------------------------

--제약 END -----------------------------------------------------------------------

insert into c_emp(empno,ename,deptno)
values (1,'신입이',100);

----------------------------------------------------------------------------------
--- 제약 END----------------------
-- 개발자 관점에서 FK 살펴보기
-- master - detail 관계
-- 부모 - 자식 관계

-- c_emp 와 c_dept (관계 FK) >> c_emp(deptno) 컬럼이 c_dept(deptno) 컬럼을 참조

--FK 관계 : master(c_dept) - detail(c_emp) >> 화면 (부서 출력) >> 부서번호 클릭 >> 사원정보 출력
--deptno 참조 관계 부모(c_dept) - 자식 (c_emp)

--관계 PK가지고 있는 쪽 (master), FK (detail)


select * from c_dept;

select * from c_emp;

-- 1. 위 상화에서 c_emp 테이블에 있는  신입이를 삭제할 수 있을까요?
delete from c_dept where deptno =100; -- 참조되고 있는 값은 삭제 할 수 없다.
delete from c_emp where empno=100;

delete from c_dept where deptno =200; 

-- 부모를 삭제하고 싶을 때 참조 관계부터 삭제하고 부모를 삭제하면 된다.

/*

column datatype [CONSTRAINT constraint_name]
 REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE])
 
ON DELETE CASCADE 부모 테이블과 생명을 같이 하겠다.

alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno) ON DELETE CASCADE;

delete from c_emp where empno =1 >> deptno >> 100번

delete from c_dept where deptno =100; -- 참조되고 있기 때문에 불가
ON DELETE CASCADE 걸면 삭제된다.

부모삭제 >> 참조하고 있는 자식데이터도 같이 삭제된다.

MS-SQL
ON DELETE CASCADE
ON UPDATE CASCADE (oracle에는 없다)
-- 부모에 변경이 발생하면 참조하고 있는 자식에도 변경사항이 발생한다.


--영문 테이블 ,영문 컬럼명
-- 학생 성적 테이블
-- 학번은 기본키
-- 이름 not null
--국
--영
--수 Null 가능 숫자타입


*/

column datatype [CONSTRAINT constraint_name]
 REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE])
 
 
create table grade(
    stdnum number constraint pk_grade_stdnum primary key,
    name nvarchar2(20) not null,
    korean number default 0,
    english number default 0,
    math number default 0,
    sumnum number GENERATED ALWAYS as ( korean+english+math ) VIRTUAL,
    avgnum number GENERATED ALWAYS as ( (korean+english+math)/3 ) VIRTUAL,
    dcode number --constraint fk_grade_dcode foreign key(dcode) references s_dept(deptno)
);  

alter table grade
add constraint fk_grade_dcode foreign key(dcode) references s_dept(deptno);


create table s_dept(
    deptno number constraint pk_s_dept_deptid primary key,
    dname nvarchar2(50) not null
);
insert into s_dept(deptno, dname) values ( 100,'컴공');
insert into s_dept(deptno, dname) values ( 200,'영어');
insert into s_dept(deptno, dname) values ( 300,'국어');

insert into grade(stdnum, name ,korean,english, math,dcode) values (1,'홍길동',90,80,70,200);
insert into grade(stdnum, name ,korean,english, math,dcode) values (2,'남동우',60,60,70,100);
insert into grade(stdnum, name ,korean,english, math,dcode) values (3,'동동동',90,90,30,300);


select g.stdnum, g.name, g.sumnum, g.avgnum, g.dcode, s.dname
from grade g join s_dept s
on g.dcode = s.deptno;

 --부서 테이블 생성
create table s_dept(
    deptno number constraint pk_s_dept_deptid primary key,
    dname nvarchar2(50) not null
);
 -- 점수 테이블 생성
create table grade(
    stdnum number constraint pk_grade_stdnum primary key,
    name nvarchar2(20) not null,
    korean number default 0,
    english number default 0,
    math number default 0,
    sumnum number GENERATED ALWAYS as ( korean+english+math ) VIRTUAL,
    avgnum number GENERATED ALWAYS as ( (korean+english+math)/3 ) VIRTUAL,
    dcode number --constraint fk_grade_dcode foreign key(dcode) references s_dept(deptno)
);  

-- 방법2
create table grade(
  s_number number ,
  s_name varchar2(20) not null,
  k_score number default 0,
  e_score number default 0,
  m_score number default 0,
  m_code number ,
  avg_score number GENERATED always as (round((k_score + e_score + m_score)/3,2)) VIRTUAL,
  sum_score number GENERATED always as (k_score + e_score + m_score) VIRTUAL,
  
  constraint pk_grade_snum primary key(s_number), --복합키
  constraint fk_grade_mcode foreign key(m_code) references major(m_code) 
  --나중에 걸거나 (테이블 생성 후에)
);
 

--FK 설정
alter table grade
add constraint fk_grade_dcode foreign key(dcode) references s_dept(deptno);

alter table grade
modify (avgnum number GENERATED ALWAYS as ( trunc(((korean+english+math)/3),0) ) VIRTUAL);


-- 부서테이블 정보입력
insert into s_dept(deptno, dname) values ( 100,'수학부');
insert into s_dept(deptno, dname) values ( 200,'영어');
insert into s_dept(deptno, dname) values ( 300,'국어');

-- 점수 테이블 정보입력
insert into grade(stdnum, name ,korean,english, math,dcode) values (1,'홍길동',90,80,70,200);
insert into grade(stdnum, name ,korean,english, math,dcode) values (2,'남동우',60,60,70,100);
insert into grade(stdnum, name ,korean,english, math,dcode) values (3,'동동동',90,90,30,300);


--출력
select g.stdnum as 학번 , g.name as 이름, g.sumnum as 총점, g.avgnum as 평균, g.dcode as 학과코드, s.dname as 학과명
from grade g join s_dept s
on g.dcode = s.deptno;


--------------------------------------------------------------------------------------------
-- 초급과정의 끝------------------------------------------------------------------------------

-- 12장 VIEW (초중급)

-- 가상 테이블 (subquery >> in line view >> from ())
-- 필요한 가상테이블 객체형태로 만들기

/*
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
AS Subquery 
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY]

OR REPLACE 이미 존재한다면 다시 생성한다.
FORCE Base Table 유무에 관계없이 VIEW 을 만든다.
NOFORCE 기본 테이블이 존재할 경우에만 VIEW 를 생성한다.
view_name VIEW 의 이름
Alias Subquery 를 통해 선택된 값에 대한 Column 명이 된다.
Subquery SELECT 문장을 기술한다.
WITH CHECK OPTION VIEW 에 의해 액세스 될 수 있는 행만이 입력,갱신될 수 있다. 
Constraint CHECK OPTON 제약 조건에 대해 지정된 이름이다.
WITH READ ONLY 이 VIEW 에서 DML 이 수행될 수 없게 한다.

*/

create view view001
as
 select * from emp; --view를 만드는 권한이 없어서 오류 발생
 

--GRANT CREATE ANY VIEW TO "KOSA" WITH ADMIN OPTION;

--VIEW001 이라는 객체가 생성되었다.
--(가상테이블 >>쿼리 문장을 가지고 있는 객체)**
--이 객체는 테이블처럼 사용할 수 있는 객체

select *from view001;

select * from view001 where deptno=20;

--VIEW (가상 테이블)
--사용법 : 일반 테이블과 동일 (select, insert, update, delete) 할 수 있다.
-- 단, VIEW 가 볼 수 있는 데이터에 대해서만
-- VIEW를 통해서 원본 테이블에 insert, update, delete(DML) 가능은 하지만 사용하지 않음.

--VIEW 목적
--1. 개발자의 편리성 : join, subquery 복잡한 쿼리 미리 생성해두었다가 사용
--2. 쿼리를 단순화 : view생성해서 JOIN 편리성
--3. DBA 보안 : 원본테이블은 노출하지 않고, view 만들어서 제공(특정 컬럼을 노출하지 않는다.)

create or replace view v_001
as 
    select empno , ename from emp;

select * from v_001;


create or replace view v_emp
as
    select empno, ename, job ,hiredate from emp;
    
select * from v_emp;

select * from v_emp where job ='CLERK';

--편리성
create or replace view v_002
as
    select e.empno, e.ename, e.deptno, d.dname
    from emp e join dept d
    on e.deptno = d.deptno;

select *from v_002;


-- subquery를 view로 만들어서 쿼리문을 간단하게 만들 수 있다.
-- 객체를 drop 하지 않은한 영속적.............

/*

view 나름 테이블(가상) / view(통해서) view가 (볼수있는) 데이터에 대해서
DML ( insert, update, delete) 가능.. (권장x)


create or replace view v_emp
as
 select empno, ename, job, hiredate from emp;
*/

select* from v_emp;

update v_emp
set sal = 0; <- view 가 볼수 없는 데이터

update v_emp
set job='IT';

-- 실제로는 원본 emp 테이블에 데이터 업데이트
select * from emp;
select * from v_emp;

rollback;

--30번 부서 사원들의 정보



create or replace view v_0004
as
 select e.job as 직종, e.ename as 사원이름, e.sal as ALIAS
from emp e
where deptno =30 and sal > 300;

select * from v_0004;



-- 부서별 평균월급을 담는 view를 만들되, 평균월급이 2000 이상인
-- 부서만
create or replace view vvvvv
as
    select deptno as 부서번호, avg(sal) as avgasl
    from emp
    group by deptno
    having avg(sal)>= 2000;

select * from vvvvv;

select * from employees;

select * from departments;


select * from locations;

--------------------------------------------------------------------------
--문제만들기
select count(*),department_id
from employees
group by department_id;

select *
from employees
where department_id is null;

select department_id, trunc(avg(salary),0)
from employees
--where department_id is not null
group by department_id;


select department_id, trunc(avg(salary),0)
from employees e join departments d on e.emp 

group by department_id;

CREATE OR REPLACE VIEW vv1
as
select l.COUNTRY_ID AS cid , trunc(avg(salary),0) AS avgsalofc
	  from departments d join employees e on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    			   JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID  
	  GROUP BY l.COUNTRY_ID;

select l.COUNTRY_ID AS cid , trunc(avg(salary),0) AS avgsalofc
	  from departments d join employees e on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    			   JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID  
	  GROUP BY l.COUNTRY_ID;


SELECT * FROM vv1;  
      
SELECT d2.DEPARTMENT_ID 
FROM DEPARTMENTS d2 JOIN (select l.COUNTRY_ID AS cid , trunc(avg(salary),0) AS avgsalofc
	  				from departments d join employees e on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    			    JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID  
	  				GROUP BY l.COUNTRY_ID) c2
	  				ON d2.LOCATION_ID = c2.cid
WHERE avgsalofc = (SELECT max(avgsalofc) FROM vv1);


SELECT l.COUNTRY_ID as 나라이름 , d.DEPARTMENT_ID as 부서명 ,(SELECT e.FIRST_NAME  FROM EMPLOYEES e JOIN DEPARTMENTS d2 ON e.DEPARTMENT_ID = d2.DEPARTMENT_ID WHERE d.DEPARTMENT_ID=e.DEPARTMENT_ID)as 이름
FROM LOCATIONS l JOIN DEPARTMENTS d  ON d.LOCATION_ID  = l.LOCATION_ID
				 JOIN (select l.COUNTRY_ID AS cid , trunc(avg(salary),0) AS avgsalofc
	  				from departments d join employees e on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    			    JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID  
	  				GROUP BY l.COUNTRY_ID) c2
	  				ON l.country_id = c2.cid
WHERE avgsalofc = (SELECT max(avgsalofc) FROM vv1);

---------- 중간----------
select * from employees;

select * from departments;

select * from locations;


select *
from employees
where department_id is null;

select department_id, trunc(avg(salary),0)
from employees
--where department_id is not null
group by department_id;

SELECT l.COUNTRY_ID , d.DEPARTMENT_ID ,e2.FIRST_NAME --(SELECT e.FIRST_NAME  FROM EMPLOYEES e JOIN DEPARTMENTS d2 ON e.DEPARTMENT_ID = d2.DEPARTMENT_ID WHERE d.DEPARTMENT_ID=e.DEPARTMENT_ID)
FROM LOCATIONS l JOIN DEPARTMENTS d  ON d.LOCATION_ID  = l.LOCATION_ID
				 JOIN (select l.COUNTRY_ID AS cid , trunc(avg(salary),0) AS avgsalofc
	  				from departments d join employees e on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    			    JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID  
	  				GROUP BY l.COUNTRY_ID) c2
	  				ON l.country_id = c2.cid
					JOIN EMPLOYEES e2 ON d.DEPARTMENT_ID = e2.DEPARTMENT_ID 
WHERE avgsalofc = (SELECT max(avgsalofc) FROM vv1);


SELECT  e2.EMPLOYEE_ID ,e2.FIRST_NAME,e2.SALARY , l.COUNTRY_ID , d.DEPARTMENT_ID ,d.DEPARTMENT_NAME   
FROM 	LOCATIONS l JOIN DEPARTMENTS d  ON d.LOCATION_ID  = l.LOCATION_ID
				 JOIN (select l.COUNTRY_ID AS cid , trunc(avg(salary),0) AS avgsalofc
	  				from departments d join employees e on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    			    JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID  
	  				GROUP BY l.COUNTRY_ID) c2
	  				ON l.country_id = c2.cid
	  				JOIN EMPLOYEES e2 ON d.DEPARTMENT_ID = e2.DEPARTMENT_ID 
WHERE avgsalofc = (SELECT min(avgsalofc) FROM vv1);



SELECT avg(salary)
FROM EMPLOYEES e ;








CREATE OR REPLACE VIEW vv1
AS;
select l.COUNTRY_ID AS cid , trunc(avg(salary),0) AS avgsalofc
	  from departments d join employees e on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    			         JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID  
	  GROUP BY l.COUNTRY_ID;

select l.COUNTRY_ID AS cid , trunc(avg(salary),0) AS avgsalofc
	from departments d join employees e on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    			         JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID  
	 GROUP BY l.COUNTRY_ID;
	  
SELECT * FROM vv1;

SELECT max(avgsalofc)
FROM vv1;
--------------------------문제 만들기 끝----------------------------------------



SELECT * FROM test1;


CREATE TABLE test1 (
	pw nvarchar2(32)
);

INSERT INTO test1(pw) VALUES ('GGGGBBBB');
INSERT INTO test1(pw) VALUES ('AAAAAAAAAAAA1234');
INSERT INTO test1(pw) VALUES ('MAGIC!MAGIC2');
INSERT INTO test1(pw) VALUES ('MAGIC!MAGIC2ab');
INSERT INTO test1(pw) VALUES ('MAGIC!MAGIC2b');
INSERT INTO test1(pw) VALUES ('@@@@@@@@@@@@@@@@');
INSERT INTO test1(pw) VALUES ('XXXXVVVV12!!');
INSERT INTO test1(pw) VALUES ('abcdABCD1234!');
INSERT INTO test1(pw) VALUES ('abA1!!');
INSERT INTO test1(pw) VALUES ('aA1sdfs1!!');
INSERT INTO test1(pw) VALUES ('abascA!!');
INSERT INTO test1(pw) VALUES ('abascABB!!');
INSERT INTO test1(pw) VALUES ('1abABVF1234!');



----------------------------------------------------------------------------------
----------------------------------
--
/*
1.1 SEQUENCE 특징 
1) 자동적으로 유일 번호를 생성합니다.
2) 공유 가능한 객체 (테이블간에)
3) 주로 기본 키 값을 생성하기 위해 사용됩니다.
4) 어플리케이션 코드를 대체합니다. (로직을 만들 필요가 없다)
5) 메모리에 CACHE 되면 SEQUENCE 값을 액세스 하는 효율성을 향상시킵니다.

CREATE SEQUENCE sequence_name
[INCREMENT BY n]
[START WITH n]
[{MAXVALUE n | NOMAXVALUE}]
[{MINVALUE n | NOMINVALUE}]
[{CYCLE | NOCYCLE}]
[{CACHE | NOCACHE}];

sequence_name SEQUENCE 의 이름입니다.

INCREMENT BY n 정수 값인 n 으로 SEQUENCE 번호 사이의 간격을 지정.
이 절이 생략되면 SEQUENCE 는 1 씩 증가.
START WITH n 생성하기 위해 첫번째 SEQUENCE 를 지정.
이 절이 생략되면 SEQUENCE 는 1 로 시작.
MAXVALUE n SEQUENCE 를 생성할 수 있는 최대 값을 지정.
NOMAXVALUE 오름차순용 10^27 최대값과 내림차순용-1 의 최소값을 지정.
MINVALUE n 최소 SEQUENCE 값을 지정.
NOMINVALUE 오름차순용 1 과 내림차순용-(10^26)의 최소값을 지정.
CYCLE | NOCYCLE 최대 또는 최소값에 도달한 후에 계속 값을 생성할 지의 여부를
지정. NOCYCLE 이 디폴트.
CACHE | NOCACHE 얼마나 많은 값이 메모리에 오라클 서버가 미리 할당하고 유지
하는가를 지정. 디폴트로 오라클 서버는 20 을 CACHE
*/


desc board;

drop table board;

create table board(
    boardid number constraint pk_board_boardid primary key,
    title nvarchar2(50)
);

select * from user_constraints where table_name='BOARD';

--not null, unique, index(검색속도)

insert into board(boardid, title) values(1,'처음글');
insert into board(boardid, title) values(2,'두번째');

rollback;
select * from board;

-- 처음 글을 쓰면 글번호가 1번 .. 그 다움글 순차적인 증가값 2번,3번 ,....
select count(boardid) +1 from board;

insert into board(boardid, title) values ((select count(boardid) +1 from board) , '내용');

insert into board(boardid, title) values ((select count(boardid) +1 from board) , '내용2');
insert into board(boardid, title) values ((select count(boardid) +1 from board) , '내용3');

select * from board;

--게시글 삭제, 수정의 경우

--게시글 삭제
commit;

delete from board where boardid=1;

select * from board;

commit;

insert into board(boardid, title) values ((select count(boardid) +1 from board) , '새글'); -- 중복값이 발생

--데이터가 삭제되어도 문제없는 순번

insert into board(boardid, title) 
values ((select nvl(max(boardid),0) +1 from board) , '새글');

select * from board;

--시퀀스 생성하기 (순번 만들기) : 객체(create ....) : 순차적인 번호를 생성하는  객체
create sequence board_num;
--순번
select board_num.nextval from dual; --채번(번호표 뽑기)

select board_num.currval from dual;

--공유(객체) >> 하나의 테이블이 아니라 여러개의 테이블에서 사용

--A테이블,                         B테이블 
--(insert >>1)                    insert>>2, insert >>3
--(insert >>4)

create table kboard(
    num number constraint pk_kboard_num primary key,
    title nvarchar2(20)
);

create sequence kboard_num;

insert into kboard(num, title) values (kboard_num.nextval,'처음');
insert into kboard(num, title) values (kboard_num.nextval,'두번쨰');
insert into kboard(num, title) values (kboard_num.nextval,'세번째');

select * from kboard;

--------------------------------------------------------------------------------
/*
-- 게시판
-- 공지사항, 자유게시판, 답변형게시판 ....

공지사항 1,2,3 (시퀀스객체1)

자유게시판 1,2,3 (시퀀스객체2)

답변형게시판 1,2,3 (시퀀스객체3) --최소 3개
--------------------------------------------
공지사항 1, 6

자유게시판 2, 3

답변형 게시판 4, 5

시퀀스 객체 1개 - 3개의 테이블에서 사용 (공유객체)

TIP)
sequence 모든 DB에 ... 전부 있을까? (mysql, oracle , mariadb , mssql 등등)
오라클 (o)
ms-SQL (2012버전 (sequence))
my-sql (x)
maria db (o) --엔진(mysql)
postgreSQL (o)

--순번을 생성(테이블 종속으로)
Ms-sql
create table board(
    boardnum int identity(1,1)....
    title....
)
insert into board(title) values('제목'); >> boardnum >> 1이 자동

my-sql
create table board (boardnum int auto_increment, .... tile);

insert into board(title) values('제목'); >> boardnum >> 1이 자동

*/

-- 옵션
create sequence seq_num
start with 10 
increment by 2;

select seq_num.nextval from dual;

select seq_num.currval from dual;


--순번 
---게시판 에서 처음 , 데이터를 가져올 때
-- 쿼리문
--num > 1, 2, 3 ,,,,,, 10 ,,,,, 10000
--가장 나중에 쓴 글 (최신글)
--select * from board order by num desc;

--rownum : 의사컬럼 : 실제 물리적으로 존재하는 컬럼이 아니고 논리적 존재 (
-- create 할 때는 사용하지 않지만 select 할 때는 사용할 수 있는 column
-- 실제로 테이블에 존재하지 않지만 내부적으로 행 번호를 부여하는 컬럼

select * from emp;

select rownum , empno , ename, sal from emp;


select  empno , ename , sal
from emp
order by sal; 
-- select가 order by 보다 먼저 실행되기 때문에 rownum의 번호가 아름답게 나오지 않는다.

--급여를 많이 받는 순으로 정렬된 데이터 + rownum >> 순번을 가짐
select rownum, e.empno, e.ename, e.sal
from (
        select  empno , ename , sal
        from emp
        order by sal desc --정렬의 기준 
      ) e;

--급여를 많이 받는 사원 5명

select *
from  (
        select rownum as num, e.*
        from (
            select  empno , ename , sal
            from emp
            order by sal desc --정렬의 기준 
        ) e
       ) n 
where num <= 5;
--대용량 데이터에서 페이징 원리 (TODAY POINT)


--between A and B -- 페이징 처리 가능
----------------------------------------



--rownum을 사용한 순서 원하는 select의 결과를 얻은후에 select에 붙임

--TOP-n 쿼리 (기준이 되는 데이터 순으로 정렬 시키고 상위 n개를 가지고 오기)
--MS-SQL : select top 10 , * from emp order by sal desc;

--Oracle 에는 Top-n이 없다  / 대신 rownum 이있다.
--rownum (순번부여 .... 상위 n)
-- 1. 정렬의 기준 설정하기 (선행)
-- 2. 정렬된 기준에 rownum 붙이고 ... 데이터 추출

      
-------------------------------------------------------------------------------------
-- 기업 (10만건 ~ 1억건)
-- 게시판 (게시글 10만건)
--select * from board >> 10만건 조회 ..... >> 10건만 조회
-- 10만건을 나누어서 확인 (10,20..등)

/*
totaldata = 100건
pagesize =10 > 한 화면에 보여지는 데이터 row 수 : 10건

page 개수 >> 10개 
[1][2][3][4][5][6][7][8][9][10] 

1page 클릭 >> 1~10번 까지 글 : DB 쿼리 : select num between 1 and 10
<a href='page.jsp?page=1'></a>

2page 클릭 >> 1~10번 까지 글 : DB 쿼리 : select num between 11 and 20

방법 
1. rownum
2. between


HR계정 이동

*/

show user;
select * from employees; --107rjs

-- 사원번호가 낮은 순으로 정렬하고 기준을 통해서 .... 41부터 50번쨰

select  *
from employees
order by employe