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
		, CASE	WHEN MONTH((@date_start + cast(x-1 as datetime))) = 1 THEN N'������'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 2 THEN N'�������'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 3 THEN N'����'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 4 THEN N'������'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 5 THEN N'���'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 6 THEN N'����'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 7 THEN N'����'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 8 THEN N'������'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 9 THEN N'��������'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 10 THEN N'�������'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 11 THEN N'������'
				WHEN MONTH((@date_start + cast(x-1 as datetime))) = 12 THEN N'�������'
			END as 'month_name'
		, DATEPART(weekday,(@date_start + cast(x-1 as datetime))) as 'dayofweek'
		, CASE	WHEN DATEPART(weekday,(@date_start + cast(x-1 as datetime))) = 1 THEN N'�����������'
				WHEN DATEPART(weekday,(@date_start + cast(x-1 as datetime))) = 2 THEN N'�������'
				WHEN DATEPART(weekday,(@date_start + cast(x-1 as datetime))) = 3 THEN N'�����'
				WHEN DATEPART(weekday,(@date_start + cast(x-1 as datetime))) = 4 THEN N'�������'
				WHEN DATEPART(weekday,(@date_start + cast(x-1 as datetime))) = 5 THEN N'�������'
				WHEN DATEPART(weekday,(@date_start + cast(x-1 as datetime))) = 6 THEN N'�������'
				WHEN DATEPART(weekday,(@date_start + cast(x-1 as datetime))) = 7 THEN N'�����������'
			END as 'dayofweek_name'
from l