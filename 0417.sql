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
where enames like '%A%';

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

select initcap('the usper man') from dual; --단어의 첫글자를 대문자로

select lower('AAA'), upper('aaa') from dual;

select ename , lower(ename)as ename from emp;
select ename , lower(ename)as ename from emp;

select * from emp where lower(ename) = 'king';

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