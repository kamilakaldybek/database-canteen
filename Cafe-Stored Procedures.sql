--список работников, им€ которых начинаетс€ на подстроку указанный пользователем
CREATE PROCEDURE show @canteen VARCHAR(20)
AS
BEGIN
SELECT * FROM canteen C
JOIN STAFF S ON c.ID=s.Canteen_ID
WHERE s.First_name LIKE @canteen+'%'
END
;

-- поиск: вывести всех людей у которых им€ начинаетс€ на букву 's'
EXEC show 's'
;


--список работников, им€ которых содержат подстроку указанный пользователем
ALTER PROCEDURE show @canteen VARCHAR(20)
AS
BEGIN
SELECT * FROM canteen C
JOIN STAFF S ON c.ID=s.Canteen_ID
WHERE s.First_name LIKE '%'+@canteen+'%'
END
;
--поиск: вывести всех людей у которых в имени есть буква 't'
EXEC show 'a'
;

--TASK 2

-- здесь мы делаем так чтобы по умолчанию нам выводило работника 
ALTER PROCEDURE show @canteen VARCHAR(20) = 'Stacey'
AS
BEGIN
SELECT * FROM canteen C
JOIN STAFF S ON c.ID=s.Canteen_ID
WHERE s.First_name LIKE '%'+@canteen+'%'
END
;

-- после чего когда мы запускаем exec show без условий, 
-- нам выдают информацию о работнице Stacey по умолчанию
EXEC show 
;

--TASK 3
-- —оздание хранимой процедуры с уведомлением об успешной реализации процесса. (»спользу€ УifФ condition).
ALTER PROCEDURE show @canteen VARCHAR(20) = NULL
AS
BEGIN
IF @canteen IS NULL
BEGIN
PRINT 'There is not enough parameters to procedure show'
END
ELSE
BEGIN
IF EXISTS(SELECT * FROM canteen C
JOIN STAFF S ON c.ID=s.Canteen_ID
WHERE s.First_name LIKE '%'+@canteen+'%')
BEGIN
PRINT 'Staff list'
SELECT * FROM canteen C
JOIN STAFF S ON c.ID=s.Canteen_ID
WHERE s.First_name LIKE '%'+@canteen+'%'
END
ELSE
BEGIN
PRINT 'There is no data found for your query'
END
END
END
;
--выводим без поиска 
EXEC show ;

--выводим поиск по букве Q
EXEC show 'Q';

--выводим поиск по букве O
EXEC show 'O';

--TASK 4
--—оздайте хранимую процедуру, котора€ вызывает другую процедуру. Ќеобходимость должна быть обоснована.
CREATE PROC outputList @canteen VARCHAR(20) = NULL
AS
BEGIN
EXEC show @canteen
IF EXISTS(SELECT First_name,Last_name,s.Address, c.name FROM canteen c
JOIN STAFF S ON c.ID=s.Canteen_ID)
BEGIN
PRINT 'City of canteen'
SELECT c.name,city.Name FROM canteen c
join city on city.ID=c.City_ID
END
ELSE
BEGIN
PRINT 'No staff found'
END
END
;

EXEC outputList 'v'
;

--TASK 5
--ћногозначный вывод данных в результате нескольких вызовов хранимых процедур одновременно

ALTER PROCEDURE show
@Name VARCHAR(20) = NULL,
@City VARCHAR(20) OUTPUT,
@STAFFName VARCHAR(20) OUTPUT
AS
BEGIN
IF @name IS NULL
BEGIN
PRINT 'There is not enough parameters to procedure show'
END
ELSE
BEGIN
IF EXISTS(SELECT First_name,Last_name,s.Address, c.name FROM canteen c
JOIN STAFF S ON c.ID=s.Canteen_ID
WHERE s.First_name LIKE '%'+@name+'%')
BEGIN
PRINT 'Staff list'
SELECT @City = city.Name , @STAFFName = First_name
FROM STAFF S 
JOIN canteen c ON c.ID=s.Canteen_ID
JOIN city ON city.ID=c.City_ID
WHERE First_name LIKE '%'+@name+'%'
END
ELSE
BEGIN
PRINT 'There is no data found for your query'
END
END
END
;

ALTER PROC outputList @canteen VARCHAR(20) = NULL
AS
BEGIN
DECLARE @City VARCHAR(20)
DECLARE @name VARCHAR(20)
EXEC show @canteen, @City OUTPUT, @name OUTPUT
PRINT 'Staff: '+@name
PRINT 'Canteen Information'
SELECT c.name,c.Address, City.Name, country.name
FROM Canteen c JOIN City ON c.City_ID=city.ID
JOIN Country ON country.ID=city.Country_ID
WHERE city.Name = @City
END
;

exec outputList 'vlad'
;