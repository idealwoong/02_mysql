-- built in functions

-- ascii

Select Ascii('A');

-- concat comma를 중심으로 이어붙임 / ws 는 제일 처음에 구분자를 지정가능 
select concat("호랑이","기린","토끼");
select concat_WS("ㅂㅂㅂ","호랑이","기린","토끼");

-- ELT 해당 위치의 문자열 반환
Select ELT (2,"사과","딸기","바나나");

-- field : 찾을 문자열 위치 반환
Select field ("딸기","사과","딸기","바나나");

-- format(숫자, 소수점 자릿수)
Select Format (123123123.5646456, 3);

-- 2진수, 8진수, 16진수
Select Bin(65), OCT(65), HEX(65);

-- insert (기존문자열, 위치,길이 ,삽입할 문자열)
Select insert ("내 이름은 홍길덩 입니다",7,3, "유관순");

-- left ,right
select left("hello world!" , 3), right("hello world!", 3);

-- lower, upper

-- trim (공백제거)

-- repeat (문자열, 횟수)
Select repeat ("lol",1000);

-- replace (문자열 찾을문자열, 빠꿀 문자열)
Select Replace("마이 SQL","마이","my");

-- reverse(문자열);
Select reverse("stressed");

-- substring (문자열, 시작위치, 길이)
Select Substring("안녕하세요 반갑습니다",7,2);