create table  acorntbl (
    id  varchar2(10) primary key,
    pw  varchar2(10) ,
    name varchar2(10)
);

insert into acorntbl values('kdhyun', '4482', '김도현');
insert into acorntbl values('kmg','1234', '김무궁');
insert into acorntbl  values('ksjoong' ,'0000' , '김세중');
insert into acorntbl  values('kimsh','6666','김세현');
insert into acorntbl values('ksol', '1127', '김솔');
insert into acorntbl values('kimjs', '0317', '김정석');
insert into acorntbl values('kimcw','9876','김채운');
insert into acorntbl values('backbw', '1111', '백바울'); 
insert into acorntbl values('sbhak', '4482', '소병학');
insert into acorntbl values('sbyoungH','0117','송병화'); 
insert into acorntbl values('ssb','1126','송수빈');
insert into acorntbl values('yjmin','0625','용지민');
insert into acorntbl values('Leesmin','6789','이상민');
insert into acorntbl  values('LeeHjin', '1234', '이효진');
insert into acorntbl values('Jangkho','1234','장경호');
insert into acorntbl values('Junws', '7777', '전우선');
insert into acorntbl values('Junjh', '9999', '전지형');
insert into acorntbl values('Jungbr', '2344', '정보란');
insert into acorntbl values('jooSg', '1009', '주상길');
insert into acorntbl values('jooHJ', '3456', '주형준');
insert into acorntbl values('Choimgil', '9898', '최문길');
insert into acorntbl values('ChoiHj', '5589', '최형진');
insert into acorntbl values('HYJin', '1234', '하예진');
insert into acorntbl values('Hjyoung', '9099', '황지영');
commit;

select * from acorntbl;

--1일차
--데이터 조회하기 SELECT

-- * : 모든 컬럼 조회하기
select * 
from acorntbl;

--원하는 컬럼 조회하기

select id, name from acorntbl;
 
-- 연결하기 
select id || name from acorntbl;

--컬럼 별칭(alias)주기
--조회된 결과의 컬럼이 변경됨 (실제 데이터베이스 테이블의 컬럼이 변경되는 것은 아니다)
select id|| name as name from acorntbl;

select id as userid, name as username from acorntbl;

--별칭에 공백이 있는경우 ""쌍따음표로 감싸야 한다
select id as "user id" , name AS "user name"from acorntbl;

--별칭줄 때 as 생략가능함
select id userid, name username from acorntbl;

--중복된 값을 제거하고 조회하기 distinct
--emp 테이블 사용
select * from emp;

select job from emp;
--12건 데이터 (행, 레코드) 중에서 중복된 것은 제외하고 조회할 수 있다.
select distinct job from emp;

--에이콘 학생명단 조회하기
-- 모든행 (모든 레코드가 조회된다)
select * from acorntbl;

--원하는 조건만 조회하기
-- where 절 사용하기

--김씨 학생조회하기
select *
from acorntbl
where name like '김%';

--조건절에 올 수 있는 연산자
select * from acorntbl where name = '김도현';

--같지않다 !=
select *
from acorntbl
where name != '김도현';

-- > , >= , < , <=
select * from emp;

-- 테이블 명세 확인하기 (테이블스키마)
desc emp;

select ename, job , sal, comm
from emp
where sal >2500;

select ename, job, sal ,comm
from emp
where sal <=2500;

select ename, job, sal, comm
from emp
where sal <1000;

-- between a and b (a에서 b까지, a가 작은 값 b가 큰값)
select * 
from emp
where sal between 1000 and 2000;

--조건이 여러개인 경우 AND ,OR
--데이터베이스에서 문자를 표현할 때는 '     ' 사용
--저장된 데이터내용을 비교할 때는 대소문자 구별함

select *
from emp
where job = 'SALESMAN' and sal >= 1500;

select *
from emp
where job = 'SALESMAN' or sal >=2000;

-- in (a,b,c)
select *
from emp
where job = 'CLERK' or job= 'MANAGER';

select *
from emp
where job in('CLERK' , 'MANAGER');

select *
from emp
where job not in('CLERK' , 'MANAGER');

-- not 조건
select *
from emp
where not sal >2000;

--like 연산자
select *
from acorntbl
where name like '김%';

select *
from acorntbl
where name like '김_';

--김으로 시작하고 뒤에 2자리 정해짐

select *
from acorntbl
where name like '김__';

--null  컬럼의 내용이 입력되지 않은 상태를 의미한 값( 정해지지 않은 것 , 미정의 값 ) , 연산시 주의해야 한다
--null is null, is not null을 통해서 null인지 확인할 수 있다. ( = 연산자를 사용못함)
select *
from emp
where comm is null ;

--상여금에 100만큼 증가된 값으로 조회하기( 기존 데이터가 변경되는 것이 아니라 조회된 결과에만 반영)

select ename, comm + 100 as comm
from emp;

--예상해 보기

--null + 100 => null
--null 값의 의미 : 값이 정해지지 않음을 의미 +100 => 값이 정해지지 않음

--정렬하기
-- 오름차순ㄴ , asc(생략가능)
-- 내림차순 , desc(생략불가능)
select *
from emp
order by sal desc;

--오름차순
select *
from emp
order by sal;

select *
from emp
order by job;

--여러개의 정렬기준을 줄 수 있다.
select *
from emp
order by job , sal desc;

--정렬시 컬럼의 순번을 사용할 수 있다  (조회시 순번)
select empno, ename, job
from emp
order by 2;































 














 

















