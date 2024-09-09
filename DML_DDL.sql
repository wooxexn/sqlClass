
CREATE TABLE MEMBER2 (
id varchar2(7),
name varchar2(10)
);

select * from MEMBER2;
--crud

--insert (c : create) 삽입(추가)
--수서대로 입력한다
--개수일치
insert into member2 values('test01', 'test');

--순서, 개수 정할 수 있다
insert into member2 (id, name) values('test02', 'test');
insert into member2(id) values('test03');

commit;

--update (변경)
--update (where 절 주의!!, where절이 없으면 모든 고객의 이름을 홍길동으로 변경됨) 
update member2
set name = '홍길동'
where id='test01';

commit;
select * from member2;

--delete (삭제)
--주의사항 !!  where절에서 삭제할 항목을 명시해야 함
delete
from member2
where id = 'test03';
commit;

--쿼리의 결과를 테이블에 insert하기
--컬럼개수, type이 일치해야 한다.


--기존테이블을 사용하여 테이블 만들기( 테이블 복사)
--테이블의 구조만 복사 (내용없이)
create table professor3
as
select * from professor
where 1=2;

select * from professor3;


insert into professor3
select * from professor;


--DDL
select * from member2;
desc member2;

--컬럼 추가
alter table member2 add (addr varchar2(50) );  -- 글자 자리수 : 한글:3byte 한글:3자리 

--컬럼 수정
alter table member2 modify id varchar2(50);

--컬럼 이름 변경
alter table member2 rename column id to userid;

--컬럼 삭제
alter table member2 drop column addr;


--테이블 삭제 (완전삭제)
drop table member2;

--테이블 삭제 (구조만 남기고 삭제)
truncate table member2;




create table t3(
  no number(5) ,
  name varchar2(10) ,
  deptno varchar2(4)
);


select * from t3;


insert into  t3 values( 1,'AAA', '10');
insert into  t3 values( 2,'BBB', '20');
insert into  t3 values( 3,'CCC', '30');
commit;

--테이블 복사
create table t33
as 
select * from t3;

select * from t33;

--테이블 복사하기 내용없이 ( 무조건 false가 나오는 조건절 추가)

create table t333
as
select  * from t3 
where  1=2;

select * from t333;

--임시테이블 만들고 사용하기

create GLOBAL TEMPORARY table temp01
(
no number(5),
name varchar2(10)
) on commit delete rows;


insert into temp01 values (1, 'test1');
commit;

select * from temp01;



create table cc(
id varchar2(10),
writeday date
);

insert into cc values('t1', '2024-09-09');
insert into cc(id) values('t2');
commit;
select * from cc;


--테이블생성시 입력되지 않으면 null로 채워짐
--입력되지 않으면 기본값으로 저장되도록 하는 기능 default 설정
drop table cc2;

create table cc2(
id varchar2(10),
writeday date default sysdate
);

insert into cc2 values('t1', '2024-09-09');
insert into cc2(id) values('t2');
commit;
select * from cc2;














