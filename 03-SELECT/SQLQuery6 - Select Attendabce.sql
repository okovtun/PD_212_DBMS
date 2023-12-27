--DELETE FROM Attendance

SET DATEFIRST 1

SELECT
	[Студент]	= FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
	[Группа]	= Groups.group_name,
	[День недели]=DATENAME(dw, Schedule.[date]),
	[Дата]		= Schedule.[date],
	[Время]		= Schedule.[time],
	[Присутствие]=IIF(Attendance.present=1,'Был','Прогулял'),
	[Дисциплина]= Disciplines.discipline_name
FROM 
	Attendance, Schedule, Students, Groups, Disciplines
WHERE
	Attendance.student = Students.stud_id
AND Attendance.lesson  = Schedule.lesson_id
AND Schedule.discipline = Disciplines.discipline_id
AND Schedule.[group]  = Groups.group_id
AND Schedule.[date] = '2023-12-11'
AND Schedule.[time] = '14:30'