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

show user;
select sysdate from dual;

/*
���� �� �Լ��� ���� 
1) ������ �Լ� : ���ڸ� �Է� �ް� ���ڿ� ���� �� ��θ� RETURN �� �� �ִ�.
2) ������ �Լ� : ���ڸ� �Է� �ް� ���ڸ� RETURN �Ѵ�.
3) ��¥�� �Լ� : ��¥���� ���� �����ϰ� ���ڸ� RETURN �ϴ� MONTHS_BETWEEN �Լ���
�����ϰ� ��� ��¥ ���������� ���� RETURN �Ѵ�.
4) ��ȯ�� �Լ� : � ���������� ���� �ٸ� ������������ ��ȯ�Ѵ�.
5) �Ϲ����� �Լ� : NVL, DECODE
*/

--���ڿ� �Լ� 

select initcap('the usper man') from dual; --�ܾ��� ù���ڸ� �빮�ڷ�

select lower('AAA'), upper('aaa') from dual;

select ename , lower(ename)as ename from emp;
select ename , lower(ename)as ename from emp;

select * from emp where lower(ename) = 'king';

select length('abcd') from dual; --���ڿ��� ����

select length('ȫ�浿') from dual; --3��

select length('      ȫ  ��  �� a') from dual; -- 15�� ���鵵 ���ڿ��� ����

select concat('a','b') from dual;
--select concat('a','b','c','d') from dual;
select 'a' || 'b' || 'c' from dual;

select concat(ename,job) from emp;
select ename || ' ' || job  from emp;

-- JAVA : substring
-- ORACLE : substr

select substr('ABCDE',2,3) from dual; --BCD ��ȣ�κ���'2' n��('3')�� ��� (�������� 1�̴�)
select substr('ABCDE'1,1) from dual; --A 
select substr('ABCDE'3,1) from dual;

select substr('dfsfdfsfdsfsxxzfsfsfsdfs',3) from dual;

/*
������̺��� ename �÷��� �����Ϳ� ���ؼ� ù���ڴ� �ҹ��ڷ� ������ ���ڴ� �빮�ڷ� ����ϵ�
�ϳ��� �ø����� ���� ����ϰ�, �÷��� ��Ī�� fullname �ϰ� ù���ڿ� 
������ ���� ���̿��� ���� �ϳ��� �ۼ�
*/

select lower(substr(ename,1,1)) from emp;
select upper(substr(ename,2)) from emp ;
select upper(substr(ename,2,length(ename))) from emp;

select lower(substr(ename,1,1)) ||' '|| upper(substr(ename,2)) as fullname
from emp;

select lpad('ABC',10,'*') from dual; --*******ABC

select rpad('ABC',10,'*') from dual; --ABC*******

select rpad('ABC',5,'%') from dual; --ABC%%

-- ������� ��� : kong1004 or k1234
-- ȭ�� ��� : ko****** or k1***

select rpad(substr('hong1004',1,2),length('hong1004'),'*') from dual;
select rpad(substr('k1234',1,2),length('k1234'),'*')from dual;

-- emp ���̺��� ename �÷��� �����͸� ����ϵ� ù���ڸ� ����ϰ� �������� * ����ϼ���

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

--rtrim �Լ�
--������ ���ڸ� ������
select rtrim('MILLER','ER') from dual; --MILL

--ltrim
--���� ���ڸ� ������
select ltrim('MILLLLLLER','MIL') from dual; --ER

--��������
--select '>' ||'MILLAR'|| '<' from dual;

select '>' || rtrim('MILLAR              ',' ')|| '<' from dual;
select '>' || ltrim('MILLAR              ',' ')|| '<' from dual;

--ġȯ�Լ�
select ename, replace(ename,'A','�Ϳ�') from emp;

--�����Լ�
--round (�ݿø��Լ�)
--trunc (�����Լ�)
--mod() ������ ���ϴ� �Լ�

--    0(����)
select round(12.345,0) as r from dual;  --�����θ� ���ܶ�

select round(12.567,0) as r from dual; --13

select round(12.345,1) as r from dual; --12.3

select round(12.567,1) as r from dual; --12.6

select round(12.345,-1) as r from dual; -- 10

select round(15.345,-1) as r from dual; --20

select round(12.567,-2) as r from dual; --0



--trunc ����
select trunc(12.345,0) as r from dual;  --12

select trunc(12.567,0) as r from dual; --12

select trunc(12.345,1) as r from dual; --12.3

select trunc(12.567,1) as r from dual; --12.5

select trunc(12.345,-1) as r from dual; -- 10

select trunc(15.345,-1) as r from dual; --10

select trunc(12.567,-2) as r from dual; --0

--������

select 12/10 from dual; --1.2 ��� ������

select mod(12, 10) from dual; -- ������ �Լ�

select mod(0,0) from dual; --0���� ���� �� �ִ�

select mod(50,0) from dual;
---------------------------------------------

-- ��¥ �Լ� (����)

select sysdate from dual;
--POINT
--1. Date + Number >> DATE
--2. Date - Number >> DATE
--3. Date - Date   >> Number  (�ϼ�) ^^

select sysdate + 100 from dual;
select sysdate + 1000 from dual;
select sysdate - 1000 from dual;

select hiredate from emp;

select months_between('2022-09-27','2020-09-27') from dual; --������ ���ϴ� �Լ�
select trunc(months_between('2022-09-27','2020-09-27'),0) from dual; --trunc �� ����ؼ� �Ҽ����� ����(��Ȯ�� �������� ����)

select months_between(sysdate, '2020-01-01') from dual;
select trunc(months_between(sysdate, '2020-01-01'),0) from dual;

--���ǻ���
select '2022-01-01' + 100 from dual; --'2022-01-01'�� [��¥����]������ ���ڿ��� �����Ѵ�
--�ذ� �Լ� : ���ڸ� ��¥�� �����ϴ� �Լ� to_date()

select to_date('2022-01-01') + 100 from dual;


-- ������̺��� ������� �̻��Ͽ��� ���糯¥������ �ټ� ������ ���ϼ���.
-- ����̸�, �Ի���, �ټӿ��� ���
-- �� �ټӿ����� �����θ� ���

select ename,hiredate,trunc(months_between(sysdate, hiredate),0) as �ټӿ��� from emp;

--�Ѵ��� 31�� �̶�� �����ϰ� ..... ���ؿ��� �� �� ������ ���ϼ���
--�Լ��� ������� ������ (�ݿø�����������_)

select ename,hiredate,trunc((sysdate-hiredate)/31,0) as �ټӿ��� from emp;

----------------------------------------------------------------------------
--------------------�����Լ�, �����Լ�, ��¥�Լ� END---------------------------

--��ȯ�Լ� TODAY POINT
--����Ŭ ������ ���� : ���ڿ�, ����, ��¥

--to_char() : ���� -> ���Ĺ��� (100000(����) -> $100,000(����)) >> format �����������
--to_char() : ��¥ -> ���Ĺ��� ('2023-01-01' -> 2023��01��01��) >> format �����������


--to_date() : ����(��¥����) -> ��¥
--select to_date('2023-01-01') + 100 from dual;

--to_number() : ���� -> ���� (�ڵ� ����ȯ)
select '100' + 100 from dual;
select to_number('100') + 100 from dual; 
--���� ����� ���� to_number��ũ�� ������ ����.

--��ȯ�� ǥ ����(����Ŭ ���� 69~71 page)
--���� format

select sysdate , to_char(sysdate,'YYYY') || '��' as yyyy ,
to_char(sysdate, 'YEAR') as YEAR ,
to_char(sysdate, 'MM') as MM ,
to_char(sysdate, 'DD') as DD ,
to_char(sysdate, 'DAY') as DAY
from dual;

-- �Ի����� 12���� ����� ���, �̸�, �Ի���, �Ի�⵵, �Ի���� ����ϼ���.

select empno, ename, hiredate ,to_char(hiredate,'YYYY') as �Ի�⵵ ,to_char(hiredate, 'MM') �Ի��
from emp
where to_char(hiredate,'MM') ='12';


select '>'|| to_char(12345,'999999999999')|| '<' from dual; --�������

select '>'|| ltrim(to_char(12345,'999999999999'),' ')|| '<' from dual; -- ��������

select '>'|| to_char(12345,'$999,999,999,999,999,999') || '<' from dual;

select sal ,to_char(sal,'$999,999')as �޿� from emp;

-- HP���� �̵�

show user;
select * from employees;

--select first_name || last_name as fullname

select concat(first_name,last_name) as fullname, to_char(hire_date,'YYYY_MM_DD') as �Ի���, to_char((SALARY*12)*1.1,'$999,999,999,999,999,999') as �����λ��
from employees
where to_char(hire_date,'YYYY') >= '2005' 
order by �����λ�� desc; 
--select �� ����� �����ϱ� ������ select �÷���

show user;

select 'A' as a, 10 as b, null as c, empno from emp;
from emp;
---------------------------------------------------------------------
--����, ����, ��¥, ��ȯ�Լ�(to_..)
---------------------------------------------------------------------
--�Ϲ��Լ� (���α׷��� ������ ���ϴ�)
--SQL (����, ��� ������ ����)
--PL-SQL (programming language)(����, ��� ......)��ޱ�� (Ʈ����, Ŀ��, ���ν���)

--nvl() null ó���ϴ� �Լ�
--decode() >> java�� if��    >> ��� ������(�м�) >> pivot , cube , rollup
--case() >> java switch��


select comm, nvl(comm,0) from emp;

create table t_emp(
    id number(6), --���� 6�ڸ�
    job nvarchar2(20) --unicode ������, �ѱ� 2byte ...... 20�� >>40byte
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

select id, decode(id,100,'����Ƽ',
                    200,'������',
                    300,'������',
                    '��Ÿ�μ�') as�μ��̸�
from t_emp;

select empno, ename , deptno, decode(deptno, 10 , '�λ��',
                                             20 , '������',
                                             30 , 'ȸ���',
                                             40 , '�Ϲݺμ�',
                                             'ETC')as �μ��̸�
from emp;

create table t_emp2(
    id number(2),
    jumin char(7) -- char �������� ���ڿ�  -- data�� �������϶� ����ϴ� Ÿ��  (// varchar �������� ���ڿ�)
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

t_emp2 ���̺��� id, jumin �����͸� ����ϵ� jumin�÷��� ���ڸ��� 
1�̸� ����, 2�̸� ����, 3�̸� �߼� ��ܴ� ��Ÿ.
*/

select id, jumin, decode( substr(jumin,1,1) , 1,'����',
                                          2,'����',
                                          3,'�߼�',
                                         '��Ÿ')as ����
from t_emp2;


--if�ȿ� if �� �� �ִ�.
--decode �ȿ� decode ���� �� �ִ�
--decode(decode())

/* ���빮��
�μ���ȣ�� 20���� ����߿��� SMITH ��� �̸��� ���� ����̶�� HELLO
�μ���ȣ�� 20���� ����߿��� SMITH ��� �̸��� ���� ����� �ƴ϶�� WORLD
�μ���ȣ�� 20���� ���̸� ETC
*/
select empno, ename, decode(empno,20,decode(ename ,'SMITH', 'HELLO','WORLD'),
                                        'ETC')from emp;
                                        
--CASE ��
/*

CASE ���ǽ� WHEN ���1 THEN ���1
           WHEN ���2 THEN ���2
           WHEN ���3 THEN ���3
           WHEN ���4 THEN ���4
           ELSE ���5
from "�÷���"
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

select '0' || to_char(zipcode) ,case zipcode when 2  then '����'
                                             when 31 then '���'
                                             when 16 then '��'
                                             when 45 then '����'
                                             else '��Ÿ'
                                end �����̸�
from t_zip;


/*

������̺� ����޿��� 1000 ���ϸ� ��
2000 3�� , 3000 2�� , 4000 1��, ���� Ư��

CASE ���ǽ� WHEN ���1 THEN ���1.

2. ���ǽ��� �ʿ��ϴٸ�
case when ���� �񱳽� then ���,
case when ���� �񱳽� then ���,
case when ���� �񱳽� then ���,
else
*/
select * from emp;

select ename, sal, deptno, case  when sal <=1000 then '4��'
                                when sal between 1001 and 2000 then '3��'
                                when sal between 2001 and 3000 then '2��'
                                when sal between 3001 and 4000 then '1��'
                                else 'Ư��'
                                end ���
from emp;

select ename, sal, deptno, case when sal <=1000 then '4��'
                                when sal >1000 and sal <=2000 then '3��'
                                when sal >2000 and sal <=3000 then '2��'
                                when sal >3000 and sal <=4000 then '1��'
                                else 'Ư��'
                                end ���
from emp;
--------------------------------------------------------------------------
--�����Լ�, �����Լ�, ��¥�Լ�, ��ȯ�Լ�, �Ϲ��Լ� (nvl, decode, case)
--------------------------------------------------------------------------
--pdf���� 75page

--�����Լ�(�׷�)
/*
1. count(*) >> row�� , count(�÷���)>> ������ �Ǽ�
2. sum()
3. avg()
4. max()
5. min()
��Ÿ

1. �����Լ��� group by ��� ���� ���
2. ��� �����Լ��� null ���� �����Ѵ�
3. select ���� �����Լ� �̿ܿ� �ٸ� column�� ���� �ݵ�� �� ������ group by ���� ���
*/

select count(*) from emp; -- 14���� row ������ ����

select count(empno) from emp; --14��

select count(comm) from emp; --�����Լ��� null���� �������� ���Ѵ�. null�� �ƴ� �����͸� ī�����Ѵ�.

select count(nvl(comm,0)) from emp; --14�� nvl�� null�� 0���� ä���� ������ count ��.

--�޿��� ��
select sum(sal) from emp;

select trunc(avg(sal)) from emp;

--����� .... �� ������ �󸶳� ���޵Ǿ���?

select sum(comm) from emp;

--������ ����� ����?

select trunc(avg(comm)) from emp; --721

select comm from emp;


select (300+200+30+300+3500+0)/6 from dual; --null�� �����ϱ� ������ comm�� ���� ������ ���� ������� ����

select (300+200+30+300+3500+0)/6 from dual;
select trunc(avg(nvl(comm,0)))from emp;

--comm �� �ִ� ����鸸�� ���, comm�� ���� ����� ���Ե� ��� ��� �´�. (���ؿ� ���� �޶�����)

-- ��� : null�� ���� ����� �ʿ��ϴ�!!

select max(sal) from emp;
select min(sal) from emp;

select sum(sal), avg(sal), max(sal), min(sal), count(sal) -- ������ �����Ͱ� 1���̱� ������ ���� �����ϴ�
from emp;

select empno, count(empno) from emp;  --"not a single-group group function"


--�μ��� ��� �޿��� ���ϼ���
select deptno, avg(sal)
from emp
group by deptno;


--������ ��� �޿�
select job , avg(sal)
from emp
group by job; -- �������� ������ ������ (�Ǵ� �� �� ����.)\\

select job, avg(sal), sum(sal),max(sal),min,(sal)count(sal)
from emp
group by job

-- group
-- disctinct �÷���1. �÷���2
-- order by ������1. �÷���2

-- �μ��� ������ �޿��� ���� ���ϼ�

select deptno, job, sum(sal), count(sal)
from emp
group by deptno, job
order by deptno; --�μ���ȣ ..�׾ȿ��� ��ǰ�� �׷� ... �հ�
/*
select ��        4
from ��          1
where ��         2
group by ��      3
order by ��      5
*/

-- ������ ��ձ޿��� 3000 �޷� �̻��� ������ ��� �޿��� ����ϼ�

--select deptno, ename, job ,avg(sal)
--from emp
--where avg(sal) >=3000;

select job, avg(sal)
from emp
group by job
having avg(sal) >=3000;

--from ���� ������ >> where
-- group by ���� ������ >> having (�����Լ� ������ �Ķ�)

/*
select ��        5
from ��          1
where ��         2
group by ��      3
having ��        4
order by ��      6

���� ���̺� ó���� �� �ִ� ��� ����
*/


/* ������̺��� ������ �޿����� ����ϵ� ������ ���޹ް� �޿��� ���� 5000 �̻���
������� ����� ����Ͻä�. (comm 0�� ����� �޴� ������ ���)
�޿��� ���� ���� ������ ����Ͻÿ�
*/
select job ,sum(sal) as sumsal
from emp
where comm is not null
group by job
having sum(sal) >=5000
order by sumsal asc;

/*
������̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ����Ͻÿ�.
*/
select * from emp;

select deptno, count(deptno), sum(sal)
from emp
group by deptno
having count(*) >4;
-- select count(*) from emp where job is null; -- null ���� Ȯ������


/*
������̺��� ������ �޿��� ���� 5000�� �ʰ��ϴ� ������ �޿��� ���� ����ϼ���
�� �Ǹ����� �� �����ϰ� �޿��� ������ �������� �����Ͻÿ�
*/
select job, sum(sal) 
from emp
where job != 'SALESMAN'
group by job
having sum(sal) >5000
order by sum(sal) desc;

/*
HR �������� �̵��ϼ���

1. EMPLOYEES ���̺��� �̿��Ͽ� ���� ���ǿ� �����ϴ� ���� �˻��ϼ���. 
2005�����Ŀ� �Ի��� ��� �߿� �μ���ȣ�� �ְ�, �޿��� 5000~10000 ������ ����� �˻��մϴ�. 
��) ���̺� : employees 
��) �˻� : employee_id, last_name, hire_date, job_id, salary, department_id 
��) ����
    �� 2005�� 1�� 1�� ���� �Ի��� ���
    �� �μ���ȣ�� NULL�� �ƴ� ��� 
    �� �޿��� 5,000���� ũ�ų� ����, 10,000 ���� �۰ų� ���� ��� 
    �� ���� ������ ��� �����ϴ� ���� �˻� 
��) ����: department_id ��������, salary ��������
*/
select * from employees;
select employee_id, last_name,hire_date, salary
from employees
where department_id is not null 
        and SALARY between 5000 and 10000 
        and hire_date > to_date('2005-01-01') -- hire_date > '2005/01/01'
order by department_id asc , salary desc;


/*
2. EMPLOYEES ���̺��� �̿��Ͽ� ���� ���ǿ� �����ϴ� ���� �˻��ϼ���. 
�μ���ȣ�� �ְ�, �μ��� �ٹ� �ο����� 2�� �̻��� ���� �˻��Ͽ� �μ��� �ִ� �޿��� �ּ� �޿��� �����
�� �� ���̸� �˻��մϴ�. 
��) ���̺� : employees 
��) �˻� : department_id, MAX(salary), MIN(salary), difference 
        - MAX(salary) �� MIN(salary)�� ���̸� DIFFERENCE�� �˻� 
��) ����
    �� �μ���ȣ�� NULL�� �ƴ� ��� 
    �� �μ��� �ٹ� �ο����� 2�� �̻��� ���� 
��) �׷� : �μ���ȣ�� ���� ��
��) ���� : department_id 
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
--���� ���̺� ���� END---------------------------------------------------------------------

--ETC
--create table ���̺�� (�÷��� Ÿ��, �÷��� Ÿ��)
create table member3(age number);

--������ 1��
insert into member3(age) values (100);

--������ ������
insert into member3(age) values (200);
insert into member3(age) values (300);
insert into member3(age) values (400);

------------------------------------------------------------------------
/*
JAVA
class Member3 { private int age; setter, getter}

--1��
Member3 member = new Member3()
member.setAge(100);

-- �ټ��� ������
List<Member3> mlist = new ArrayList<>();
mlist.add(new Member3(100));
mlist.add(new Member3(200));
mlist.add(new Member3(300));


������ Ÿ��
���ڿ� ������ Ÿ��
char(10)    >>10byte >> �ѱ� 5��, ������, Ư��, ���� 10�� >> �������� ���ڿ�
varchar(10) >>10byte >> �ѱ� 5��, ������, Ư��, ���� 10�� >> �������� ���ڿ�

�������� (�����Ϳ� ������� ũ�⸦ ���°�)
�������� (������ ������ ũ�⸸ŭ Ȯ��)

char(10) >> 'abc' >> [a][b][c][][][][][][][] >> ������ ũ��� ��ȭ�� ����
varchar2(10) >> 'abc' >>[a][b][c] >> ������ ũ�� ��ŭ ���� Ȯ��

������ �˻��� �־ >> char() �� �� ������ ����. >> ��������.... �������ٴ� �� �ռ��� �˻�

char �� varchar�� ���

char(2) : �������� ex) ��,�� ... ��,��,�� ... �ֹι�ȣ.... << �˻������� ����
varchar : ����� �̸�, ���,�ּ� ...  <<�Է¹��� �������� ũ�⸦ ������ �� ���� ��.

�ѱ�, ����� >> �ѹ��� >> unicode >>�ѱ�, ���� >> 2byte >>nchar �ѹ����� ũ�⸦ �������� /Ÿ���� ������ ���ڴ� ������ ����

nchar(20) >> 20�� >> ���� Ư������ ���� ������� 20�ڸ� �⺻���� �Ѵ� >> 40byte
nvarchar2(20) >> 20��





*/

--����Ŭ �Լ� ......
select * from SYS.NLS_DATABASE_PARAMETERS;
--NLS_CHARACTERSET  : 	AL32UTF8  �ѱ� 3byte �ν�
--KO16KSC5601 2Byte (���� ��ȯ�ϸ� �ѱ� �ٱ���)
select * from nls_database_parameters where parameter like '%CHAR%';
------------------------------------------------------------------------------
create table test2(name varchar2(2));

insert into test2(name) values('a');
insert into test2(name) values('aa');
insert into test2(name) values('��'); --�ѱ� 1�� 3byte ���� // ����Ŭ ������ // �̷����� �ִ�? ����ؾ��� �� �� �ִ�>?
-------------------------------------------------------------------------------
?-- ����Ŭ pdf ���� 5��
/*
--JOIN
Cartesian Product   ��� ������ ����� Join
Equijoin Join       ������ ��Ȯ�� ��ġ�ϴ� ��� ���(�Ϲ������� PK �� FK ���)
Non-Equijoin Join   ������ ��Ȯ�� ��ġ���� �ʴ� ��쿡 ���(���,����)
Outer Join Join     ������ ��Ȯ�� ��ġ���� �ʴ� ��쿡�� ��� ����� ���
Self Join           �ϳ��� ���̺��� ����� Join �ϰ��� �� ��쿡 ���
Set Operators       ���� ���� SELECT ������ �����Ͽ� �ۼ��Ѵ�

Equijoin
Non-Equijoin
Outer Join
Self Join

������ DB (RDBMS)

���� (���̺�� ���̺��� ����)
(Ŭ���� (�ڹ�) ��) >> �������� ���� 

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

--1. ����� (equi join)
--�����̺�� �����Ǵ� ���̺� �ִ� �÷��� �����͸� 1:1 ����
--SQL JOIN ���� (����Ŭ) ����
--ANSI ����(����) >> �ٸ� SQL������ �������� >> [inner]join  on ������

select * 
from m, s
where m.m1 = s.s1;

--�⺻ SQL ����
select m.m1 , m.m2, s.s2
from m, s
where m.m1 = s.s1;

--ANSI (ǥ�ع���)
select *
from m join s -- m inner join s
on m.m1 = s.s1;

select * from emp;

-- �����ȣ, ����̸�, �μ���ȣ, �μ��̸��� ����ϼ���
select emp.empno, emp.ename, emp.deptno, dept.dname
from emp join dept
on emp.deptno = dept.deptno;

--���������� table�̸��� ���
--���� (���̺� ����Ī �ο�)
select e.empno, e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;

--***������ select * �ϰ� ���� �÷��� ���
select s.s1, s.s2, x.x2
from s join x
on s.s1 = x.x1;
--���̺�� ���̺��� �÷��� 1��1 ���� :�����