-- DML (Data Manipulation Language)

-- 테이블에 값을 삽입하거나 수정하거나 삭제하는 SQL의 한 부분이다.
-- insert, update, delete, select(dql - data query language)

-- 값을 등록하거나 수정하는 경우 아래의 내용을 주의해야 한다.
-- 1. 데이터 타입
-- 2. 제약 조건

-- insert
-- 새로운 행을 추가하는 구문
-- 테이블의 행의 수가 증가한다.
use menudb;
insert into tbl_menu (

menu_name,
menu_price,
category_code,
orderable_status
) values(

"바나나해장국",
8500,
4,
'Y'
);
-- 순서변경가능 위에랑 매치 필요
select * from tbl_menu;
-- values()순서 변경 불가
insert into tbl_menu values(null,"바나나해장국",8500,4,'Y');


-- 컬럼의 순서를 변경하는 경우 순서에 맞게 값을 넣어주면 된다
insert into tbl_menu(orderable_status, menu_price, menu_name, category_code)
values('Y',5500,"파인애플탕",4);

select * from tbl_menu;

-- insert 안에 서브쿼리 사용가능 (거의 안씀)
insert into tbl_menu values(
null,
"순대국밥",
8500,
(select category_code From tbl_category, where category_name = "한식"),
'y'
);

-- multi insert
insert into
tbl_menu
values
(null, "참치맛아이스크림", 1700, 12 , 'Y'),
(NULL, "멸치맛 아이스크림", 1500,11,'Y'),
(null, "소시지맛 커피",2500,8,'Y');


-- update
-- 테이블에 기록된 컬럼의 값을 수정하는 구문이다.
-- 테이블의 전체 행 갯수는 변화가 없다.

SELECT 
*
from tbl_menu
where menu_name = "바나나해장국";

update tbl_menu
set menu_name = "델몬트바나나"
where menu_name = "바나나해장국";
-- edit --> preference -> sql editor - safe update 체크 해제

select 
*
from tbl_menu
where menu_name = "델몬트바나나";

-- 서브쿼리 활용
-- 여러 컬럼도 한번에 가능
update tbl_menu
set category_code = 6,
menu_name = "맛있는 바나"
where menu_price IN(
Select 
menu_price
From (SELECT * from tbl_menu) AS a
where menu_name = "맛있는 바나나");

select * from tbl_menu;



-- DELETE
-- 테이블의 행을 삭제하는 구문이다
-- 테이플의 행의 갯수가 줄어든다

-- where절을 이용한 단일 행 삭제
DELETE FROM tbl_menu
where menu_name = "맛있는 바나";

select * from tbl_menu;

-- limit를 활용한 행 삭제
DELETE FROM tbl_menu
 ORDER by menu_Code DESC
 limit 2;
 
 -- 테이블의 값을 전체 삭제하는 경우 - 실행하지 않는 것이 좋다.
 -- DElete from tbl_menu;
 
 -- 데이터를 중요하게 관리해야 하기 때문에 
 -- Delete query는 잘 사용하지 않으며
 -- 삭제해야 하는 경우에는 아래와 같이 상태를 업데이트 하는 방식으로 진행한다.
 SELECT
 *
 from tbl_menu
 where orderable_status = 'Y';
 
 update tbl_menu
 set orderable_status = 'n'
 where menu_code = 21;
 
 -- Replace
 -- 이미 존재하고 있다면 Update, 없으면 Insert
 insert into tbl_menu values (26, "참기룸소주", 5000,10,'Y');
 replace into tbl_menu values (25, "참기름 소주", 500, 10, 'Y');
 replace into tbl_menu values (25, "개기름 소주", 5000, 12, 'N');
select * from tbl_menu;
 
 
