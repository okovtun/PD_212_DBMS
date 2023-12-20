--INSERT INTO dbo.Schedule VALUES	(1, 1, '2022-12-12', '14:30', 1, 3)
--INSERT INTO dbo.Schedule VALUES	(34, 3, '2022-12-14', '14:30', 1, 3)

--INSERT INTO dbo.Schedule (discipline, teacher, [date], [time], spent, [group])
--VALUES	(1, 1, '2022-12-21', '14:30', 1, 3)

SELECT
	dbo.Disciplines.discipline_name AS '����������',
	dbo.Groups.group_name			AS '������',
	dbo.Schedule.[date]				AS '����',
	dbo.Schedule.[time]				AS '�����',
	dbo.Teachers.last_name + dbo.Teachers.first_name + dbo.Teachers.middle_name AS '�������������'
FROM
	dbo.Schedule, dbo.Groups, dbo.Disciplines, dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.discipline_id
AND	dbo.Schedule.[group]	= dbo.Groups.group_id
AND	dbo.Schedule.teacher	= dbo.Teachers.teacher_id;