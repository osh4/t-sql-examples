DECLARE @date_start datetime = '20130101'

;with l0(x) as (select 0 union all select 0),
l1(x) as (select 0 from l0 l,l0),
l2(x) as (select 0 from l1 l,l1),
l3(x) as (select 0 from l2 l,l2),
l4(x) as (select 0 from l3 l,l3),
l (x) as (select ROW_NUMBER() over(order by l.x) N from l4 l,l4)
select top(365*3) x
		,(@date_start + cast(x-1 as datetime)) as 'date'
		, YEAR((@date_start + cast(x-1 as datetime))) as 'year_num'
		, MONTH((@date_start + cast(x-1 as datetime))) as 'month_num'
		, CASE	WHEN MONTH((@date_start + cast(x-1 as datetime))) = 1 THEN N'Январь'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 2 THEN N'Февраль'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 3 THEN N'Март'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 4 THEN N'Апрель'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 5 THEN N'Май'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 6 THEN N'Июнь'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 7 THEN N'Июль'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 8 THEN N'Август'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 9 THEN N'Сентябрь'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 10 THEN N'Октябрь'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 11 THEN N'Ноябвь'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 12 THEN N'Декабрь'
			END as 'month_name'
		, DATEPART(weekday,(@date_start + cast(x-1 as datetime))) as 'dayofweek'
		, CASE	WHEN DATEPART(weekday,(@date_start + cast(x-1 as datetime))) = 1 THEN N'Понедельник'
				WHEN DATEPART(weekday,(@date_start + cast(x-1 as datetime))) = 2 THEN N'Вторник'
				WHEN DATEPART(weekday,(@date_start + cast(x-1 as datetime))) = 3 THEN N'Среда'
				WHEN DATEPART(weekday,(@date_start + cast(x-1 as datetime))) = 4 THEN N'Четверг'
				WHEN DATEPART(weekday,(@date_start + cast(x-1 as datetime))) = 5 THEN N'Пятница'
				WHEN DATEPART(weekday,(@date_start + cast(x-1 as datetime))) = 6 THEN N'Суббота'
				WHEN DATEPART(weekday,(@date_start + cast(x-1 as datetime))) = 7 THEN N'Воскресенье'
			END as 'dayofweek_name'
from l