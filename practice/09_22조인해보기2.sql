
SELECT * FROM info;
SELECT * FROM auth;


---- �̳� ���� inner join a on a.id = b.id(���� ��)
SELECT
    title, content, name, a.auth_id
FROM info i
INNER JOIN auth a -- join(inner join) = ����Ʈ�� �̳������̴�.
ON i.auth_id = a.auth_id
WHERE a.name = '�̼���';

