CREATE TABLE Canteen ( 
	ID int NOT NULL,
	Name nvarchar(30),
	Address nvarchar(50),
	City_ID int
)
;

CREATE TABLE City ( 
	ID int NOT NULL,
	Name nvarchar(30),
	Country_ID int
)
;

CREATE TABLE Client ( 
	ID int NOT NULL,
	First_name nvarchar(30),
	Last_name nvarchar(30),
	Address nvarchar(50),
	Year_of_birth datetime,
	Phone_number nvarchar(20)
)
;

CREATE TABLE Country ( 
	ID int NOT NULL,
	Name nvarchar(30)
)
;

CREATE TABLE DepartmentofStaff ( 
	ID int NOT NULL,
	Type_of_department nvarchar(30)
)
;

CREATE TABLE Dish ( 
	ID int NOT NULL,
	Name nvarchar(30),
	Type nvarchar(20),
	Cooking_time int
)
;

CREATE TABLE OrderofClient ( 
	ID int NOT NULL,
	Total_price money,
	Time datetime,
	Client_ID int,
	Payment_ID int,
	Staff_id int,
	Dish_id int
)
;

CREATE TABLE Payment ( 
	ID int NOT NULL,
	Payment_type nchar(15)
)
;

CREATE TABLE Staff ( 
	ID int NOT NULL,
	First_name nvarchar(30),
	Last_name nvarchar(30),
	Address nvarchar(30),
	Year_of_birth datetime,
	Phone_number nvarchar(20),
	Canteen_ID int,
	DepartmentofStaff_ID int
)
;


ALTER TABLE Canteen ADD CONSTRAINT PK_Canteen 
	PRIMARY KEY (ID)
;

ALTER TABLE City ADD CONSTRAINT PK_City 
	PRIMARY KEY (ID)
;

ALTER TABLE Client ADD CONSTRAINT PK_Client 
	PRIMARY KEY (ID)
;

ALTER TABLE Country ADD CONSTRAINT PK_Country 
	PRIMARY KEY (ID)
;

ALTER TABLE DepartmentofStaff ADD CONSTRAINT PK_DepartmentofStaff
	PRIMARY KEY (ID)
;

ALTER TABLE Dish ADD CONSTRAINT PK_Dish 
	PRIMARY KEY (ID)
;

ALTER TABLE OrderofClient ADD CONSTRAINT PK_OrderofClient 
	PRIMARY KEY (ID)
;

ALTER TABLE Payment ADD CONSTRAINT PK_Payment 
	PRIMARY KEY (ID)
;

ALTER TABLE Staff ADD CONSTRAINT PK_Staff 
	PRIMARY KEY (ID)
;



ALTER TABLE Canteen ADD CONSTRAINT FK_Canteen_City 
	FOREIGN KEY (City_ID) REFERENCES City (ID)
;

ALTER TABLE City ADD CONSTRAINT FK_City_Country 
	FOREIGN KEY (Country_ID) REFERENCES Country (ID)
;


ALTER TABLE OrderofClient ADD CONSTRAINT FK_OrderofClient_Client 
	FOREIGN KEY (Client_ID) REFERENCES Client (ID)
;

ALTER TABLE OrderofClient ADD CONSTRAINT FK_OrderofClient_Payment 
	FOREIGN KEY (Payment_ID) REFERENCES Payment (ID)
;

ALTER TABLE OrderofClient ADD CONSTRAINT FK_OrderofClient_Dish
	FOREIGN KEY (Dish_ID) REFERENCES Dish (ID)
;

ALTER TABLE OrderofClient ADD CONSTRAINT FK_OrderofClient_Staff 
	FOREIGN KEY (Staff_ID) REFERENCES Staff (ID)
;

ALTER TABLE Staff ADD CONSTRAINT FK_Staff_Canteen
	FOREIGN KEY (Canteen_ID) REFERENCES Canteen (ID)
;

ALTER TABLE Staff ADD CONSTRAINT FK_Staff_DepartmentofStaff 
	FOREIGN KEY (DepartmentofStaff_ID) REFERENCES DepartmentofStaff (ID)
;


--DATA

INSERT [Country]([ID], [Name]) VALUES(1, 'Kazakhstan')
INSERT [Country]([ID], [Name]) VALUES(2, 'Russia')
INSERT [Country]([ID], [Name]) VALUES(3, 'Great Britain')
INSERT [Country]([ID], [Name]) VALUES(4, 'Japan')
INSERT [Country]([ID], [Name]) VALUES(5, 'Ukraine')

INSERT [City] ([ID], [Name], [Country_ID]) VALUES(1, 'Almaty', 1)
INSERT [City] ([ID], [Name], [Country_ID]) VALUES(2, 'Moscow', 2)
INSERT [City] ([ID], [Name], [Country_ID]) VALUES(3, 'London', 3)
INSERT [City] ([ID], [Name], [Country_ID]) VALUES(4, 'Tokyo', 4)
INSERT [City] ([ID], [Name], [Country_ID]) VALUES(5,'Kiyev', 5)

INSERT [Canteen] ([ID], [Name], [Address],[City_ID]) VALUES(1, 'Villa Dei Fiori','Al-Farabi 140A',1);
INSERT [Canteen] ([ID], [Name], [Address],[City_ID]) VALUES(2, 'Bellagio Restaurant','Moscow 12/2',2);
INSERT [Canteen] ([ID], [Name], [Address],[City_ID]) VALUES(3, 'Hawker Chan', 'London 3B', 3);
INSERT [Canteen] ([ID], [Name], [Address],[City_ID]) VALUES(4, 'Olivier Restaurant', 'Tokyo 60;', 4);
INSERT [Canteen] ([ID], [Name], [Address],[City_ID]) VALUES(5, 'Shavlego', 'Kiyev 27C', 5);


INSERT [Client] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number])
	VALUES(1, 'Adina', 'Miles', 'Almaty 23a', '1992-22-04 00:00:00.000', '+77079345346')
INSERT [Client] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number])
	VALUES(2, 'Shaan', 'Whilfred', 'Moscow 77','2002-12-10 00:00:00.000' , '+8935845343')
INSERT [Client] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number]) 
	VALUES(3, 'Amalia', 'Flowers', 'London 34b','1997-30-04 00:00:00.000', '+4582895224')
INSERT [Client] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number]) 
	VALUES(4, 'Ishaaq', 'Foster', 'Tokyo 2a', '1995-09-01 00:00:00.000', '+3842472423')
INSERT [Client] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number]) 
	VALUES(5, 'Aayan', 'Turnball', 'Kiyev 89/9','2000-19-05 00:00:00.000' , '+2845453434')
INSERT [Client] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number]) 
	VALUES(6, 'David', 'Smith', 'Almaty 11','2000-19-05 00:00:00.000' , '+2845453400')
INSERT [Client] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number]) 
	VALUES(7, 'Elly', 'Willow', 'Almaty 13','1997-21-05 00:00:00.000' , '+2822222222')
INSERT [Client] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number]) 
	VALUES(8, 'Amina', 'Paul', 'Almaty 14','1997-21-05 00:00:00.000' , '+2822223333')



INSERT [DepartmentofStaff] ([ID], [Type_of_department]) VALUES(1, 'Cooking Department')
INSERT [DepartmentofStaff] ([ID], [Type_of_department]) VALUES(2, 'Personal Control Department')
INSERT [DepartmentofStaff] ([ID], [Type_of_department]) VALUES(3, 'Service Department')

INSERT [Payment] ([ID], [Payment_type]) VALUES(1, 'Cash')
INSERT [Payment] ([ID], [Payment_type]) VALUES(2, 'Card')


INSERT [Dish] ([ID], [Name], [Type], [Cooking_time]) VALUES(1,'Steak', 'First course',60)
INSERT [Dish] ([ID], [Name], [Type], [Cooking_time]) VALUES(2,'Tiramisu', 'Dessert',30)
INSERT [Dish] ([ID], [Name], [Type], [Cooking_time]) VALUES(3,'Roast','Second course', 90)
INSERT [Dish] ([ID], [Name], [Type], [Cooking_time]) VALUES(4,'Chicken noodles', 'First course' , 60)
INSERT [Dish] ([ID], [Name], [Type], [Cooking_time]) VALUES(5,'Angel food cake', 'Dessert', 30)
INSERT [Dish] ([ID], [Name], [Type], [Cooking_time]) VALUES(6,'Meat Salad', 'Appetizer', 20)
INSERT [Dish] ([ID], [Name], [Type], [Cooking_time]) VALUES(7,'Vegan Salad ', 'Appetizer', 15)
INSERT [Dish] ([ID], [Name], [Type], [Cooking_time]) VALUES(8,'Cheese Plate', 'Appetizer', 10)


INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (1, 'Alina', 'Almanova', 'Almaty 26', '2000-23-03 00:00:00.000', '+77078453434',1, 1)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (2, 'Arman', 'Daur', 'Almaty 27', '1998-20-09 00:00:00.000', '+77078454414',1, 2)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (3, 'Osman', 'Filkhan' , 'Almaty 28', '2002-31-07 00:00:00.000','+77078451111',1, 3)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (4, 'Alua', 'Alibaeva' ,	'Almaty 29', '1995-05-08 00:00:00.000','+77078452222',1 ,1)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (5, 'Aidana', 'Serik' , 'Almaty 30', '1997-14-04 00:00:00.000', '+77078458888' ,1, 3)

	INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (6, 'Alla', 'Romanova', 'Moscow 78', '2000-23-03 00:00:00.000', NULL,2, 1)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (7, 'Polina', 'Kursk', 'Moscow 79', '1998-20-09 00:00:00.000', NULL,2, 1)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (8, 'Aleksey', 'Smirnov' , 'Moscow 80', '2002-31-07 00:00:00.000',NULL,2, 2)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (9, 'Lovita', 'Murina' ,	'Moscow 81', '1995-05-08 00:00:00.000',NULL,2 ,3)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (10, 'Amina', 'Tokay' , 'Moscow 82', '1997-14-04 00:00:00.000', NULL ,2, 3)

	INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (11, 'Jarod', 'Proctor','London 43', '2000-23-03 00:00:00.000',NULL,3, 1)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (12, 'Tiya', 'Smith','London 43', '1998-20-09 00:00:00.000',NULL,3, 1)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (13, 'Tymoteusz', 'Walsh' ,'London 43', '2002-31-07 00:00:00.000',NULL,3, 2)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (14, 'Simrah', 'Mcculloch' ,'London 43', '1995-05-08 00:00:00.000',NULL,3,3)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (15, 'Stacey', 'Brandt' ,'London 43', '1997-14-04 00:00:00.000',NULL,3, 3)

INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (16, 'Arana', 'Mitaso','Tokyo 2a', '2000-23-03 00:00:00.000', NULL,4,1)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (17, 'Kira', 'Yamato','Tokyo 3', '1998-20-09 00:00:00.000', NULL,4,1)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (18, 'Kushina', 'Satori' ,'Tokyo 4', '2002-31-07 00:00:00.000',NULL,4,2)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (19, 'Mikasa', 'Akira' ,	'Tokyo 5', '1995-05-08 00:00:00.000',NULL,4,3)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (20, 'Tanaka', 'Roi' , 'Tokyo 6','1997-14-04 00:00:00.000',NULL,4,3)


	INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (21, 'Anton', 'Kamarov','Kiyev 28C', '2000-23-03 00:00:00.000', NULL,5,1)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (22, 'Yelena', 'Temnikova','Kiyev 29C', '1998-20-09 00:00:00.000', NULL,5,1)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (23, 'Slava', 'Kovalenko' ,'Kiyev 27C', '2002-31-07 00:00:00.000',NULL,5,2)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (24, 'Vlad', 'Glent' ,	'Kiyev 26C', '1995-05-08 00:00:00.000',NULL,5,3)
INSERT [Staff] ([ID],[First_name],[Last_name],[Address],[Year_of_birth],[Phone_number],[Canteen_ID],[DepartmentofStaff_ID])
	VALUES (25, 'Vlad', 'Flerov' , 'Kiyev 25C','1997-14-04 00:00:00.000',NULL,5,3)


INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(1, 1234.0000 ,'2022-03-04 09:22:00.000', 1,1, 1,4)
INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(2, 892.0000, '2022-03-04 08:03:00.000', 2,2, 2,5)
INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(3, 983.0000, '2022-03-04 12:23:00.000', 3,3, 1,9)
INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(4, 1029.0000, '2022-03-04 18:12:00.000', 4,4, 1,10)
INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(5, 1483.0000, '2022-03-04 20:07:00.000', 5,5, 2,14)
INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(6, 1483.0000, '2022-03-04 20:30:00.000', 1,5, 2,15)
INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(7, 1234.0000 ,'2022-03-04 09:22:00.000', 1,1, 2,19)
INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(8, 1483.0000, '2022-03-04 08:03:00.000', 2,5, 2,20)
INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(9, 983.0000, '2022-03-04 12:23:00.000', 3,3, 1,24)
INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(10, 1029.0000, '2022-03-04 18:12:00.000', 4,4, 1,25)
INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(11, 1483.0000, '2022-03-04 20:07:00.000', 5,5, 2,4)
INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(12, 1234.0000, '2022-03-04 20:30:00.000', 1,1, 2,4)
INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(13, 1483.0000, '2022-03-04 20:07:00.000', 5,5, 2,19)
INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(14, 1234.0000, '2022-03-04 21:30:00.000', 1,1, 2,24)
INSERT [OrderofClient] ([ID], [Total_price], [Time],[Client_ID],[Dish_ID],[Payment_ID],[Staff_ID]) 
	VALUES(15, 983.0000, '2022-03-04 20:07:00.000', 5,3, 2,9)



