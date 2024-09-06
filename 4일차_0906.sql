--교재 189

select    deptno ,  job ,  sal 
from emp;



select    deptno ,  job ,   decode( job, 'CLERK' , sal  ,0재)
from emp;

select    deptno ,     decode( job, 'CLERK' , sal  ,0)
from emp;


select      sum(  decode( job, 'CLERK' , sal  ,0))
from emp;


select    deptno ,      sum(  decode( job, 'CLERK' , sal  ,0))
from emp
group by deptno;


select job,  decode( job,  'MANAGER',  sal ,0)
from emp;


select  sum(  decode( job,  'MANAGER',  sal ,0))
from emp;


select deptno  ,  decode(  job, 'MANAGER' ,  sal ,0 )
from emp;


select deptno  ,  sum(decode(  job, 'MANAGER' ,  sal ,0 ))
from emp
group by deptno  ;



select    deptno ,   
 sum( sal)  as  "total" ,
 sum(  decode( job, 'CLERK' , sal  ,0)) as "CLERK" ,
 sum(decode(  job, 'MANAGER' ,  sal ,0 ))  as "MANAGER" ,
 sum(decode(  job, 'PRESIDENT' ,  sal ,0 ))  as "PRESIDENT" ,
 sum(decode(  job, 'ANALYST' ,  sal ,0 ))  "ANALYST",
 sum(decode(  job, 'SALESMAN' ,  sal ,0 )) "SALESMAN"
from emp
group by deptno;





select    deptno ,   
 to_char( sum( sal) , '999,999'  )    as "total" ,
 to_char ( sum(  decode( job, 'CLERK' , sal  ,0))  ,'999,999')    ,
 sum(decode(  job, 'MANAGER' ,  sal ,0 ))   ,
 sum(decode(  job, 'PRESIDENT' ,  sal ,0 ))   ,
 sum(decode(  job, 'ANALYST' ,  sal ,0 ))  ,
 sum(decode(  job, 'SALESMAN' ,  sal ,0 ))  
from emp
group by deptno;




select deptno, job
from emp;


select deptno, job,   decode(   job ,'CLERK', 8) 
from emp;



select    count( decode(   job ,'CLERK', 8) )
from emp;


select   deptno ,   decode(   job ,'CLERK', 8)  
from emp;
 
 
 select   deptno ,  count(  decode(   job ,'CLERK', 8)  )
 from emp
group by deptno;


 select     
   deptno , 
   count(  decode(   job ,'CLERK', 8)  ) ,
   count(  decode(   job ,'MANAGER', 8)  ),
   count(  decode(   job ,'PRESIDENT', 8)  ),
   count(  decode(   job ,'ANALYST', 8)  ),
   count(  decode(   job ,'SALESMAN', 8)  )
 from emp
group by deptno;



-- 부서 직급별 급여 합계
select   deptno , 
sum( decode(job, 'CLERK' ,sal,0))  as "CLERK" ,
sum( decode(job, 'MANAGER' ,sal,0)),  
sum( decode(job, 'PRESIDENT' ,sal,0)),  
sum( decode(job, 'ANALYST' ,sal,0)),  
sum( decode(job, 'SALESMAN' ,sal,0))  
from emp
group by  deptno;


-- pivot 
-- 행, 열, 데이터(사용)


select * from ( select  deptno, job, sal  from emp)
pivot(
    sum(sal)  for job in ('CLERK' as "CLERK" ,  'MNANAGER'  as "MANAGER"  ,  'PRESIDENT' as "PRESIDENT" ,  'ALANYST' as "ANLYST" , 'SALESMAN' as  "SALESMAN")
);



create table pivotTBL as 
select  * from  (  select deptno, job, empno from emp) 
pivot(
  count(empno)  for job  in('CLERK' as "CLERK" ,  'MNANAGER'  as "MANAGER"  ,  'PRESIDENT' as "PRESIDENT" ,  'ALANYST' as "ANLYST" , 'SALESMAN' as  "SALESMAN")
);




select * from pivotTBL;

select * from pivotTBL
UNPIVOT(
 empno for job in ( CLERK, MANAGER, PRESIDENT, ANLYST, SALESMAN)
);



--순위     오름차순, 내림차순 desc
-- rank()   over(기준)            - 1 1 3
-- dense_rank() over ( 기준 )     - 1 1 2

select * from emp;

select ename, sal , rank() over( order by sal desc)
from emp;

select ename, sal, dense_rank() over( order by sal desc )
from emp;

select deptno, ename, sal
from emp;


select deptno, ename, sal , rank() over(partition by deptno order by sal desc)
from emp;


-- row_number()
-- 같은급여라도 순위가 겹치지 않는다  (내부적으로 발생하는  rowid값을 사용하여 정렬함 )
select deptno, ename, sal, rank() over(order by sal desc)
from emp;


select deptno, ename, sal, row_number() over( order by sal desc)
from emp;



-- 198, 199 사용예1 사용예2 사용예3 사용예4 풀어보기
-- 사용예1
select empno, ename, sal, rank() over (order by sal asc) as rank_asc, rank() over (order by sal desc) as rank_desc
from emp;
    
-- 사용예2
select empno, ename, sal, rank() over (partition by deptno order by sal desc) as rank
from emp
where deptno = 10;

-- 사용예3
select empno, ename, sal, deptno, rank() over (partition by deptno order by sal desc) as rank
from emp;

-- 사용예4
select empno, ename, sal, deptno, rank() over (partition by deptno, job order by sal desc) as rank
from emp;


