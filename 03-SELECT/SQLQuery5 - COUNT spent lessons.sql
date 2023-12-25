USE PD_212
SELECT 
	[Дисциплина]			= Disciplines.discipline_name,
	[Количество занятий]	= COUNT(ALL discipline),
	[Количество проведенных занятий] = SUM(CASE WHEN spent=1 THEN 1 ELSE 0 END),
	[Количество запланированных занятий] = SUM(CASE WHEN spent=1 THEN 0 ELSE 1 END)
FROM	Schedule, Disciplines
WHERE
	Schedule.discipline = Disciplines.discipline_id
GROUP BY Disciplines.discipline_name