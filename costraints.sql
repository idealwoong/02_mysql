-- costraints
-- 제약조건,테이블에 테이터가 입력되거나 수정도리 때의 규직을 정의한다.
-- 테이블 작성 시 각 컬럼에 값에 대한 제약조건을 설정할 수 있다.
-- 입력/ 수정하는 데이터에 문제가 없는지 자동으로 검사해 준다.
-- 종류 == Primary key, not null, unique, check, foreign key

-- not null
-- null값을 허용하지 않는 제약 조건
-- 데이터를 입력받을 때 꼭 들어가야 하는 내용.

drop table if exists user_notnull;
create table if not exists user_notnull(
user_no int not null,
User_id varchar(255) not null,
User_PWD varchar(255) not null,
User_name varchar(255) not null,
gender varchar(3),
Phone varchar(255) not null,
Email varchar(255)
)engine=innodb;

insert into user_notnull
(User_no, User_id, user_pwd, User_name, gender, phone, email)
values
(1,"user01","Pass01","홍길동",'남',"010-1234-5678",Null),
(2,"user02","Pass02","유관순",'여',"010-1111-1111","yu@gmail.com");

select * from user_notnull;
insert into user_notnull
(User_no, User_id, user_pwd, User_name, gender, phone, email)
values
(3,"user03","Pass03",null,'ska',"010-5334-5678",Null);


describe user_notnull;



-- Unique
-- 중복값을 허용하지 않는 제약조건

drop table if exists user_unique;
create table if not exists user_unique(
user_no int not null unique,
user_id varchar(255) not null,
user_pwd varchar(255) not null,
user_name varchar(255) not null,
gender varchar(3),
phone varchar(255) not null,
email varchar(255),
unique(phone)
) engine = innodb;

insert into user_unique
(user_no, user_id, user_pwd, user_name,gender,phone,email)
values
(1, "user01","Pass01","홍길동",'남자들',"010-1234-5678",null),
(2, "user02","Pass02","홍동",'여자',"010-2314-5678",null);

select * from user_unique;

describe user_unique;


-- Primary key
-- table에서 한행의 정보를 찾기 위해 사용할 column을 의미한다.
-- table에 대한 식별자 역할을한다 (한행씩 구분하는 역할)
-- Not Null + Unique 제약조건을 가진다.
-- 한table당 한개만 설정할 수 있다.
-- 한개의 column에 설장할 수도 있고, 여러개의 column을 묶어서 설정할 수도 있다(복합 키)

drop table if exists user_primarykey;
create table if not exists user_primarykey(
user_no int,
user_id varchar(255) not null,
user_pwd varchar(255) not null,
user_name varchar(255) not null,
gender varchar(3),
phone varchar(255) not null,
email varchar(255),
unique(phone),
primary key (user_no)
) engine = innodb;

describe user_unique;

insert into user_primarykey
(user_no, user_id, user_pwd, user_name,gender,phone,email)
values
(1, "user01","Pass01","홍길동",'남',"010-1234-5678",null),
(2, "user02","Pass02","유관순",'여',"010-2314-5678",null);

select * from user_primarykey;

describe user_primarykey;



-- foreign key
-- 참조된 다른 table에서 제공하는 값만 사용할 수 있음
-- foreign key 제약조건에 의해 table간의 관계가 형성됨.
-- 제공하는 값 외에는  null을 사용할 수 있음.
-- 설정되어 있는 경우에는 column을 변경하지 못함.

drop table if exists user_grade;
create table if not exists user_grade(
grade_code int not null unique,
grade_name varchar(255) not null
)engine = innodb;

describe user_grade;

insert into user_grade
values
(10, "일반회원"),
(20,"우수회원"),
(30,"특별회원");

select * from user_Grade;

drop table if exists user_foreignkey1;
create table if not exists user_foreignkey1(
user_no int primary key,
user_id varchar(255) not null,
user_pwd varchar(255) not null,
user_name varchar(255) not null,
gender varchar(3),
phone varchar(255) not null,
email varchar(255),
grade_code INT not null,
foreign key (grade_code)
References user_grade (grade_code)
)engine = innodb;

describe user_foreignkey1;

insert into user_foreignkey1
(user_no, user_id, user_pwd, user_name,gender,phone,email,grade_code)
values
(1, "user01","Pass01","홍길동",'남',"010-1234-5678",null,10),
(2, "user02","Pass02","유관순",'여',"010-2314-5678",null,20);

select * 
from user_foreignkey1;

insert into user_foreignkey1
(user_no, user_id, user_pwd, user_name,gender,phone,email,grade_code)
values
(3, "user01","Pass01","홍길동",'남',"010-1234-5678",null,null);

-- Delete, update rule
drop table if exists user_foreignkey2;
create table if not exists user_foreignkey2(
user_no int primary key,
user_id varchar(255) not null,
user_pwd varchar(255) not null,
user_name varchar(255) not null,
gender varchar(3),
phone varchar(255) not null,
email varchar(255),
grade_code INT,
foreign key (grade_code)
References user_grade (grade_code)
	on update cascade
    on delete cascade
)engine = innodb;

describe user_foreignkey2;

insert into user_foreignkey2
(user_no, user_id, user_pwd, user_name,gender,phone,email,grade_code)
values
(1, "user01","Pass01","홍길동",'남',"010-1234-5678",null,10),
(2, "user02","Pass02","유관순",'여',"010-1234-5678",null,20);

select 
* 
from user_foreignkey2;

/*update user_grade
set grade_code = 1
where grade_code=10;*/

Delete from user_grade
where grade_code= 20;




-- check
-- Check 제약조건 위반시 허용하지 않는 제약조건

drop tabel if exists user_check;
create table if not exists user_check(
user_no int auto_increment primary key,
user_name varchar(255) not null,
gender varchar(3) check (gender IN('남','여')),
age int check (age>= 19)
	)Engine=innodb;
    
    insert into user_check
    values
    (null, "홍길동 ","남",25),
    (null, "이순신","여",23);
    
    select *from user_check;
    
      insert into user_check
    values
    (null, "dkswndrms","남",12);
    
-- default
-- column에 null대신 defalult값 적용
-- column 타입이 date일 경우 -currrent_date만 사용가능
-- datetime일 경우 - Current_time, current_timestamp,now() 모두 가능

drop table if exists tbl_country;
create table if not exists tbl_country(
country_code int auto_increment primary key,
country_name varchar(255) default "한국",
population varchar(255) default "0명",
add_Day date default (current_date()),
add_time DATETIME Default (current_time())
)engine =innodb;

insert into tbl_country
values (null,default,default,default,default);

select * from tbl_country;