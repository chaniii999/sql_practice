/*
- NUMBER(2) -> 정수를 2자리까지 저장할 수 있는 숫자형 타입.
- NUMBER(5, 2) -> 정수부, 실수부를 합친 총 자리수 5자리, 소수점 2자리
- NUMBER -> 괄호를 생략할 시 (38, 0)으로 자동 지정됩니다.
- VARCHAR2(byte) -> 괄호 안에 들어올 문자열의 최대 길이를 지정. (4000byte까지)
- CLOB -> 대용량 텍스트 데이터 타입 (최대 4Gbyte)
- BLOB -> 이진형 대용량 객체 (이미지, 파일 저장 시 사용)
- DATE -> BC 4712년 1월 1일 ~ AD 9999년 12월 31일까지 지정 가능
- 시, 분, 초 지원 가능.
*/


CREATE TABLE dept2 (
    dept_no NUMBER(2),
    dept_name varchar2(14),
    loca varchar2(15),
    dept_Date date,
    dept_bonus number(10)
);

desc dept2;

INSERT INTO dept2
values(10,'영업부','서울',sysdate, 2000000);

INSERT INTO dept2
values(30,'개발','경기',sysdate, 2000000.86);

-- 컬럼(속성)추가
ALTER TABLE dept2
ADD dept_count NUMBER(3);

-- 컬럼명 변경 rename
alter table dept2
rename column dept_count to emp_count;

-- 컬럼 속성 변경 modify
alter table dept2
modify column emp_count VARCHAR2(10); 

select * from dept2;

-- DDL(create, alter ,truncate, drop)
-- 은 트랜잭션의 대상이 아니다.
-- : 롤백 사용불가

-- DML(insert, update, delete)
-- 이후 DDL 실행시 자동 커밋됨


-- 테이블 이름 변경
alter table dept2
rename to dept3;

-- 구조만 남기고 데이터만 전부 삭제
TRUNCATE tavle dept3;

-- 테이블 삭제
drop table dept3;






