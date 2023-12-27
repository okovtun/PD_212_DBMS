--DELETE FROM Attendance

SET DATEFIRST 1

SELECT
	[�������]	= FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
	[������]	= Groups.group_name,
	[���� ������]=DATENAME(dw, Schedule.[date]),
	[����]		= Schedule.[date],
	[�����]		= Schedule.[time],
	[�����������]=IIF(Attendance.present=1,'���','��������'),
	[����������]= Disciplines.discipline_name
FROM 
	Attendance, Schedule, Students, Groups, Disciplines
WHERE
	Attendance.student = Students.stud_id
AND Attendance.lesson  = Schedule.lesson_id
AND Schedule.discipline = Disciplines.discipline_id
AND Schedule.[group]  = Groups.group_id
AND Schedule.[date] = '2023-12-11'
AND Schedule.[time] = '14:30'