--단일행함수


--문자함수
select * from professor;

--lower(), upper()  소문자로, 대문자로 변경해주는 함수

select lower(name), upper(name)
from professor;

-- substr()
-- 문자열의 일부를 추출
-- 시작인덱스 1부터


select substr(name, 1, 3)
from professor;



-- instr() 함수
--문자열에서 특정글자의 위치를 반환함


select instr(name, 'A')
from professor;



--dual : 오라클에서 제공하는 임시테이블 , 함수를 테스트할 때 사용 할 수 있
select instr('A-B-C-D' ,'-' )
from dual;
