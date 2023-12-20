SELECT 
	dbo.Disciplines.discipline_name AS '����������',
	dbo.Groups.group_name AS '������',
	dbo.Schedule.[date] AS '����',
	dbo.Schedule.[time] AS '�����',
	dbo.Teachers.last_name + dbo.Teachers.first_name + dbo.Teachers.middle_name AS '�������������',
	dbo.Schedule.spent	AS '���������'
FROM 
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teachers.teacher_id;