--Çalışanın Adı, Soyadı, Doğum Tarihini istiyorum
select  pr.FirstName,pr.LastName,hre.BirthDate from Person.Person as pr 
inner join HumanResources.Employee as hre on hre.BusinessEntityID =pr.BusinessEntityID

--Çalışanın Adı, Soyadı, Telefon Numarası, Telefon numarasının tipi istiyorum
select  pr.FirstName,pr.LastName,hre.BirthDate, pp.PhoneNumber,ppt.PhoneNumberTypeID  from Person.Person as pr 
inner join HumanResources.Employee as hre on hre.BusinessEntityID =pr.BusinessEntityID
inner join Person.PersonPhone as pp on  pp.PhoneNumberTypeID=hre.BusinessEntityID
inner join Person.PhoneNumberType as ppt on ppt.PhoneNumberTypeID =pp.PhoneNumberTypeID

-- Çalışanın Adı, Soyadı Departmanının Adı (son çalıştığı departman listelenecek)
select DISTINCT hd.Name, hed.DepartmentID from HumanResources.Department  hd
inner join HumanResources.EmployeeDepartmentHistory hed on hed.DepartmentID =hd.DepartmentID where hed.EndDate is null
 
-- Finance departmanında kaç adet çalışan var?
select COUNT(*) from HumanResources.Department hd Where hd.Name='Finance'

-- Satış Soruları
--Satış Soruları


-- Adet bazında en çok siparişi veren müşterimin ID
select Top 1 COUNT (soh.CustomerID) ordercount, soh.CustomerID from Sales.SalesOrderHeader soh  group by soh.CustomerID order by soh.CustomerID desc

-- Bugüne kadar verilmiş en yüksek cirolu sipariş
select Top  1 ssoh.SalesOrderID, ssoh.TotalDue from Sales.SalesOrderHeader  ssoh order by ssoh.TotalDue desc

-- Sipariş cirolarmı TerriorityID	ye göre grupla (8 numara almanyaya denk geliyor ve toplam cirosunu listele yani ID, Ülke,Ciro)
select sst.TerritoryID,sst.CountryRegionCode, ssoh.TotalDue from Sales.SalesTerritory sst 
inner join Sales.SalesOrderHeader ssoh on ssoh.TerritoryID=sst.TerritoryID
order by sst.TerritoryID
 
-- Kaç adet sipariş gecikti?
select COUNT(*) from Sales.SalesOrderHeader ssoh Where ssoh.DueDate<ssoh.ShipDate


-- En çok siparişim hangi	bölgeye gecikti ve kaç adet 
select ssoh.ShipToAddressID from Sales.SalesOrderHeader ssoh Where ssoh.DueDate<ssoh.ShipDate 

--vista kredi kartıyla kaç adet sipariş verilmiş
select COUNT(*) from Sales.CreditCard Where CardType='vista'

-- sipariş hesaplamalarda discount kolunuda kullanılacak (Yüzde indirim vs)
select sum(ssd.OrderQty * (ssd.UnitPrice*(1-ssd.UnitPriceDiscount))) , ssd.ProductID from Sales.SalesOrderDetail ssd group by ssd.ProductID


--Taşıma ücreti 50den	düşük siparişlerimi yazdır
select * from purchasing.PurchaseOrderHeader ppo Where ppo.TaxAmt<50

select * from Sales.CreditCard
select * from Sales.SalesOrderDetail
select * from Sales.SalesOrderHeader
select * from Sales.SalesTerritory
select * from Sales.Customer
select * from purchasing.PurchaseOrderHeader


