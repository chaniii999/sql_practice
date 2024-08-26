
SELECT * FROM info;
SELECT * FROM auth;


---- 이너 조인 inner join a on a.id = b.id(조건 행)
SELECT
    title, content, name, a.auth_id
FROM info i
INNER JOIN auth a -- join(inner join) = 디폴트가 이너조인이다.
ON i.auth_id = a.auth_id
WHERE a.name = '이순신';

