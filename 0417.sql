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
where ename like '%A%';

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

select initcap('the super man') from dual; --�ܾ��� ù���ڸ� �빮�ڷ�

select lower('AAA'), upper('aaa') from dual;

select ename , lower(ename)as ename from emp;
select ename , lower(ename)as ename from emp;

select * from emp where lower(ename) = 'king';
select * from emp where ename = 'king';

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

select sysdate from dual;
-----------------------------------------------------------------------
--0419

--SQL JOIN ����
select *
from m, s, x
where m.m1 = s.s1 and s.s1=x.x1;

-- SQL ������ ���� : where�� ���ǹ��� ������� ���ǹ����� �˱�����.

--ANSI ����(����)
select*
from m join s on m.m1 = s.s1
       join x on s.s1 = x.x1;
--     Join y on x.x1 = y.y1;

show user;
select * from employees;
select * from departments;
select * from locations;


select count(*) from employees;
--���, �̸�(last name), �μ���ȣ, �μ��̸� ���
select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

select  e.employee_id, e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;
--1�� ����(department_id =null) >>outer join�����

--���, �̸� ,�μ���ȣ, �μ��̸�, �����ڵ� ,���ø�
select e.employee_id, e.last_name, e.department_id, d.department_name, d.location_id, l.city
from employees e join departments d on e.department_id = d.department_id
                 join locations l on d.department_id = l.location_id;
                 
show user;

select * from emp;
select * from salgrade;              

--����� ��� (�ϳ��� �÷����� ���� �ȵǿ�)>> �÷� 2��
--�� ���� (non-equi) 1:1
--���� : ��� ����(�ǹ�)

select e.empno, e.ename, d.grade, e.sal
from emp e join salgrade d
on e.sal between d.losal and d.hisal;

-- outer join equi ���� ����ǰ� ���� >> �����ִ� �����͸� �������� ���
-- 1. ���� ���� (������ �Ǵ� �ʿ� �����ִ� �����͸� �������� ���)
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


--���, �̸�(last name), �μ���ȣ, �μ��̸� ���
select  e.employee_id, e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;
--1�� ����(department_id =null) >>outer join�����

select  e.employee_id, e.last_name, e.department_id, d.department_name
from employees e left join departments d
on e.department_id = d.department_id;
-- ���� ������ (null ��� JOIN >> outer join)
select *from employees where department_id is null;

-- self join(�������) -> ����(X) -> �ǹ̸� ���� -> ����� ����
-- �ϳ��� ���̺� �ִ� �÷��� �ڽ��� ���̺� �ִ� Ư�� �÷��� �����ϴ� ���

select * from emp;
-- SMITH ����� ��� �̸� -> MGR, EMPNO�� ã�´�.
-- ������ ���̺��� ���� �����ؼ� ����� �� �����?
-- ������ �ߺ��� �߻� -> ��ȿ��
-- ���̺� ����Ī >> 2��, 3�� �ִ� ��ó��

--13�����
select e.empno , e.ename , m.empno, m.ename
from emp e  join emp m
on e.mgr = m.empno;

--14�����
select e.empno , e.ename , m.empno, m.ename
from emp e left join emp m
on e.mgr = m.empno;


select count(*) from emp where mgr is null;

-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�.
    
select * from emp;   
select * from dept;

select e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;

-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸���

-- ����϶�.

select e.ename , e.job, e.deptno,d.dname 
from emp e join dept d 
on e.deptno = d.deptno
where d.loc = 'DALLAS';



-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�.

select e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.ename like '%A%';




-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������

--����ϴµ� ������ 3000�̻��� ����� ����϶�.

select e.ename , d.dname, e.sal 
from emp e join dept d
on e.deptno = d.deptno
where e.sal >=3000;

select e.ename, d.dname, e.sal
from emp e join dept d
on e.deptno = d.deptno
where sal >= 3000;


-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸���

-- �� ����� ���� �μ� �̸��� ����϶�.

select * from emp;
select * from dept;
select * from salgrade;

select e.job , e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';




-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,

-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',

-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.

--(�� ) 1 : 1 ���� ��� �÷��� ����

select * from salgrade;

select e.empno as �����ȣ, e.ename as ����̸�, 
       e.sal*12+comm as ����,sal as �Ǳ޿�, s.grade as ���
from emp e join salgrade s 
on e.sal between s.losal and s.hisal
where e.comm is not null;

-- 7. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,

-- ����, �޿������ ����϶�.

select e.empno, d.dname, e.ename ,e.sal ,s.grade
from emp e join dept d on e.deptno = d.deptno
           join salgrade s on e.sal between s.losal and s.hisal
where e.deptno = '10' ;



-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�,

-- ����̸�, ����, �޿������ ����϶�. �׸��� �� ��µ�

-- ������� �μ���ȣ�� ���� ������, ������ ���� ������

-- �����϶�.
select * from dept;
select * from salgrade;
select * from dept;
select * from emp;
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join dept d on e.deptno = d.deptno
           join salgrade s on e.sal between s.losal and s.hisal
where e.deptno = '10' or e.deptno = '20';      
                 

-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� ��������

-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',

-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.

-- SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)

select e.empno as �����ȣ , e.ename as ����̸� , e.mgr as  �����ڹ�ȣ, p.ename as  �������̸�
from emp e left join emp p
on e.empno = p.mgr;





-------------------------------------------------------------------------------
--JOIN END ---------------------------------------------------------

--subquery(��������) 100page
--sql �� -> ���� �ذ��

--1. �Լ� > ���� ���̺� > ���� ���̺� (join, union) > �ذ� �ȵɶ� >> subquery �ذ�

--������̺� ������� ��� ���޺��� �� ���� ������ �޴� ����� ���,�̸� ,�޿� �� �߷�

-- �Ұ��� : ����

--1. ��ձ޿�
select avg(sal) from emp;

select empno, ename 
from emp  
where sal > 2073;--avg(sal);

--�ΰ��� ������ �����ؼ� �ϳ��� ������ �ۼ�

select empno, ename, sal
from emp
where sal > (select avg(sal) from emp);

--subquery
/*
1. single row subquery : ���������� �������� ���� �÷��� ���Ϸο찪 �� ��� (�Ѱ��� ��)
ex) select sum(sal) from emp, select max(sal) from emp
������ : = , !=, <, >

2. multi row subquery : ���� ����� �����÷��� �������� �ο찪�� ���
ex) select deptno from emp, select sal from emp
������ : IN, NOT IN, ANY, ALL
ALL : sal> 1000 and sal >40000 and ...
ANY : sal> 100 or sal > 400 or .....

����)
1. ��ȣ�ȿ� �־�� �ȴ�. (select max(sal) from emp)
2. ���� �÷� ����       (select max(sal), min(sal) from emp) �������� �ȵȴ�.
3. ���������� �ܵ����� ���� ����

���� ���� ���� ���� ����
1. �������� ����ǰ� �� ����� ������
2. ���������� ����ȴ�.

TIP) 
select (subquery) >> scala subquery
from (subquery) >> in lin view (�������̺�)
where (subquery) >> ����
https://cafe.naver.com/erpzone

*/

--������̺��� jones�� �޿����� �� ���� �޿��� �޴� ����� ���, �̸�, �޿��� ���
-- jones�� �޿��� �켱 �˾ƾ��Ѵ�
-- 1.select sal from emp where ename='JONES';

select empno, ename, sal
from emp
where sal >(select sal from emp where ename='JONES');

-- �μ���ȣ�� 30���� ����� ���� �޿��� �޴� ��� ����� ������ ���
-- select sal from emp where deptno=30; multi row


select *
from emp 
where sal in (select sal from emp where deptno=30);
-- sal=1600 or sal =1250

select *
from emp 
where sal not in (select sal from emp where deptno=30);
-- sal != 1600 and sal !=1250.....

--���������� �ִ� ����� ����� �̸��� ���

select mgr from emp;

select empno,ename
from emp
where empno in (select mgr from emp);


select empno,ename
from emp
where empno not in (select nvlmgr from emp);
-- empno != 7902 and emp != 7698 ... empno != null
-- and ���꿡 null �� ������ ����� ��� null
-- not in �� ������ and

select empno,ename
from emp
where empno not in (select nvl(mgr,0) from emp);

-- king���� �����ϴ� �� ���ӻ���� king�� ����� ���,�̸�,���� ,�����ڻ�٤ä��� ���
select empno, ename, job ,mgr
from emp
where mgr IN (select empno from emp where ename='KING');


--20�� �μ��� ����߿��� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� �����
-- ���, �̸�, �޿�, �μ���ȣ�� ���

select empno, ename, sal , deptno
from emp
where sal > (select max(sal) from emp where deptno ='20');

--JOIN�������� �μ��̸��� ���?
--��Į�� ��������

select e.empno, e.ename , e.deptno, (select d.dname from dept d where d.deptno = e.deptno)
from emp e
where e.sal >= 3000;

--�ڱ� �μ��� ��� ���޺��� �� ���� ������ �޴� ����� ���, �̸�, �μ���ȣ, �μ��� ��տ���

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

--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�.

?
SELECT ENAME , SAL
FROM EMP 
WHERE sal > (SELECT sal FROM emp WHERE ENAME ='SMITH');
?

--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����,

-- �μ���ȣ�� ����϶�.

?
SELECT ename, sal, deptno
from emp
where sal in (select sal 
              from emp 
              where deptno='10');
?

--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�

-- 'BLAKE'�� ���� ����϶�.

?

select ename, hiredate
from emp
where deptno= (select deptno 
               from emp 
               where ename='BLAKE') 
        and ename!='BLAKE';
?

?

--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������

-- ����ϵ�, ������ ���� ��� ������ ����϶�.

?
select e.ename, e.empno, e.sal
from emp e
where sal >(select trunc(avg(sal),0) from emp)
order by sal desc;

--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�

-- �ִ� ����� �����ȣ�� �̸��� ����϶�.

select ename, empno
from emp
where deptno in (select deptno 
                 from emp 
                where ename like '%T%');
?

--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������

-- ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.

--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��)

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
             
-- where sal > 100 and sal > 1250 .... >> ALL �� ����ϸ� max���� ���� �Ͱ� ����.



--7. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����

-- �̸�, �μ���ȣ, ������ ����϶�.

?
select distinct e.ename, e.deptno, e.job
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO    -- = �� �´µ�  IN
                FROM DEPT
                WHERE LOC='DALLAS');

--8. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����϶�.


select e.ename, e.deptno, e.job
from emp e
where deptno = (select distinct deptno from dept where dname='SALES');


?

?

--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�

--king �� ����� ��� (mgr �����Ͱ� king ���)

?
select ename, sal
from emp
where mgr = (select empno 
             from emp 
             where ename='KING');
?

?


?

--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ����

-- ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�,

-- �޿��� ����϶�.

?

select empno, ename, sal
from emp
where sal> (select avg(sal) from emp) 
      and deptno in (select deptno from emp where ename like '%S%');
?

?

?

--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� �����

-- �̸�, ����, �μ���ȣ�� ����϶�.

?
select ename, sal, deptno
from emp
where deptno in (select deptno from emp where comm is not null)
and sal in (select sal from emp where comm is not null);
?

?

--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����

-- ������� �̸�, ����, Ŀ�̼��� ����϶�.

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
-- �⺻���� DML ���� (�ʼ��ϱ�)---------------------------------------

-- ������ ����(DML) �Դϴ�.
--168page
--insert, update, delete (�ݵ�� �ϱ�)

/*
DDL(������ ���Ǿ�) : create, alter, drop, trucate(������������), rename, modify
DML(������ ���۾�) : Ʈ������� ����Ű�� �۾� : insert, update, delete

--����ִ� �̾߱�
ex) DB�� select�� �ߵǴµ�, insert,update, delete �ȵȴ�. Why?
   >> ���ڱ� log write �� �����ϴ� �۾� (����, ����, �, �������)
   >> DISK ��� (log file full) - log wirte �Ұ��� (��ϰ�������) >>DML �۾� �Ұ���
   >> log backup >> backup�� �ؾ� log�� �������� 
   
   >> commit ���� ���� ���..
   
DQL(������ ���Ǿ�) : select
DCL(������ �����) control language : ������ - ���Ѻο� / �ٷ�������

TCL(Ʈ������) : commit , rollback, savepoint
*/

-- ����Ŭ insert, update, delete �۾� �� �ݵ�� commit, rollback ó�� �ʼ�

select * from tab; --�����(KOSA) ������ ������ �ִ� table ���

-- ���� ���̺��� ���� ... �� �̸��� �ִ��� ������
select * from tab where tname='BOARD';
select * from tab where tname='EMP'; --table ���� �ݵ�� �빮�ڷ� �ۼ�

select * from col where tname = 'EMP'; 
-- TIP) tab, col ���̺� ����ϱ�

-------------------------------------------------------------------------------
--insert, update, delete ������ �ϱ�

--1. INSERT
create table temp(
    id number primary key, --not null, unique �ްڴ�. (ȸ��ID...)
    name varchar2(20)
);

desc temp;

--1. �Ϲ����� insert
insert into temp (id, name) values (100,'ȫ�浿');

--commit, rollback �ϱ� ������ �ǹݿ����� �ʾƿ�.
select * from temp;
commit;

--2. �÷� ��� ���� (insert) ����������
insert into temp values(200,'������');
-- �÷�����Ʈ�� �����ϸ� �־��� ��� �÷��� ���� �־���Ѵ�.

select * from temp; --������ ������ Ȯ��
rollback; -- ������ ������ �����

--3. ���� .... insert
insert into temp(name) values ('�ƹ���');

--�ڵ� id �÷� >> null >> PK >> �����߻� >>ORA-01400: cannot insert NULL into ("KOSA"."TEMP"."ID")

insert into temp(id,name) values(100,'������');
--PK�÷��� �ߺ������� �Է� >> �����߻� >>ORA-00001: unique constraint (KOSA.SYS_C007000) violated

insert into temp(id,name) values (200,'����');
select * from temp;
commit;

------------------------------------------------------------------------------
--TIP
--SQL �� ���α׷��� ��Ұ� ����. 
--PL-SQL�� ����, ��� 
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
    memberid number(3) not null, --3�ڸ� ����
    name varchar2(10), -- null ���
    regdata date default sysdate -- ���̺� �⺻�� ���� insert ���� ������ �ڵ� (��¥) ���� �Ѵ�.
);

desc temp3;

select sysdate from dual;

-- 1. ����
insert into temp3(memberid, name, regdata) values (100,'ȫ�浿','2023-04-19');

select* from temp3;

-- 2. ��¥
insert into temp3(memberid,name) values (200,'������'); --default sysdate

select * from temp3;

--3. �÷� �ϳ�
insert into temp3(memberid) values (300);
select * from temp3;

--4. ����
insert into temp3(name) values('������');
--id �÷��� null << not null << ORA-01400: cannot insert NULL into ("KOSA"."TEMP3"."MEMBERID")

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

-- �뷮 ������ �����ϱ�

select * from temp5; -- ���� ���� ����.

-- �ϰ������ : temp4 ���̺��� ��� �����͸� temp5�� �ְ�ʹ�.
--insert into ���̺��(�÷�����Ʈ) values (value ����Ʈ);
--insert into ���̺��(�÷�����Ʈ) valuse select ��~~~`
insert into temp5(num) select id from temp4;
-- ���� ������ Ÿ����ġ
select * from temp5; 
--�뷮 ������ �����ϱ�
commit;

--2��° �뷮 ������ �����ϱ�

--���� : �����͸� ���� table�� ���»�Ȳ
-- >> ���̺� ����(����):��Ű�� + �����ͻ��� ���
-- ��, ���������� ������ �� ����.(PK, FK)
-- ������ ������ ���� + ������

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

-- �丷����
-- Ʋ��(��Ű��) ���� �����ʹ� �����ϰ� ���� �ʴ�.
create table copyemp3
as 
    select * from emp where 1=1; --����
    
desc copyemp3;

select * from copyemp3;


create table copyemp31
as 
    select * from emp where 1=2; --���� >> Ʋ�� ����
    
select * from copyemp31;
-------------------------------------------------------------------------------

---UPDATE

/*
UPDATE ���̺��
set �÷��� = �� , �÷��� = ��, �÷��� = ��,�÷��� = �� ......
where ������

update ���̺��
set �÷��� = subquery�� �� �� �ִ�.
where �÷��� = subquery�� �� �� �ִ�.
update subquery �� �� �´�

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
--copyemp �� sal �÷��� ���� ��� sal�� ���� ������ ��ȯ

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
������ (SQL)

1. CRUD (create > insert , read > select, update ,delete )
2. APP(JAVA) - ǥ��(JDBC API) - Oracle
3. insert , update , delete ,select (70%)

�ϳ��� ���̺� ���ؼ� �۾�����
JAVA ���� EMP ���̺� ���� (CRUD)
APP(JAVA)
MVC(����) >> model(DTO,DAO,SERVICE) - View(html,jsp) - Controller(servlet) (�ϰ� ���ϴ� �͸� ��)

DB �۾� (DAO) >> EmpDao.java >> DB����(CRUD)
�⺻������ 5���� �Լ� ���� .....
1. ��ü��ȸ (�Լ�) : select * from emp ó�� �Լ�
>> public list<Emp> getEmpList() {������ return null;}
>> ������ ������
2. ������ȸ (�Լ�) : select * from emp where empno=
>> public Emp getEmpListByEmpno(int empno) { select * from emp where empno=? return null;}
>> ������ �Ѱ�
3. ���� (�Լ�)    : insert into emp(..) values(...)
>> public int insertEmp(Emp emp) {insert ... return row;}
4. ���� (�Լ�)    : update emp(...) set(....) where (...)
5. ���� (�Լ�)    : delete emp where ....
*/

-- 9�� ���̺� �����ϱ�
-- page 138


--DDL(create, alter, drop , rename ) ���̺�(��ü) ����, ����, ����
--�ڵ带 �𸣴��� �� ���� �ִ�... -> �ڵ带 �ۼ�����!

select * from tab;

select * from tab where tname =lower('board');

create table board(
    boardid number,
    title nvarchar2(50), --������ Ư������ ���� ������� 50��
    content nvarchar2(2000), --2000�� 4000byte
    regdate date
);

drop table board;
desc board;
--Tip)
select * from user_tables where lower(table_name) = 'board';
select * from col where lower(tname) = 'board';
--�������� Ȯ���ϱ�(�ݵ��)
select * from user_constraints where lower(table_name) = 'board';
select * from user_constraints where lower(table_name) = 'emp';

--oracle 11g >> �ǹ� >> �����÷�(�����÷�)
--�л� ���� ���̺� (����, ����, ����)
--�հ�, ���...
--�л� ���� ���̺�(����, ����, ����, ���) <- �������� ���̺� - �������� ��ȭ�� ���� ���ϴ� ��
-- ������ ���� ��ȭ >> ��հ��� ��ȭ ���� >> ���Ἲ

create table vtable(
    no1 number,
    no2 number,
    no3 number GENERATED ALWAYS as (no1 +no2) VIRTUAL
);

select * from col where lower(tname) = 'vtable';



insert into vtable(no1,no2) values (100,50);
select * from vtable;

--insert into vtable(no1,no2,no3) values (20,10,30); -- ���� : VIRTURE�� ������ �÷����� ���� �Է¹��� �ʴ´�

-- �ǹ����� Ȱ��Ǵ� �ڵ�
-- ��ǰ���� (�԰�) : �б⺰ ������ ����(4�б�)

create table vtable2(
    no number, --����
    p_code char(4), --��ǰ�ڵ� (a001,b003)
    p_date char(8), --�԰��� (20230101)
    p_qty number, --����
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
-- ���̺� ����� ���� ����
1. ���̺� �����ϱ�
create table temp6(id number);

desc temp6;

--2. �̹� ������ ���̺� �÷� �߰��ϱ�

alter table temp6
add ename varchar2(20);

desc temp6;


--3. ���� ���̺� �ִ� �÷� �̸� �߸� ǥ�� (ename -> username)
-- ���� ���̺� �ִ� ���� �÷� �̸� �ٲٱ�(rename)

alter table temp6
rename column ename to username;

desc temp6;

--4. ���� ���̺� �ִ� ���� �÷��� Ÿ���� ũ�⸦ ���� modify
alter table temp6
modify (username varchar2(2000));

desc temp6;

--5. ���� ���̺� ���� �÷� ����

alter table temp6
drop column username;

desc temp6;
-- ��� �۾��� TOOL ���� ���� 

--6. ���̺� ��ü�� �ʿ� ��������.
--6.1 delelte �����͸� ����
--���̺� ó�� ����� ó�� ũ�⼳�� >> ������ ������ >> ������ ũ�⸸ŭ ���̺� ũ�� ����
-- ó�� 1MB >> ������ 100����(insert) >> 100MB >> delete 100���� ���� >> ���̺� ũ�� 100MB

--���̺� (������) ����(������ ũ�⵵ ���� �� ������)
--truncate (���� : where �� ��� ���Ѵ�)
-- ó�� 1MB >> ������ 100����(insert) >> 100MB >> truncate  >> ���̺� ũ�� 1MB
--truncate table emp --DBA (������)

--���̺� ����
drop table temp6;

desc temp6;

-------------------------------------------------------------------------------
-- ���̺� ���� �����ϱ� page 144

/*
1.2.2 ������ ���Ἲ ���� ������ ���� 
�� �� �� �� �� ��
PRIMARY KEY(PK) �����ϰ� ���̺��� ������ �ĺ�(NOT NULL �� UNIQUE ������ ����)
FOREIGN KEY(FK) ���� ������ �� ������ �ܷ�Ű ���踦 �����ϰ� �����մϴ�.
UNIQUE key(UK) ���̺��� ��� ���� �����ϰ� �ϴ� ���� ���� ��(NULL �� ���)
NOT NULL(NN) ���� NULL ���� ������ �� �����ϴ�.
CHECK(CK) ���̾�� �ϴ� ������ ������(��κ� ���� ��Ģ�� ����

������ �ƴ����� default sysdate ...
*/


--PRIMARY KEY(PK) : NOT NULL �� UNIQUE ���� (null �����Ϳ� �ߺ����� ������� �ʰڴ�.)
--���� (���ϰ�)
-- empno primary key >> where empno=7788 >> ������ 1�� ����
-- PK (�ֹι�ȣ, ȸ��ID, ��ǰID)
-- ���� (PK �ڵ����� index ...) >> ��ȸ empno >> ���� >> index >> �ڵ�����
-- PK�� ���̺�� 1���� ������ �� �ִ�. (1���� �ǹ̴� (���)) >> ����Ű


--����
--1. create table ������ ���� ����
--2. create table �����Ŀ� �ʿ信 ���� �߰� (alter table emp add constraint ..)

--����Ȯ�� 
select * from user_constraints where table_name ='EMP';

create table temp7(
    -- id number primary key �������� �ʴ� ��� (�����̸� �ڵ����� ... ���� ���� ...)
    id number constraint pk_temp7_id primary key, -- ������ ���� �̸� : pk_temp7_id
    name varchar(20) not null,
    addr varchar2(50)
);

desc temp7;
select * from user_constraints where lower(table_name)='temp7';


insert into temp7(id,name,addr) values(10,'ȫ�浿','����� ������');
select * from temp7;
commit;

insert into temp7(id,name,addr) values(10,'�߹�����','����� ������');


--Unique (UK) ���̺��� ��� ���� �����ϰ� �ϴ� ���� ���� ��(NULL�� ���);
--�÷�����ŭ ���� ���� , NULL ���
--Unique ������ �ɰ� �߰������� not null >> ������

create table temp8(
    id number constraint pk_temp8_id primary key, -- ������ ���� �̸� : pk_temp7_id
    name varchar2(20) not null,
    jumin nvarchar2(6) constraint uk_temp8_jumin unique,
    addr varchar2(50)
);

select * from user_constraints where lower(table_name)='temp8';

insert into temp8(id,name,jumin,addr)
values(10,'ȫ�浿','123456','��⵵');

select * from temp8;

insert into temp8(id,name,jumin,addr)
values(20,'�浿','123456','����'); -- ����ũ ���� ORA-00001: unique constraint (KOSA.UK_TEMP8_JUMIN) violated

insert into temp8(id,name,addr)
values(30,'ȫ�浿','��⵵'); -- unique null ���

select * from temp8;

insert into temp8(id,name,addr)
values(40,'����','����');
--unique �ɼ��� null �� �ߺ��� üũ���� �ʴ´�.

--not null �ϰ������--jumin nvarchar2(6) not null constraint uk_temp8_jumin unique,


-- ���̺� ���� �Ŀ� ���� �ɱ� (��õ)
create table temp9(id number);
-- ���� ���̺� ���� �߰��ϱ� (��κ��� ���� �� ���_)
alter table temp9
add constraint pk_temp9_id primary key(id);

select * from user_constraints where lower(table_name)='temp9';


create table temp9(id number, num number);

--alter table temp9
--add constraint pk_temp9_id primary key(id,num); --����Ű
-- ������ �Ѱ��� row    >> where id = 100 and num =1; (����Ű -�⺻Ű)


--�÷� �߰�
alter table temp9
add ename varchar2(50);

desc temp9;

--ename column �� not null�� �߰�

alter table temp9
modify(ename not null);

--------------------------------------------------------------
--check ���� (���� ��Ģ where ������ ���� �� ó��)
--where gender in ('��','��') 

create table temp10(
    id number constraint pk_temp10_id primary key,
    name varchar2(20) not null,
    jumin char(6) not null constraint uk_temp10_jumin unique,
    addr varchar2(30),
    age number constraint ck_temp10_age check(age >= 19) -- where age >= 19
);

select * from user_constraints where table_name = 'TEMP10';

insert into temp10(id,name,jumin,addr,age)
values(100,'ȫ�浿','123456','����� ������',20);

select * from temp10;

insert into temp10(id,name,jumin,addr,age)
values(200,'�ƹ���','123666','����� ������',18); -- ORA-02290: check constraint (KOSA.CK_TEMP10_AGE) violated check���� ����
commit;

----------------------------------------------------------------------------------------------------------
-- FOREIGN KEY(FK) : ���� ������ �� ������ �ܷ�Ű ���踦 �����ϰ� �����մϴ�.
-- �������� (���̺�� ���̺���� ���� ����)

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
--c_emp ���̺� �ִ� deptno �÷��� �����ʹ� c_dept ���̺� �ִ� deptno �÷��� �ִ� �����͸� ���ڴ�.

-- ����(FK)

--c_dept �� �⺻Ű�� ������ ���� �ʴ�. (PK, UNIQUE)..
--alter table c_emp
--add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);

alter table c_dept
add constraint pk_c_dept_deptno primary key(deptno);


alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);


select * from user_constraints where table_name = 'C_DEPT';
select * from user_constraints where table_name = 'C_EMP';

-- �μ�
insert into c_dept(deptno,dname) values(100,'�λ���');
insert into c_dept(deptno,dname) values(200,'������');
insert into c_dept(deptno,dname) values(300,'ȸ����');
commit;

select * from c_dept;

--���Ի�� �Ի�
insert into c_emp(empno,ename,deptno)
values (1,'������',100);

select * from c_emp;

insert into c_emp(empno,ename,deptno)
values (2,'������',101); --FK ���� ���� : violated - parent key not found �����ϴ� table�� ���� ����.

commit;
----------------------------------------------------------------------------------

--���� END -----------------------------------------------------------------------

insert into c_emp(empno,ename,deptno)
values (1,'������',100);

----------------------------------------------------------------------------------
--- ���� END----------------------
-- ������ �������� FK ���캸��
-- master - detail ����
-- �θ� - �ڽ� ����

-- c_emp �� c_dept (���� FK) >> c_emp(deptno) �÷��� c_dept(deptno) �÷��� ����

--FK ���� : master(c_dept) - detail(c_emp) >> ȭ�� (�μ� ���) >> �μ���ȣ Ŭ�� >> ������� ���
--deptno ���� ���� �θ�(c_dept) - �ڽ� (c_emp)

--���� PK������ �ִ� �� (master), FK (detail)


select * from c_dept;

select * from c_emp;

-- 1. �� ��ȭ���� c_emp ���̺� �ִ�  �����̸� ������ �� �������?
delete from c_dept where deptno =100; -- �����ǰ� �ִ� ���� ���� �� �� ����.
delete from c_emp where empno=100;

delete from c_dept where deptno =200; 

-- �θ� �����ϰ� ���� �� ���� ������� �����ϰ� �θ� �����ϸ� �ȴ�.

/*

column datatype [CONSTRAINT constraint_name]
 REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE])
 
ON DELETE CASCADE �θ� ���̺�� ������ ���� �ϰڴ�.

alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno) ON DELETE CASCADE;

delete from c_emp where empno =1 >> deptno >> 100��

delete from c_dept where deptno =100; -- �����ǰ� �ֱ� ������ �Ұ�
ON DELETE CASCADE �ɸ� �����ȴ�.

�θ���� >> �����ϰ� �ִ� �ڽĵ����͵� ���� �����ȴ�.

MS-SQL
ON DELETE CASCADE
ON UPDATE CASCADE (oracle���� ����)
-- �θ� ������ �߻��ϸ� �����ϰ� �ִ� �ڽĿ��� ��������� �߻��Ѵ�.


--���� ���̺� ,���� �÷���
-- �л� ���� ���̺�
-- �й��� �⺻Ű
-- �̸� not null
--��
--��
--�� Null ���� ����Ÿ��


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
insert into s_dept(deptno, dname) values ( 100,'�İ�');
insert into s_dept(deptno, dname) values ( 200,'����');
insert into s_dept(deptno, dname) values ( 300,'����');

insert into grade(stdnum, name ,korean,english, math,dcode) values (1,'ȫ�浿',90,80,70,200);
insert into grade(stdnum, name ,korean,english, math,dcode) values (2,'������',60,60,70,100);
insert into grade(stdnum, name ,korean,english, math,dcode) values (3,'������',90,90,30,300);


select g.stdnum, g.name, g.sumnum, g.avgnum, g.dcode, s.dname
from grade g join s_dept s
on g.dcode = s.deptno;

 --�μ� ���̺� ����
create table s_dept(
    deptno number constraint pk_s_dept_deptid primary key,
    dname nvarchar2(50) not null
);
 -- ���� ���̺� ����
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

-- ���2
create table grade(
  s_number number ,
  s_name varchar2(20) not null,
  k_score number default 0,
  e_score number default 0,
  m_score number default 0,
  m_code number ,
  avg_score number GENERATED always as (round((k_score + e_score + m_score)/3,2)) VIRTUAL,
  sum_score number GENERATED always as (k_score + e_score + m_score) VIRTUAL,
  
  constraint pk_grade_snum primary key(s_number), --����Ű
  constraint fk_grade_mcode foreign key(m_code) references major(m_code) 
  --���߿� �ɰų� (���̺� ���� �Ŀ�)
);
 

--FK ����
alter table grade
add constraint fk_grade_dcode foreign key(dcode) references s_dept(deptno);

alter table grade
modify (avgnum number GENERATED ALWAYS as ( trunc(((korean+english+math)/3),0) ) VIRTUAL);


-- �μ����̺� �����Է�
insert into s_dept(deptno, dname) values ( 100,'���к�');
insert into s_dept(deptno, dname) values ( 200,'����');
insert into s_dept(deptno, dname) values ( 300,'����');

-- ���� ���̺� �����Է�
insert into grade(stdnum, name ,korean,english, math,dcode) values (1,'ȫ�浿',90,80,70,200);
insert into grade(stdnum, name ,korean,english, math,dcode) values (2,'������',60,60,70,100);
insert into grade(stdnum, name ,korean,english, math,dcode) values (3,'������',90,90,30,300);


--���
select g.stdnum as �й� , g.name as �̸�, g.sumnum as ����, g.avgnum as ���, g.dcode as �а��ڵ�, s.dname as �а���
from grade g join s_dept s
on g.dcode = s.deptno;


--------------------------------------------------------------------------------------------
-- �ʱް����� ��------------------------------------------------------------------------------

-- 12�� VIEW (���߱�)

-- ���� ���̺� (subquery >> in line view >> from ())
-- �ʿ��� �������̺� ��ü���·� �����

/*
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
AS Subquery 
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY]

OR REPLACE �̹� �����Ѵٸ� �ٽ� �����Ѵ�.
FORCE Base Table ������ ������� VIEW �� �����.
NOFORCE �⺻ ���̺��� ������ ��쿡�� VIEW �� �����Ѵ�.
view_name VIEW �� �̸�
Alias Subquery �� ���� ���õ� ���� ���� Column ���� �ȴ�.
Subquery SELECT ������ ����Ѵ�.
WITH CHECK OPTION VIEW �� ���� �׼��� �� �� �ִ� �ุ�� �Է�,���ŵ� �� �ִ�. 
Constraint CHECK OPTON ���� ���ǿ� ���� ������ �̸��̴�.
WITH READ ONLY �� VIEW ���� DML �� ����� �� ���� �Ѵ�.

*/

create view view001
as
 select * from emp; --view�� ����� ������ ��� ���� �߻�
 

--GRANT CREATE ANY VIEW TO "KOSA" WITH ADMIN OPTION;

--VIEW001 �̶�� ��ü�� �����Ǿ���.
--(�������̺� >>���� ������ ������ �ִ� ��ü)**
--�� ��ü�� ���̺�ó�� ����� �� �ִ� ��ü

select *from view001;

select * from view001 where deptno=20;

--VIEW (���� ���̺�)
--���� : �Ϲ� ���̺�� ���� (select, insert, update, delete) �� �� �ִ�.
-- ��, VIEW �� �� �� �ִ� �����Ϳ� ���ؼ���
-- VIEW�� ���ؼ� ���� ���̺� insert, update, delete(DML) ������ ������ ������� ����.

--VIEW ����
--1. �������� ���� : join, subquery ������ ���� �̸� �����صξ��ٰ� ���
--2. ������ �ܼ�ȭ : view�����ؼ� JOIN ����
--3. DBA ���� : �������̺��� �������� �ʰ�, view ���� ����(Ư�� �÷��� �������� �ʴ´�.)

create or replace view v_001
as 
    select empno , ename from emp;

select * from v_001;


create or replace view v_emp
as
    select empno, ename, job ,hiredate from emp;
    
select * from v_emp;

select * from v_emp where job ='CLERK';

--����
create or replace view v_002
as
    select e.empno, e.ename, e.deptno, d.dname
    from emp e join dept d
    on e.deptno = d.deptno;

select *from v_002;


-- subquery�� view�� ���� �������� �����ϰ� ���� �� �ִ�.
-- ��ü�� drop ���� ������ ������.............

/*

view ���� ���̺�(����) / view(���ؼ�) view�� (�����ִ�) �����Ϳ� ���ؼ�
DML ( insert, update, delete) ����.. (����x)


create or replace view v_emp
as
 select empno, ename, job, hiredate from emp;
*/

select* from v_emp;

update v_emp
set sal = 0; <- view �� ���� ���� ������

update v_emp
set job='IT';

-- �����δ� ���� emp ���̺� ������ ������Ʈ
select * from emp;
select * from v_emp;

rollback;

--30�� �μ� ������� ����



create or replace view v_0004
as
 select e.job as ����, e.ename as ����̸�, e.sal as ALIAS
from emp e
where deptno =30 and sal > 300;

select * from v_0004;



-- �μ��� ��տ����� ��� view�� �����, ��տ����� 2000 �̻���
-- �μ���
create or replace view vvvvv
as
    select deptno as �μ���ȣ, avg(sal) as avgasl
    from emp
    group by deptno
    having avg(sal)>= 2000;

select * from vvvvv;

select * from employees;

select * from departments;


select * from locations;

--------------------------------------------------------------------------
--���������
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


SELECT l.COUNTRY_ID as �����̸� , d.DEPARTMENT_ID as �μ��� ,(SELECT e.FIRST_NAME  FROM EMPLOYEES e JOIN DEPARTMENTS d2 ON e.DEPARTMENT_ID = d2.DEPARTMENT_ID WHERE d.DEPARTMENT_ID=e.DEPARTMENT_ID)as �̸�
FROM LOCATIONS l JOIN DEPARTMENTS d  ON d.LOCATION_ID  = l.LOCATION_ID
				 JOIN (select l.COUNTRY_ID AS cid , trunc(avg(salary),0) AS avgsalofc
	  				from departments d join employees e on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    			    JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID  
	  				GROUP BY l.COUNTRY_ID) c2
	  				ON l.country_id = c2.cid
WHERE avgsalofc = (SELECT max(avgsalofc) FROM vv1);

---------- �߰�----------
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
--------------------------���� ����� ��----------------------------------------



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
1.1 SEQUENCE Ư¡ 
1) �ڵ������� ���� ��ȣ�� �����մϴ�.
2) ���� ������ ��ü (���̺���)
3) �ַ� �⺻ Ű ���� �����ϱ� ���� ���˴ϴ�.
4) ���ø����̼� �ڵ带 ��ü�մϴ�. (������ ���� �ʿ䰡 ����)
5) �޸𸮿� CACHE �Ǹ� SEQUENCE ���� �׼��� �ϴ� ȿ������ ����ŵ�ϴ�.

CREATE SEQUENCE sequence_name
[INCREMENT BY n]
[START WITH n]
[{MAXVALUE n | NOMAXVALUE}]
[{MINVALUE n | NOMINVALUE}]
[{CYCLE | NOCYCLE}]
[{CACHE | NOCACHE}];

sequence_name SEQUENCE �� �̸��Դϴ�.

INCREMENT BY n ���� ���� n ���� SEQUENCE ��ȣ ������ ������ ����.
�� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
START WITH n �����ϱ� ���� ù��° SEQUENCE �� ����.
�� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
MAXVALUE n SEQUENCE �� ������ �� �ִ� �ִ� ���� ����.
NOMAXVALUE ���������� 10^27 �ִ밪�� ����������-1 �� �ּҰ��� ����.
MINVALUE n �ּ� SEQUENCE ���� ����.
NOMINVALUE ���������� 1 �� ����������-(10^26)�� �ּҰ��� ����.
CYCLE | NOCYCLE �ִ� �Ǵ� �ּҰ��� ������ �Ŀ� ��� ���� ������ ���� ���θ�
����. NOCYCLE �� ����Ʈ.
CACHE | NOCACHE �󸶳� ���� ���� �޸𸮿� ����Ŭ ������ �̸� �Ҵ��ϰ� ����
�ϴ°��� ����. ����Ʈ�� ����Ŭ ������ 20 �� CACHE
*/


desc board;

drop table board;

create table board(
    boardid number constraint pk_board_boardid primary key,
    title nvarchar2(50)
);

select * from user_constraints where table_name='BOARD';

--not null, unique, index(�˻��ӵ�)

insert into board(boardid, title) values(1,'ó����');
insert into board(boardid, title) values(2,'�ι�°');

rollback;
select * from board;

-- ó�� ���� ���� �۹�ȣ�� 1�� .. �� �ٿ�� �������� ������ 2��,3�� ,....
select count(boardid) +1 from board;

insert into board(boardid, title) values ((select count(boardid) +1 from board) , '����');

insert into board(boardid, title) values ((select count(boardid) +1 from board) , '����2');
insert into board(boardid, title) values ((select count(boardid) +1 from board) , '����3');

select * from board;

--�Խñ� ����, ������ ���

--�Խñ� ����
commit;

delete from board where boardid=1;

select * from board;

commit;

insert into board(boardid, title) values ((select count(boardid) +1 from board) , '����'); -- �ߺ����� �߻�

--�����Ͱ� �����Ǿ �������� ����

insert into board(boardid, title) 
values ((select nvl(max(boardid),0) +1 from board) , '����');

select * from board;

--������ �����ϱ� (���� �����) : ��ü(create ....) : �������� ��ȣ�� �����ϴ�  ��ü
create sequence board_num;
--����
select board_num.nextval from dual; --ä��(��ȣǥ �̱�)

select board_num.currval from dual;

--����(��ü) >> �ϳ��� ���̺��� �ƴ϶� �������� ���̺��� ���

--A���̺�,                         B���̺� 
--(insert >>1)                    insert>>2, insert >>3
--(insert >>4)

create table kboard(
    num number constraint pk_kboard_num primary key,
    title nvarchar2(20)
);

create sequence kboard_num;

insert into kboard(num, title) values (kboard_num.nextval,'ó��');
insert into kboard(num, title) values (kboard_num.nextval,'�ι���');
insert into kboard(num, title) values (kboard_num.nextval,'����°');

select * from kboard;

--------------------------------------------------------------------------------
/*
-- �Խ���
-- ��������, �����Խ���, �亯���Խ��� ....

�������� 1,2,3 (��������ü1)

�����Խ��� 1,2,3 (��������ü2)

�亯���Խ��� 1,2,3 (��������ü3) --�ּ� 3��
--------------------------------------------
�������� 1, 6

�����Խ��� 2, 3

�亯�� �Խ��� 4, 5

������ ��ü 1�� - 3���� ���̺��� ��� (������ü)

TIP)
sequence ��� DB�� ... ���� ������? (mysql, oracle , mariadb , mssql ���)
����Ŭ (o)
ms-SQL (2012���� (sequence))
my-sql (x)
maria db (o) --����(mysql)
postgreSQL (o)

--������ ����(���̺� ��������)
Ms-sql
create table board(
    boardnum int identity(1,1)....
    title....
)
insert into board(title) values('����'); >> boardnum >> 1�� �ڵ�

my-sql
create table board (boardnum int auto_increment, .... tile);

insert into board(title) values('����'); >> boardnum >> 1�� �ڵ�

*/

-- �ɼ�
create sequence seq_num
start with 10 
increment by 2;

select seq_num.nextval from dual;

select seq_num.currval from dual;


--���� 
---�Խ��� ���� ó�� , �����͸� ������ ��
-- ������
--num > 1, 2, 3 ,,,,,, 10 ,,,,, 10000
--���� ���߿� �� �� (�ֽű�)
--select * from board order by num desc;

--rownum : �ǻ��÷� : ���� ���������� �����ϴ� �÷��� �ƴϰ� ���� ���� (
-- create �� ���� ������� ������ select �� ���� ����� �� �ִ� column
-- ������ ���̺� �������� ������ ���������� �� ��ȣ�� �ο��ϴ� �÷�

select * from emp;

select rownum , empno , ename, sal from emp;


select  empno , ename , sal
from emp
order by sal; 
-- select�� order by ���� ���� ����Ǳ� ������ rownum�� ��ȣ�� �Ƹ���� ������ �ʴ´�.

--�޿��� ���� �޴� ������ ���ĵ� ������ + rownum >> ������ ����
select rownum, e.empno, e.ename, e.sal
from (
        select  empno , ename , sal
        from emp
        order by sal desc --������ ���� 
      ) e;

--�޿��� ���� �޴� ��� 5��

select *
from  (
        select rownum as num, e.*
        from (
            select  empno , ename , sal
            from emp
            order by sal desc --������ ���� 
        ) e
       ) n 
where num <= 5;
--��뷮 �����Ϳ��� ����¡ ���� (TODAY POINT)


--between A and B -- ����¡ ó�� ����
----------------------------------------



--rownum�� ����� ���� ���ϴ� select�� ����� �����Ŀ� select�� ����

--TOP-n ���� (������ �Ǵ� ������ ������ ���� ��Ű�� ���� n���� ������ ����)
--MS-SQL : select top 10 , * from emp order by sal desc;

--Oracle ���� Top-n�� ����  / ��� rownum ���ִ�.
--rownum (�����ο� .... ���� n)
-- 1. ������ ���� �����ϱ� (����)
-- 2. ���ĵ� ���ؿ� rownum ���̰� ... ������ ����

      
-------------------------------------------------------------------------------------
-- ��� (10���� ~ 1���)
-- �Խ��� (�Խñ� 10����)
--select * from board >> 10���� ��ȸ ..... >> 10�Ǹ� ��ȸ
-- 10������ ����� Ȯ�� (10,20..��)

/*
totaldata = 100��
pagesize =10 > �� ȭ�鿡 �������� ������ row �� : 10��

page ���� >> 10�� 
[1][2][3][4][5][6][7][8][9][10] 

1page Ŭ�� >> 1~10�� ���� �� : DB ���� : select num between 1 and 10
<a href='page.jsp?page=1'></a>

2page Ŭ�� >> 1~10�� ���� �� : DB ���� : select num between 11 and 20

��� 
1. rownum
2. between


HR���� �̵�

*/

show user;
select * from employees; --107rjs

-- �����ȣ�� ���� ������ �����ϰ� ������ ���ؼ� .... 41���� 50����

select  *
from employees
order by employe