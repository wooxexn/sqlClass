--단일행함수

--문자함수

select *
from professor;

--lower, upper  소문자로, 대문자로 변경해주는 함수

select lower(name),upper(name)
from professor;

--substr()
--문자열의 일부를 추출
--시작인덱스 1부터
select  substr(name,1,3)
from professor;

--instr()함수
--문자열에서 특정글자의 위치를 반환함

select instr(name,'a')
from professor;

--dual : 오라클에서 제공하는 임시테이블 ,함수를 테스트 할 때 사용할 수 있음
select instr('A-B-C-D','-' )
from dual;

select name , instr(tel ,')')
from student;

--LPAD()
-- 왼쪽부터 특정문자로 채우는 기능
select lpad(id,10, '-')
from student;

--RPAD()
--오른쪽부터 특정문자로 채우는 기능

select rpad(id,10,'*')
from student;

--replace() 기존의 문자를 새로운 문자로 대체함
select replace(tel , '-','/') from student;

select replace(name,'Ja','**') from student;

select substr(name,1,2) from student;

select replace(name,substr(name,1,2),'**') from student;

--숫자함수

--round()
select round(8782.2358, 2)
from dual;

select trunc(8782.2358, 2)
from dual;

--날짜관련함수 
--현재날짜가져오기
select sysdate from dual;

-- 두 날짜 사이의 개월 수 구하기
select  months_between('05/09/03','04/12/31')
from dual;

--기타함수  NVL()   NVL2()
select ename, comm+100
from emp;

--상여금 인상하는 조회
--null인 경우는 0으로 처리하겠다
select ename, nvl(comm,0)+100
from emp;

--nvl2()
--null아니면
--null이면
select ename,comm, nvl2(comm,comm+500,0)
from emp;

--decode
--01 vvip , 02 vip , 03 bronze
select decode(m_grade,'01','vvip','02','vip','03','bronze') from member_tbl_11;

--case when
select m_name, m_point from member_tbl_11;

select m_name, case when m_point>=3000 then '상'
when m_point>=2000 then '중'
else '하'
end as result
from member_tbl_11;
  