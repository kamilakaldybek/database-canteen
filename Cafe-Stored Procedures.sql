--������ ����������, ��� ������� ���������� �� ��������� ��������� �������������
CREATE PROCEDURE show @canteen VARCHAR(20)
AS
BEGIN
SELECT * FROM canteen C
JOIN STAFF S ON c.ID=s.Canteen_ID
WHERE s.First_name LIKE @canteen+'%'
END
;

-- �����: ������� ���� ����� � ������� ��� ���������� �� ����� 's'
EXEC show 's'
;


--������ ����������, ��� ������� �������� ��������� ��������� �������������
ALTER PROCEDURE show @canteen VARCHAR(20)
AS
BEGIN
SELECT * FROM canteen C
JOIN STAFF S ON c.ID=s.Canteen_ID
WHERE s.First_name LIKE '%'+@canteen+'%'
END
;
--�����: ������� ���� ����� � ������� � ����� ���� ����� 't'
EXEC show 'a'
;

--TASK 2

-- ����� �� ������ ��� ����� �� ��������� ��� �������� ��������� 
ALTER PROCEDURE show @canteen VARCHAR(20) = 'Stacey'
AS
BEGIN
SELECT * FROM canteen C
JOIN STAFF S ON c.ID=s.Canteen_ID
WHERE s.First_name LIKE '%'+@canteen+'%'
END
;

-- ����� ���� ����� �� ��������� exec show ��� �������, 
-- ��� ������ ���������� � ��������� Stacey �� ���������
EXEC show 
;

--TASK 3
-- �������� �������� ��������� � ������������ �� �������� ���������� ��������. (��������� �if� condition).
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
--������� ��� ������ 
EXEC show ;

--������� ����� �� ����� Q
EXEC show 'Q';

--������� ����� �� ����� O
EXEC show 'O';

--TASK 4
--�������� �������� ���������, ������� �������� ������ ���������. ������������� ������ ���� ����������.
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
--������������ ����� ������ � ���������� ���������� ������� �������� �������� ������������

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