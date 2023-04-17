/*
1���� ����

1. ����Ʈ���� �ٿ�ε�
https://www.oracle.com/database/technologies/xe-prior-release-downloads.html

2. Oracle ��ġ ( SYS, SYSTEM ������ ���� ��ȣ ���� : 1004)

3. sqlplus ���α׷� ���� (CMD) : ���� GUI ȯ���� �������� �ʴ´�.

4. ������ ���α׷� ���� : Tool
4.1 SqlDeveloper ����, dbeaver ����
4.2 ���, ������, SqlGate ...

5. SqlDeveloper ���� >> Oracle ���� ���� >> GUI
5.1 HR ���� ��� (unlocak)

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

5.2 KOSA ���� ����

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
[1���� ����]
1. ����Ŭ ����Ʈ���� �ٿ�ε�
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (���ἳġ)

3. Oracle ��ġ(SYS, SYSTEM ������ ���� ��ȣ : 1004)

4.Sqlplus ���α׷� ����(CMD) : GUI ȯ�� �Ϲݰ����� ��� ����

5.������ Tool ��ġ ����(SqlDeveloper , https://dbeaver.io/)  ,
                 ����(��� , ������ , SqlGate) ������Ʈ�� ��ġ Ȱ�� ^^

6. SqlDeveloper ���� ���ؼ� Oracle Server ���� ....
   >> HR ���� : ��ȣ 1004 , Unlock 2���� ��밡�� .... (������� �ǽ� ���̺�)
   >> ���ο� ���� : BITUSER

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


7. ���� ���� ���� Ȯ�� : show user;   >> USER��(��) "BITUSER"�Դϴ�.


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
�ǽ��ڵ�

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
--1. ��� ���̺��� ��� �����͸� ����ϼ���.

select * from emp;
SELECT * FROM EMP; //��ҹ��ڸ� �������� �ʰ� ��Ģ�� ���ؼ� ����Ѵ�


/* 2. Ư�� �÷� ������ ����ϱ� */

select empno, ename, sal 
from emp;

select ename from emp;

--3. ����Ī ����ϱ� (��Ī : alias)
select empno ���, ename �̸�
from emp;

select empno ��   ��, ename ��   ��
from emp; --�����߻�

select empno "��   ��", ename "��   ��"
from emp;

-- ���� ����(ANSI)>> ǥ�� >> � ������ �ۼ��ϸ� (Oracle, Ms-spl, Mysql) ��� ����
select empno "��   ��", ename "��   ��"
from emp;

-- Oracle ���ڿ� ������ �����ϰ� �������� 

/*
JAVA : ���� >' A' , ���ڿ�> "AAAA"
ORACLE : ���ڿ� >'A', ,"AAAA", 'AVEWEWED' 
ORACLE : �����ͷ� 'a', 'A' �ٸ� ���ڿ�
*/
select*
from emp
where ename= "king";

select*
from emp
where ename= "KING"; - ��ҹ��ڸ� �����ϰ� ����

/*
select �� 3
from ��   1
where��   2

-- Oracle Query (���Ǿ�) : ���

������  
JAVA  + ����(�������), + ���ڿ�(���տ���)

---------------------------------------
Oracle
���� ������ ||
��� ������ + <-���
����

MS-SQL + (���, ����)




DB�о�
������ (CRUD)(insert, select, update, delete) >> DML + DDL(create , alter, drop)

������ (DBA) ������ ���, ���� , ��Ʈ��ũ ����, �ڿ�����, �ϵ���� ����

Ʃ�� : SQL Ʃ��(����) >> �ӵ� >> index >> �ڷᱸ��
        �ϵ����(��Ʈ��ũ) Ʃ��

�𵨷� : ���� (PM) - ERD �䱸���� �м� ERD

�м��� (������ �м�) ����� �̻� ... �� read ........


*/
show user;

select * from emp;
select * from dept;
select * from salgrade;
--------------------------------------------------------------------------------
--1. ������̺��� ��� �����͸� ����ϼ���
select * from emp;
SELECT * FROM EMP;
SELECT * FROM emp;

--2. Ư�� �÷� ������ ����ϱ�
select empno , ename , sal 
from emp;

select ename from emp;

--3. ����Ī ����ϱ� (��Ī: alias)
select empno ��� , ename �̸�
from emp;

select empno "��  ��" , ename "��   ��"
from emp;

--���� ����(ANSI) >> ǥ�� >> ������ �ۼ��ϸ� (Oracle , Ms-sql , Mysql) ��� ����
select empno as "�� ��" , ename as "�� ��"
from emp;

--Oracle ���ڿ� ������ �����ϰ� ��ҹ��� ����
/*
JAVA : ����> 'A' , ���ڿ�> "AAAA"
ORACLE : ���ڿ� 'A'   ,  'AAAA'  , 'AVBWEDWED'
ORACLE : �����ͷ� 'a' 'A' �ٸ����ڿ�
*/
select * 
from emp
where ename='king'; --��ҹ���

select * 
from emp
where ename='KING'; --��ҹ���


/*
select ��     3
from ��       1
where ��      2
*/

--Oracle Query (���Ǿ�) : ���
/*
������
JAVA : + ����(�������) , + ���ڿ�(���տ���)
----------------------------------------
ORACLE :
���� ������  ||
��� ������  + (�������)

MS-SQL : + (���, ����)
*/

select '����� �̸���' || ename || ' �Դϴ�' as �������
from emp;

--���̺��� �⺻ ���� ( �÷� , Ÿ��)
desc emp;
--ENAME             VARCHAR2(10)   ���ڿ� Ÿ��  ���հ��� ...����

/*
JAVA : class Emp {private int emnpno , private String ename}
ORACLE : create Table Emp( empno number , ename varchar2(20));
*/

--����ȯ(�ڵ�) >> ���ڸ� ���ڿ��� ��ȯ 
select empno || ename from emp;

select empno + ename from emp; --01722. 00000 -  "invalid number"

--����� ... �츮 ȸ�翡 ������ ��� �ֳ�
select job from emp;

--�ߺ� �� ���� Ű���� : distinct

select distinct job from emp;
--grouping

--distinct 
--��̷� >> grouping
select distinct job , deptno
from emp
order by job;

--Oracle SQL ���
--JAVA     : ( + , - , * /)  ������ %
--ORACLE   : ( + , - , * /)  ������ % �� �ٸ� ���� ��� ...  �Լ� mod()
--���ڿ� ���� �˻� : ename like '%��%'

--������̺��� ����� �޿��� 100�޶� �λ��� ����� ����ϼ���
select empno, ename , sal , sal + 100 as �λ�޿� from emp;

--dual �ӽ� ���̺�
select 100 + 100 from dual;
select 100 || 100 from dual; -- 100100
select '100' + 100 from dual; --200 --'100' ������ ���� ex)'123456'
select 'A100' + 100 from dual; --Error

--�񱳿�����
-- <  >   <=  
--����
--JAVA : ���� (==)  �Ҵ�(=) , JavaScript : (== , ===)
--ORACLE : ���� =    �����ʴ� !=

--�������� (AND , OR , NOT)

select empno , ename ,sal
from emp
where sal >= 2000;

--����� 7788���� ����� ��� , �̸� , ���� , �Ի����� ����ϼ���
select empno, ename , job , hiredate
from emp
where empno=7788;

--����� �̸��� king ����� ��� , �̸� , �޿� ������ ����ϼ���
select empno , ename, sal
from emp
where ename ='KING';

/*    AND  , OR
 0 0   0     0
 1 0   0     1
 0 1   0     1
 1 1   1     1

*/
--�ʰ� , �̸�
--�̻� , ���� (=)

--�޿��� 2000�޷� �̻��̸鼭 ������ manager �� ����� ��� ������ ����ϼ���
select *
from emp
where sal >= 2000 and job='MANAGER';


--�޿��� 2000�޷� �̻��̰ų� (�Ǵ�) ������ manager �� ����� ��� ������ ����ϼ���
select *
from emp
where sal >= 2000 or job='MANAGER';

--�޿��� 2000�޷� �ʰ��̸鼭 ������ manager �� ����� ��� ������ ����ϼ���
select *
from emp
where sal > 2000 and job='MANAGER';

--����Ŭ ��¥ (DB ������ ��¥)
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
--���� >> ȯ�漳�� >> �����ͺ��̽� Ȯ�� >> NLS >> ��¥���� �����ϼŵ� �˴ϴ�

select * from emp;

--��¥ ������ �˻� >> ���ڿ� �˻� ó�� >>  '��¥'
select * from emp
where hiredate ='1980-12-17';

select * from emp
where hiredate ='1980/12/17';

select * from emp
where hiredate ='1980.12.17';

select * from emp
where hiredate ='80-12-17'; --���� ��¥ (yyyy-MM-dd)

select '����� �̸���' || ename || ' �Դϴ�' as �������
from emp;

���̺��� �⺻ ���� *(�÷�, Ÿ��)*
desc emp;
}
 -- ENAME             VARCHAR2(10)  ���ڿ� Ÿ�� ���հ��� ...
 
 
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

-- Oracle SQL ��� : +, - , * /  %�� �ٸ� ���� ��� / ������ ���ϴ� �Լ� mod()
-- JAVA I : +, - , * / ������ %
-- ���ڿ� ���� �˻� : ename like "%��%"








select * from emp;

-- ����� �޿��� 2000 �̻��̰� 4000 ������ ��� ����� ������ ����ϼ���
select * from emp
where SAL>=2000 and SAL<=4000;  --�ߺ�����

--between A and B ������

select *
from emp
where sal between 2000 and 4000; --between A and B �� �̻� ���ϸ� ������ �� �ִ�.

--����� �޿��� 2000�ʰ� 4000�̸� �� ��� ����� ������ ����ϼ���
--����� SAL�� 2�� ����ϴ� �� �ۿ� ����.
select * from emp
where SAL>2000 and SAL<4000;

--�μ���ȣ�� 10�� �Ǵ� 20�� �Ǵ� 30�� �� ����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���
select EMPNO, ENAME,SAL,DEPTNO FROM EMP 
WHERE DEPTNO=10 OR DEPTNO=20 OR DEPTNO=30;

--�Ȱ��� �÷��� �ι�����ϴ°��� �ſ� �����ϴ�.
--�ſ��߿� 
--IN ������ (���� �����ڶ�� ��)
select *
from emp
where deptno in (10,20,30); --where DEPTNO=10 or DEPTNO=20 or DEPTNO=30;

-- �μ���ȣ�� 10�� �Ǵ� 20���� �ƴ� ����� ������ ���
select * from emp
where deptno not in (10,20); --  dept != 10 and detpno != 20;

--TODAY POINT 
-- IN�� ���� (NOT IN) -> ������ AND


-- ��TODAY POINT��
-- null �� ���� �̾߱�
-- ���� ���� 
-- �ʿ�� 

create table member (
    userid varchar2 (20) not null , --null�� ������� �ʰڴ� (�ʼ��Է�)
    name varchar(20) not null, -- �ʼ��Է����� �Է��� �����ϰڴ�.
    hobby varchar2(50) --default null ��� (�����Է�)
);
desc member;
insert into member (userid, hobby) values ('kim','��');
-- cannot insert Null into 

insert into member(userid, name) values ('hong','ȫ�浿');
commit;
select * from member;


/*
DB���� ����
Oracle
insert, update, delete ���
�⺻������ ������ ����� begin tran ������ �ڵ� ~~~ �����ڴ� end (�Ϸ�, ���)
����Ŭ�� ������ ..... ������ ��� (commit - �����ݿ�, rollback ���) �۾��Ϸ�

MS-sql
�ڵ� auto-commit
delete from emp; �ڵ� commit;

begin tran
    delete from emp;
    
    commit or rollback ���� ������ ������ ó�� �Ұ���

*/

delete from emp;
select * from emp;
commit;

-- ��Ģ������ commit �� �����ʹ� �츱 �� ����. ������ ����� �ִٸ� �� ���������� ����� �� �� �ִ�.

-- DB Transaction : ������ �۾� ���� (���� ,����)
OLTP (�� ȯ�� : �ǽð����� ������ ó��)
������� ��ü

    update -- ���� -1000
    updtate -- ���� ���� 1000
    ��

-- OLAP (������ �м� : �����Ⱓ �����͸� ��Ƽ� �м�)
-- ����Ŭ���� insert, update,delete �ϸ� �ݵ��
-- commit, rollback ó������ ����

-- ����(comm)�� ���� ���� ��� ����� ������ �Է��ϼ�
-- �ǽ� ������ 0 �� �ִµ� ������ �޴� ������ ������

--comm �÷��� �����Ͱ� null �ΰ͸�
selecet *
from emp
where comm = null; --����x

select *
from emp
where comm is null;
--�ϱ� null �� �񱳴� is null & in not null

--comm�� �޴� ����� comm �÷��� �����Ͱ� null �� �ƴѰ�
select *
from emp
where comm is not null;

-- ������̺��� ���, �̸�, �޿�, ����, �ѱ޿�, (�޿�+����) �� ����ϼ���

select empno, ename, sal ,comm, sal+comm as �ѱ޿�
from emp;
/*
null �̶� �༮
1. null ���� ��� ���� ����� null ex) null+100 >> null
2. null .. �Լ� >> nv1(), nv2() �ϱ�

ex) nv1(�÷���,��ü��) >> ġȯ

Tip)
Mysql > null > IFNULL() > select if(null,'');
MS-SQL > null > Convert()
*/

select empno, ename, sal ,comm, sal+comm(comm,0) as �ѱ޿�
from emp;

select * from emp;
select 1000 + null from dual; --null
select 1000 +nv1(null,0) from dual;
select comm , nv1(comm,111111) from emp;
select nvl(null,'hello world') from dual;

--����� �޿��� 1000�̻��̰� ������ ���� �ʴ� ����� ���, �̸� ,����, �޿�
select * from emp
where SAL >1000 and comm is null;

--���ڿ� �˻�
--�ּҰ˻� >> ���� >> ���� �ܾ �ִ� ��� �ּҰ� ������ ��
-- LIKE ���ڿ� ����
-- ���ϵ�ī�� ( %(����), _(�ѹ���))

select *
from emp
where enames like '%A%';

select *
from emp
where ename like 'A%'; -- A�� �����ϴ� ��� �ܾ� ã��

where ename like '%E"; --E�� ������ �ܾ�


select *
from emp
where ename like '%A%A%'; -- A�� 2�� ����ִ� �ܾ�  ex)AdAmas

select *
from emp
where ename like '%A%A%'; -- A�� 2�� ����ִ� �ܾ�  ex)AdAmas

select *
from emp
where ename like '_A%'; - -- �ι�° ���ڰ� A�̰�

--����ǥ���� regewx_like()
select * from emp where regexp_like (ename,'[A-C]');

--���� ����ǥ���� 5�� ����� / ���Ŀ� ī��

--������ �����ϱ�

--order by �÷��� : ����, ����, ��¥ ���İ���
--�������� : asc : ������ :default;
--�������� : desc: ������
--����(�˰���) >> ����� ���� ��� �۾�(cost)

select * 
from emp
order by sal; --default order by sal asc

select *
from emp
order by sal desc;

--�Ի����� ���� ���� ������ �����ؼ� ���, �̸�, �޿�, �Ի��� ����ϼ���

select EMPNO, ENAME, SAL, HIREDATE
from emp
order by HIREDATE desc;

/*
select ��      3
from ��        1
where ��       2
order by ��    4 (select ����� ����)
*/

select empno, ename, sal, job, hiredate
from emp
where job='MANAGER'
order by hiredate desc;

--emp ���̺��� job�� MANAGER�� ����� ���, �̸�, �޿�, ����, hiredate �� hiredate�� ��������(�ֱ��Ի�)���� �����϶�.

select job, deptno
from emp
order by job asc, deptno desc; --job�� ������������ �����ϰ�, job�� ���ٸ� deptno �� ������������ �����϶�. >>grouping
--order by �÷���, asc, �÷��� asc, ....

--������ 
--������(union)     : ���̺�� ���̺��� �����͸� ��ġ�� �� (�ߺ��� ����)
--������(union all) : ���̺�� ���̺��� �����͸� ��ġ�� �� (�ߺ��� ���)

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
--ut ���� uta �ı����� ����� �� (�ߺ� ������ ����)

select * from ut
union all
select * from uta;
--ut ���� uta �ı����� ����� �� (�ߺ� ������ �ȵ�)

--union
--1. [����]�ϴ� [�÷�]�� [Ÿ��]�� ����

select empno, ename from emp  --���� : ���� - ���ڿ�
union
select dname, deptno from dept; --���� : ���ڿ� - ����

select empno, ename from emp
union
select deptno, dname from dept;

--���� ���߿� subquery �� ����ؼ� ���� ���̺� ...

select *
from (
        select empno , ename from emp
        union
        select deptno, dname from dept
     ) m
order by m.empno desc;

--subquery ��� �� in-lin view

--2. [����]�Ǵ� [�÷�]�� ������ [����]

select empno, ename,  job, sal from emp
union
select deptno, dname, loc from dept; --union �Ұ�

-- �ʿ�� (null) �÷��� ��ü
select empno, ename,  job, sal from emp
union
select deptno, dname, loc, null from dept;
------------------------------------------ null �� �÷��� ��ü
-- �ʱ� ������ �ǹ������� �ؾ��ϴ� �ڵ� (���� ���̺� select)
-- ����Ŭ.pdf (47 page)






















