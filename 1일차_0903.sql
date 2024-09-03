--내림차순
select *
from emp
order by sal desc;

--오름차순
select *
from emp
order by sal;

select *
from emp
order by jop;

--여러개의 정렬기준을 줄 수 있다.
select *
from emp
order by job, sal desc;


--정렬시 컬럼의 순번을 사용할 수 있다.
select empno, ename, job
from emp;