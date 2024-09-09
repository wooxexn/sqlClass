-- 학생테이블로 조인하여 해당하는 학생의 이름이 조회되도록 하기

select * from student;
select studno , name, deptno1, height from student;

select deptno1, max(height) maxHeight
from student
group by deptno1;



-- 학과이름이 나오도록 학과테이블과 조인하기


select a.deptno1, a.maxHeight, s.name
from (
--학과별 가장 키가 큰 학생 조회하기
select deptno1, max(height) maxHeight
from student
group by deptno1
)a
join student s
on a.deptno1 = s.deptno1 and a.maxHeight = s.height
join department d
on d.deptno = s.deptno1;


--4번
--1) 학년별 평균키 구하기
--2) 학생들에서 학년별 평균키보다 큰 학생 조회
select * from student;

select grade , height from student;

select grade , avg(height)
from student
group by grade;

--위의 쿼리 (인라인서브쿼리)로 만들어서 student 테이블과 조인해서 결과를 만들어야 한다
select *
from (
select grade , avg(height) avgHeight
from student
group by grade
) a
join student s
on a.grade = s.grade and s.height > a.avgHeight;


select s.grade , s.name, s.height, a.avgHeight
from (
select grade , avg(height) avgHeight
from student
group by grade
) a
join student s
on a.grade = s.grade and s.height > a.avgHeight;




  