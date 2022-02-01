--index0
--select * from sys.sysfiles

--show page in table
--DBCC IND('QadatonaV4', 'qad_Articles', 1)

--DBCC traceon(3604)
--DBCC page('QadatonaV4', 'qad_Articles', 1, 4723, 3)

--log file
--DBCC log('QadatonaV4')

----------------------Part2------------------------
use Northwind
go

set statistics io on	
go
------------------------------------
--select * from orders --its very important(bad) logical reads 22, physical reads 1,
-----logical reads 22 page -- پیح های خوانده شده
-----read-ahead reads -- خواندی پیش پیش که دیتاهایی که آینده ممکنه که شما درخواست بدی

----DBCC DROPCLEANBUFFERS --- پاک کردن فضای بافر شده که دوباره باید (آی او) بزند بررسی تعداد درخواست های فیزیکی
--select OrderID,OrderDate from Orders -- its very important logical reads 4, physical reads 1
--------------------------------------
--set statistics time On
--select OrderID, OrderDate from orders
--DBCC DROPCLEANBUFFERS
-------------------------------------
------Execution Plan بررسی 
--select * from Orders
--inner join [Order Details] on Orders.OrderID = [Order Details].OrderID

----------------------Part3------------------------
--جستجو 3 حالت در جدول
--جدول مرتب ن شده 
--چدول مرتب شده
--جدول دارای اندیکس که دیتاهای هر جدول در ایندکس مربوطه است و برای جستجو در ایندکس رفته و زمان صرفه جوی میشود

----------------------Part4------------------------
--لیستی از داده ها که بر اساس موضوع خاص مرتب شده باشد(الفبا، عدد یا ...) را ایندکس میگویند
--دلایل ایندکس:
--سرعت بازیابی رکورد
-- افزایش سرعت عملیات جوین یا پیوند
--اعمال یکتای روی داده
--انواع ایندکس:
--1 Cluster Index -- all data
--2 None CLuster Index -- all data
--3 XML Index -- -- xml data
--4 Special Index -- jeoGeraphy data
--5 Column Store Index -- very Good if use this index table is readonly

----------------------Part5------------------------
--Select * into Orders2 From Orders --make table in query
--Select Count(OrderID) From Orders
--Select Count(OrderID) From Orders2

-----count index
--SP_HELPIndex Orders

--select * from Orders
--select * from Orders2

--select * from Orders where	OrderID= 106
--select * from Orders2 where	OrderID= 106
----------------------Part6------------------------
--B+Tree OR Balanced Tree for IndexStructure
--RootLevel==> MidelLevel==> LeafLevel
--startRoot Tree for search: sysundex
----------------------Part7------------------------
--CulsterIndex:
--select * into Customers2 from Customers
--select * from Customers
--select * from Customers2
--SP_HELPINDEX Customers2
--create clustered index ix_customer2 on Customers2(CustomerID)
--select * from customers2








