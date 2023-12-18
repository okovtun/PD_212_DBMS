SELECT	
	Students.last_name		AS 'Фамилия', 
	Students.first_name		AS 'Имя', 
	Students.middle_name	AS 'Отчество', 
	Groups.group_name		AS 'Группа'
--	Directions.direction_name AS 'Направление'
FROM	
	Students, Groups, Directions
WHERE	
	Students.[group] = Groups.group_id
--AND		Groups.group_name = 'PD_212';
AND	Groups.direction = Directions.direction_id
--AND Directions.direction_name = 'java development';
AND Directions.direction_name = 'Разработка программного обеспечения'