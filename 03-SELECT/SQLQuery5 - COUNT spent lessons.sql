USE PD_212
SELECT 
	[����������]			= Disciplines.discipline_name,
	[���������� �������]	= COUNT(ALL discipline),
	[���������� ����������� �������] = SUM(CASE WHEN spent=1 THEN 1 ELSE 0 END),
	[���������� ��������������� �������] = SUM(CASE WHEN spent=1 THEN 0 ELSE 1 END)
FROM	Schedule, Disciplines
WHERE
	Schedule.discipline = Disciplines.discipline_id
GROUP BY Disciplines.discipline_name