--USE PD_212
CREATE PROCEDURE dbo.mysp_addToSchedule
@group_name		NVARCHAR(50),
@disipline		NVARCHAR(50),
@teacher		INT,
@start_date		DATE,
@time			TIME
AS
BEGIN
	DECLARE @discipline_id		SMALLINT = (SELECT PD_212.dbo.Disciplines.discipline_id FROM PD_212.dbo.Disciplines WHERE discipline_name LIKE @disipline)
	DECLARE @teacher_id			INT		 = 1
	DECLARE @group_id			INT		 = (SELECT PD_212.dbo.Groups.group_id FROM PD_212.dbo.Groups WHERE group_name=@group_name)
--	DECLARE @start_date			DATE	 = '2023-06-27'
	DECLARE @date				DATE	 = @start_date
	DECLARE @interval			INT		 = 2
--	DECLARE @time				TIME	 = '18:30'
	DECLARE @number_of_lessons	TINYINT	 = (SELECT PD_212.dbo.Disciplines.number_of_lessons FROM PD_212.dbo.Disciplines WHERE discipline_id = @discipline_id);

	DECLARE @counter			INT		 = 0

	WHILE @counter < @number_of_lessons
	BEGIN
		IF	(
		SELECT COUNT(*) 
		FROM PD_212.dbo.Schedule 
		WHERE [group] = @group_id AND discipline = @discipline_id AND [date] = @date AND [time] = @time
		) = 0
		BEGIN
			INSERT INTO PD_212.dbo.Schedule(discipline, teacher, [date], [time], spent, [group])
			VALUES		(@discipline_id, @teacher_id, @date, @time, IIF(@date < GETDATE(), 1, 0), @group_id);
		END
		SET			@counter = @counter + 1;

		IF	(
		SELECT COUNT(*) 
		FROM PD_212.dbo.Schedule 
		WHERE [group] = @group_id AND discipline = @discipline_id AND [date] = @date AND [time] = DATEADD(mi, 90, CONVERT(TIME, @time))
		) = 0
		BEGIN
			INSERT INTO PD_212.dbo.Schedule(discipline, teacher, [date], [time], spent, [group])
			VALUES				(@discipline_id, @teacher_id, @date, DATEADD(mi, 90, CONVERT(TIME, @time)), IIF(@date < GETDATE(), 1, 0), @group_id);
		END
		SET			@counter = @counter + 1;

	--	SET			@date = @date + @interval
		SET			@date = DATEADD(dd, @interval, @date);
		SET			@interval = IIF(@interval = 2, 5, 2)

	END

	--INSERT INTO dbo.Schedule(discipline, teacher, [date], [time], spent, [group])
	--VALUES					()

	--SELECT
	--	[Группа]	=PD_212.dbo.Groups.group_name,
	--	[Дисциплина]=PD_212.dbo.Disciplines.discipline_name,
	--	[Количество занятий]=COUNT(lesson_id)
	--FROM	PD_212.dbo.Schedule 
	--JOIN	PD_212.dbo.Disciplines	ON discipline=discipline_id
	--JOIN	PD_212.dbo.Groups		ON [group]=group_id
	--GROUP BY PD_212.dbo.Groups.group_name,PD_212.dbo.Disciplines.discipline_name

	--SELECT
	--	PD_212.dbo.Disciplines.discipline_name AS 'Дисциплина',
	--	PD_212.dbo.Groups.group_name AS 'Группа',
	--	PD_212.dbo.Schedule.[date] AS 'Дата',
	--	PD_212.dbo.Schedule.[time] AS 'Время',
	--	PD_212.dbo.Teachers.last_name + PD_212.dbo.Teachers.first_name + PD_212.dbo.Teachers.middle_name AS 'Преподаватель'

	--FROM 
	--	PD_212.dbo.Schedule, 
	--	PD_212.dbo.Groups, 
	--	PD_212.dbo.Disciplines, 
	--	PD_212.dbo.Teachers
	--WHERE
	--	PD_212.dbo.Schedule.discipline =PD_212.dbo.Disciplines.discipline_id
	--AND PD_212.dbo.Schedule.[group] =	PD_212.dbo.Groups.group_id
	--AND PD_212.dbo.Schedule.teacher =	PD_212.dbo.Teachers.teacher_id;

	--SELECT * FROM dbo.Disciplines WHERE discipline_name LIKE '%Java%'
	--SELECT * FROM dbo.Disciplines WHERE CONTAINS(discipline_name, '%Java%');
END