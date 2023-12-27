SELECT
	lesson_id,
	discipline_name	AS '����������',
	Groups.group_name AS '������',
	FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name) AS '�������������',
	[date], [time]
FROM
	Schedule, Disciplines, Teachers, Groups
WHERE
	discipline=discipline_id
AND	teacher = teacher_id
AND group_name = 'PD_212'
AND discipline_name LIKE '%MS SQL%'
AND Schedule.spent = 1