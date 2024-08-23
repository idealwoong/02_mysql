-- DDL (Data Definition Language)
-- 데이터베이스의 스키마를 정의 하거나 수정하는데 사용되는 sql의 한 부분이다.
-- 스키마 = 데이터베이스 전체 또는 일부의 논리적인 구조를 표현하는 것.

-- create - 테이블 생성을 위한 구문

-- TB1테이블 생성
create table if not exists tb1(
	-- 컬럼형,자료형 , 제약조건
    pk int primary key,
    fk int,
    col1 varchar(255)
    check(col1 in ('Y','N'))
) engine = innodb;
-- innodb : transaction기능을 제공해 동시성과 무결성을 높이고 복구 기능을 지원해 시스테이 예기치 않게 중단되더라도 데이터의 일관성을 보장한다.
-- MyISAM, NDB Cluster

-- 테이블 구조 확인
Describe TB1;


insert into tb1 values(1,10,'Y');
insert into tb1 values(2,null,'Y');

select*from tb1;

-- Auto_INCREMENT
-- insert 시 Column에 자동으로 번호를 발생시킴 (중복되지 않게)

create table if not exists tb2(
pk int auto_increment primary key,
fk int,
col1 varchar(255)
check(Col1 in ('Y','N'))
)engine = innoDB;

insert into tb2 values(null, 10, 'Y');
insert into tb2 values(null, 20, 'Y');

select * from tb2;

-- Alter
-- 테이블에 추가/변경/수정/삭제 하는 모든 것은 Alter 명령어를 적용한다.
-- 종류가 많아 대표적인 것들만 살펴본다.

-- 열 추가 (테이블에 컬럼 추가)
Alter table Tb2
Add col2 int not null;

describe tb2;

-- column삭제 (테이블에서)
Alter tABLE TB2
Drop Column col2;

Describe tb2;

-- 제약조건 추가 및 삭제
alter table tb2
drop primary key;
-- auto-increment설정되어 있어서 적용 불가
describe tb2;

Alter table tb2
modify pk int;

describe tb2;

-- DROP
-- 테이블을 삭제하기 위한 구문

create table if not exists tb3 (
pk int auto_increment primary key,
fk int,
col1 varchar(255),
check (Col1 in ('Y','N'))
)engine = innodb;

describe tb3;

drop table if exists tb1, tb2;