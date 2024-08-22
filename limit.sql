-- LIMIT
-- 결과집합에서 반환할 행의 수를 제한할 수 있다

-- 첨부터 5개
SELECT
	menu_code,
    menu_name,
    menu_price
  FROM tbl_menu
ORDER BY
	menu_price DESC,
    menu_name ASC
LIMIT 5;

-- 처음 1줄 빼고 4개
SELECT
	menu_code,
    menu_name,
    menu_price
  FROM tbl_menu
ORDER BY
	menu_price DESC,
    menu_name ASC
LIMIT 1,4;
