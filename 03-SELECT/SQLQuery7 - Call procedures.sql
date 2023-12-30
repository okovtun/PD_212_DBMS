USE PD_212
--DELETE FROM Schedule WHERE [group]=(SELECT group_id FROM Groups WHERE group_name='Java_326')

EXEC mysp_addToSchedule 'Java_326', '%Java', 1, '2023-06-29', '18:30'
EXEC dbo.mysp_SelectFromSchedule