CREATE TABLE CUST_INFO(
ID VARCHAR2(13) NOT NULL PRIMARY KEY , FIRST_NM VARCHAR2(10) ,
LAST_NM VARCHAR2(10) ,
ANNL_PERF NUMBER(10,2)
); COMMIT;

INSERT INTO CUST_INFO VALUES ('8301111567897' , 'JHUN' , 'KIM', 330.08); 
INSERT INTO CUST_INFO VALUES ('9302112567897' , 'JINYOUNG' , 'LEE', 857.61); 
INSERT INTO CUST_INFO VALUES ('8801111567897' , 'MIJA' , 'HAN', -76.77); 
INSERT INTO CUST_INFO VALUES ('9901111567897' , 'YOUNGJUN' , 'HA', 468.54); 
INSERT INTO CUST_INFO VALUES ('9801112567897' , 'DAYOUNG' , 'SUNG', -890); 
INSERT INTO CUST_INFO VALUES ('9701111567897' , 'HYEJIN' , 'SEO', 47.44);
COMMIT;

--복수형함수  (집계함수)
--sum(), avg(), max(), mix(), count()

select *
from member_tbl_11;

select *
from CUST_INFO;

select id
from CUST_INFO;

select substr(id, 7, 1)
from CUST_INFO;


select decode( substr(id, 7, 1) ,1 ,'남성',2,'여성' ,'이상')
from CUST_INFO;


select id, decode( substr(id, 7, 1) ,1 ,'남성',2,'여성')
from CUST_INFO;


--sum() : 전체행에 대해서 합계를 구함 ( sum에서 null제외시켜줌)
select m_point from member_tbl_11;
select sum(m_point) from member_tbl_11;


--avg() : 전체행에 대해서 평균을 구함 ( null 제외됨)
select avg(m_point) from member_tbl_11;


--max : 전체행에 대해서 가장 큰 값을 구함 (null 제외됨)
select max(m_point)
from member_tbl_11;


--min : 전체행에 대해서 가장 작은 값을 구함 (null 제외됨)
select min(m_point)
from member_tbl_11;


-- count() 함수 : 행의 개수를 구함
-- count(*)
-- count(컬러명) : null을 제외하고 개수를 구함

select m_point
from member_tbl_11;


--null상관없이 행의 개수를 구함
select count(*)
from member_tbl_11;




-- 그룹화하기
-- 고객등급별 포인트금액 합계


select m_point
from member_tbl_11;

--전체합계
select sum(m_point)
from member_tbl_11;

--고객등급별 합계
select m_grade, sum(m_point)
from member_tbl_11
group by m_grade;



select m_grade, sum(m_point)
from member_tbl_11
group by m_grade;



--그룹화된 결과내에서 조건에 맞는 행에 추출하고 싶을 때
--heving 사용하기
--having절은 반드시 group by 된 경우만 사용가능

select m_grade, sum(m_point)
from member_tbl_11
group by m_grade
having sum(m_point) >= 5000;

--등급별 포인트금액 구하기
select m_grade, sum(m_point) as amt
from member_tbl_11
group by m_grade;



--등급별 포인트금액 구하기 ( 5000점 이상인것만 조회하기)  !! 별칭을 사용할 때 주의하기 !! 별칭을 준 이후 부터 사용가능하다
--select m_grade, sum(m_point) as amt
--from member_tbl_11
--group by m_grade
--having amt >= 5000;    --별칭 (amt) 사용해서 조건을 주는것을 시도 !!


--select 쿼리에서 (조회쿼리에 실행의 순서가 있다. !)



select m_grade, sum(m_point) as mat
from member_tbl_11
group by m_grade
having sum(m_point) >= 5000;


-- 정렬하기 
select m_grade, sum(m_point) as amt
from member_tbl_11
group by m_grade
having sum(m_point) >= 5000
order by amt desc;


--정렬시네 컬럼명, 별칭, 조회순번 사용 가능 
select m_grade, sum(m_point) as amt
from member_tbl_11
group by m_grade
having sum(m_point) >= 5000
order by 2;


--1) emp테이블 사용해서 부서별 급여의 평균을 구하시오
select deptno, avg(sal)
from emp
group by deptno;

--2) 1번 문제에서 평균 급여가 2000이상인것만 구하시오
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000;














