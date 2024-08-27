-- 테이블 생성과 제약조건
-- : 테이블에 부적절한 데이터가 입력되는 것을 방지하기 위해 규칙을 설정하는 것.

-- 테이블 열레벨 제약조건 (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: 테이블의 고유 식별 컬럼입니다. (주요 키)
-- UNIQUE: 유일한 값을 갖게 하는 컬럼 (중복값 방지)
-- NOT NULL: null을 허용하지 않음. (필수값)
-- FOREIGN KEY: 참조하는 테이블의 PRIMARY KEY를 저장하는 컬럼
-- CHECK: 정의된 형식만 저장되도록 허용.


-- 컬럼 레벨 제약 조건 (컬럼 선언마다 제약조건 지정)
-- constraint 제약조건식별자의 이름
-- 제약조건 식별자는 생략가능 (알아서지음)
create table dept2 (
    dept_no number(2)CONSTRAINT dept2_deptno_pk PRIMAERY KEY,
    dept_name varchar2(14) not null constraint dept2_deptname_uk unique,
    loca NUMVER(4) constraint dept2_loca_locid_fk references locations(location_id),
    dept_bonus number(10) constraint dept2_bonus_ck check(dept_bonus > 10000),
    dept_gender varchar2(1) constraint dept2_gender_ck check(dept_gender in ('m','f'))
};

drop table dept2;

-- 테이블 레벨 제약 조건 : 모든 열 선언 후에 제약 조건 거는 방식
create table dept2 (
    dept_no number(2),
    dept_name varchar2(14) not null,
    loca number(4),
    dept_bonus number(10),
    dept_gender varchar2(1),
    
    CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no), 
    CONSTRAINT dept2_deptname_uk UNIQUE(dept_name),
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
};
-- 외래키 (foreign key) 가 부모테이블(참조테이블)에 없다면 insert 불가능

insert into dept2
values (10, 'gg', 6542,90000, 'm'); -- 6542번 지역은 없음.'

-- 제약조건은 추가, 삭제만 가능







