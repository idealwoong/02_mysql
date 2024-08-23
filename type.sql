-- SQL 형변환
-- 명시적 형변환과 암시적 형변환이 있다

-- 명시적 형변화

-- case
-- convert

SELECT AVG(menu_Price) from tbl_menu;
select 
cast(avg(MEnu_price) as signed integer) as "평균메뉴가격" 
fROM tbl_menu;

SELECT 
Convert(AVG(menu_price), signed integer) as "평균메뉴가격"
From tbl_menu;

-- 가능한 데이터 형식
-- binary, char, date, datetime, decimal, json, time, integer

Select 
cast("2023$5$30" as date),
cast("2023/5/30" as date),
cast("2023%5%30" as date),
cast("2023@5@30" as date);

-- 메뉴가격구하기
SELECT
 concat(CAST(menu_price as char(5)), "원")
 from
 tbl_menu;
 
 
-- 카테고리 별로 메뉴 가격의 합계를 구해서
-- (카테고리 코드 ~~원) 으로 표시해주세요as

SELECT
	category_code,
    concat(CASt(sum(menu_price) as char(5)), "원") as "가격합계"
  FROM tbl_menu
GROUP BY category_code;

-- 암시적 형변환
-- 잗ㅇ으로 내부에서 이루어지는형변환
SeLECT '1'+'2';-- 각 문자가 정수로 변환됨.
SELECT concat(Menu_Price, "원") from tbl_menu; -- 문자로 변환
SELECT 3 > "text"; -- 문자는 0으로 인식
Select 3 > "4text"; -- 숫자가 앞에 있으면 앞에있는 숫자로 인식 , 문자로 시작 하면 0으로 취급

-- 1:true 0: false

