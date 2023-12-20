SELECT	
	Students.last_name		AS '�������', 
	Students.first_name		AS '���', 
	Students.middle_name	AS '��������', 
	DATEDIFF(hour, Students.birth_date, GETDATE())/8766 AS '�������',
	--GETDATE() - CONVERT(datetime, Students.birth_date) AS '�������',
	Groups.group_name		AS '������'
--	Directions.direction_name AS '�����������'
FROM	
	Students, Groups, Directions
WHERE	
	Students.[group] = Groups.group_id
AND		Groups.group_name = 'PD_212'
AND	Groups.direction = Directions.direction_id
--AND Directions.direction_name = 'java development';
AND Directions.direction_name = '���������� ������������ �����������'
ORDER BY
	Students.last_name DESC;
--  ASC  - Ascending (� ������� �����������)
--  DESC - Descending(� ������� ��������)