-- transaction
-- 데이터베이스에서 한번에 수행되는 작업의 단위
-- 시작,진행,종료 단계를 가지며, 만약 중간에 오류가 발생하면
-- 롤백을 수행하고 데이터 페이스에 제대로 반영하기 위해서는 커밋을 진행한다

-- commit
/* 
트랜젝션 처리에 사용되는 명령문 중 하나로
여러 sql문을 하나의 트랜젝션으로 그룹화 할 수 있다.
*/

-- rollback
/* 
트랜젝션 처리에 사용되는 명령문 중 하나로
Rollback을 사용하면 트랜젝션 내에서 수행한 면경 사항을 취소하고 이전 상태로
돌릴 수 있다.
*/

-- Auto commit 비활성화
set autocommit = 0;

-- Auto Commit 활성화
set Autocommit = 1;

start transaction;

select * from tbl_menu;
insert into tbl_menu values (null, "바나나해장국", 8500, 4, 'Y');
update tbl_menu set menu_name = "수정됨" where menu_code = 1;
Delete from tbl_menu Where menu_Code = 7;

-- Commit; 하면 반영됨
Rollback;

select * from tbl_menu;