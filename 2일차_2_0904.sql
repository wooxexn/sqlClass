create table tbl_test_customer(
    id varchar2(20) not null primary key ,
    name varchar2(20) ,
    address varchar2(20),
    tel varchar2(20)
);

create table tbl_test_goods(
  pcode varchar2(20) not null primary key,
  pname varchar(20) ,
  price number(4)
);

create table tbl_test_order(
  ocode varchar2(20) not null primary key,
  odate date,
  id varchar2(20),
 pcode varchar2(20),
 sale_cnt number(6)
);



insert into tbl_test_customer values( 'H001' ,'김도현', '라스베가스', '010-3030-2222');
insert into tbl_test_customer values( 'H002' ,'김무궁', 'L.A', '010-2424-2222');
insert into tbl_test_customer values( 'H003' ,'정보란', '워싱턴D.C', '010-1010-2121');
insert into tbl_test_customer values( 'H004' ,'김세현', '뉴욕', '010-3333-2222');
insert into tbl_test_customer values( 'H005' ,'이효진', '텍사스', '010-9090-2222');
insert into tbl_test_customer values( 'H006' ,'최문길', '서울', '010-7878-1234');


 


insert into tbl_test_goods values('P001' ,'쫀드기', 1000);
insert into tbl_test_goods values('P002' ,'눈깔사탕', 100);
insert into tbl_test_goods values('P003' ,'아폴로', 200);
insert into tbl_test_goods values('P004' ,'뻥튀기', 2000);



insert into tbl_test_order values('J001' , '20210110' , 'H001', 'P001', 2);
insert into tbl_test_order values('J002' , '20210110' , 'H002', 'P002', 5);
insert into tbl_test_order values('J003' , '20210110' , 'H003', 'P003', 2);
insert into tbl_test_order values('J004' , '20210110' , 'H004', 'P004', 1);
insert into tbl_test_order values('J005' , '20210110' , 'H005', 'P002', 3);
insert into tbl_test_order values('J006' , '20210110' , 'H001', 'P002', 3);
insert into tbl_test_order values('J007' , '20210110' , 'H002', 'P001', 1);
insert into tbl_test_order values('J008' , '20210110' , 'H001', 'P002', 4);
insert into tbl_test_order values('J009' , '20210110' , 'H006', 'P002', 4);



// sql  조인 표준 

SELECT  name, address, tel, odate, pname, sale_cnt, price, sale_cnt * price
FROM   tbl_test_order o
JOIN     tbl_test_customer c
ON       o.id = c.id
JOIN     tbl_test_goods g
ON       o.pcode = g.pcode ;




SELECT   *
FROM   tbl_test_order o
JOIN     tbl_test_customer c
ON       o.id = c.id;
 


SELECT   *
FROM   tbl_test_order o
JOIN     tbl_test_customer c
ON       o.id = c.id
JOIN     tbl_test_goods g
ON       o.pcode = g.pcode ;





--주문정보조회하기 
select * from tbl_test_order;
--제품정보가 함께 조회되도록 하기


-- equi조인 (동등조인) : 일치하는 것끼리 조인
select * 
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode;


select o.ocode, g.pname, g.price, o.sale_cnt
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode;


select o.ocode, g.pname, g.price, o.sale_cnt, g.pname, g.price * o.sale_cnt
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode;


select g.pname, g.price * o.sale_cnt
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode;





select g.pname, sum(g.price * o.sale_cnt)
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode
group by g.pname;



select * from tbl_test_customer;
select * from tbl_test_goods;
select * from tbl_test_order;




select * 
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode
join tbl_test_customer c
on o.id = c.id;





select c.name, g.pname, o.sale_cnt, o.odate 
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode
join tbl_test_customer c
on o.id = c.id;

-- 주문정보조회, 고객정보가 포함되도록
select *
from tbl_test_order o
join tbl_test_customer c
on o.id = c.id;



-- 주문정보조회 , 상품정보가 포함되도록
select *
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode;


select o.odate, g.pname, g.price, o.sale_cnt
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode;



-- 주문조회, 상품정보, 고객정보 포함

select *
from tbl_test_order o
join tbl_test_customer c
on o.id = c.id
join tbl_test_goods g
on o.pcode = g.pcode;




select o.odate, c.name, g.pname, o.sale_cnt * g.price
from tbl_test_order o
join tbl_test_customer c
on o.id = c.id
join tbl_test_goods g
on o.pcode = g.pcode;



delete  from tbl_test_order  where id ='H006' ;



-










