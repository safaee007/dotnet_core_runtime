
use Northwind
go
--create table Students
--(
-- Code int not null,
-- Firsname nvarchar(50),
-- lastname nvarchar(50)
--)
--SP_HELPINDEX Students

--insert into Students values
--(100, N'سعید', 'صفایی'),
--(101, N'علی', 'تست زاده'),
--(102, N'تست', 'پروان'),
--(103, N'فرید', 'اگبری'),
--(104, N'مسعود', '5صفایی')

--select * from Students
--truncate table students
--create Clustered Index IX_Students_Code On Students(Code)
--insert into Students values(103, N'یاور', N'علیپور')


--DECLARE @counter int=1;
--while @counter <= 1000
--BEGIN
--	insert into Students values(@counter, N'firstname'+CAST(@counter as nvarchar(10)), 'lastname'+CAST(@counter as nvarchar(10)))
--	set @counter = @counter + 1
--END
--GO

--create Unique Clustered Index IX_Students_Code On Students(Code) ایندکس یکتا
--در صورتی که یکتا بودن مهم است انرا اجرا کنید که در زمان  افزودن رکورد جدید یک وقفه برای چک کردن اینکه این داده از قبل نباشد دارد
-------------------------Part2-------------------------
--Non Clustered Index
--non cluster index on heap table is very bad
--non cluster index on cluster inedex it's good

--بررسی وجود جدول و خذف آن
--IF OBJECT_ID('Customers2', 'U') is not null
--	DROP Table Customers2
-----
--select * into Customers2 from Customers
--SP_HELPINDEX Customers2

--روی کلاستر ایندکس Non CLuster Index  ایجاد یک 
--create Clustered index IX_customer2 ON Customers2(CustomerID)
--create NonClustered Index IX_NonNcustomer2 On Customers2(country)
--SP_HELPINDEX Customers2

--select CustomerID,Country,City from Customers2
--	where Country in('Sweden', 'Mexico')

--select CustomerID,Country,City from Customers2 with(INDEX(IX_NonNcustomer2))
--	where Country in('Sweden', 'Mexico')

--استفاده از نان کلاستر اندیکس همپوشان
--create nonCLustered Index IX_NC_Include On Customers2(CustomerID)
--	include(City,Country)

--create nonclustered columnstore index IX_rule ON Customers2(UID,EntityNo,CpNo)

