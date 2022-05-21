-- SELECT STATEMENT QUARIES
-- Самые популярные блюда кафе 'Villa Dei Fiori' в апреле и сколько раз его заказали
SELECT TOP 1 WITH TIES d.name, d.Type, COUNT(dish_id) AS DishCount
FROM Dish d

JOIN OrderofClient oc ON d.ID=oc.Dish_ID
JOIN Staff s ON s.ID=oc.Staff_ID
JOIN Canteen c ON c.ID=s.Canteen_ID

WHERE DATEPART(month,oc.time)=4 
AND c.Name='Villa Dei Fiori'

GROUP BY d.name, d.Type
ORDER BY COUNT(dish_id) desc;


-- Средняя выручка в день каждого кафе и их количество клиентов 
SELECT c.name, SUM(oc.Total_price)/COUNT(DISTINCT DATEPART(month,oc.time)) as AVGPrice, COUNT(oc.Client_ID) ClientCount
FROM Canteen c

JOIN Staff s ON c.ID=s.Canteen_ID
JOIN OrderofClient oc ON s.ID=oc.Staff_ID

GROUP BY c.name
ORDER BY AVGPrice desc;


-- Клиент который сделал больше 3 заказа
SELECT cl.First_name, cl.Last_name, COUNT(oc.ID) FROM Client cl 

JOIN OrderofClient oc ON cl.ID=oc.Client_ID

GROUP BY cl.First_name, cl.Last_name
HAVING COUNT(oc.ID)>3;


-- Наибольшая выручка официанта из всех ресторанов, наибольшая выручка официанта из кафе 'Shavlego' и разница выручек 
SELECT MAX(allcafe.total) maximum,

(SELECT MAX(shavlego.total) maxShavlego
	FROM (SELECT s.ID, s.First_Name, s.Last_name , SUM(oc.Total_price) total
	FROM OrderofClient oc
	JOIN Staff s ON s.ID=oc.Staff_id
	JOIN Canteen c ON c.ID=s.Canteen_ID
	WHERE c.name='Shavlego'
	GROUP BY s.ID,s.First_Name, s.Last_name) AS shavlego
	) AS maxShavlego,

(SELECT MAX(allcafe.total) - (SELECT MAX(shavlego.total) maxShavlego
	FROM (SELECT s.ID, s.First_Name, s.Last_name , SUM(oc.Total_price) total
	FROM OrderofClient oc
	JOIN Staff s ON s.ID=oc.Staff_id
	JOIN Canteen c ON c.ID=s.Canteen_ID
	WHERE c.name='Shavlego'
	GROUP BY s.ID,s.First_Name, s.Last_name) AS shavlego
	) 
	FROM (SELECT s.ID, s.First_Name, s.Last_name , SUM(oc.Total_price) total
	FROM OrderofClient oc
	JOIN Staff s ON s.ID=oc.Staff_id
	JOIN Canteen c ON c.ID=s.Canteen_ID
	GROUP BY s.ID,s.First_Name, s.Last_name) AS allcafe
	) AS DIFF
	

	FROM (SELECT s.ID, s.First_Name, s.Last_name , SUM(oc.Total_price) total
	FROM OrderofClient oc
	JOIN Staff s ON s.ID=oc.Staff_id
	JOIN Canteen c ON c.ID=s.Canteen_ID
	GROUP BY s.ID,s.First_Name, s.Last_name) AS allcafe;



--4. Количество первого блюда, второго, закусок, десертов
-- исскуственная таблица где находятся только блюда категории 'First Course'
CREATE VIEW first_course_dish As
SELECT Type,Name FROM Dish
WHERE Type='First Course';

-- исскуственная таблица где находятся только блюда категории 'Second Course'
CREATE VIEW second_course_dish As
SELECT Type,Name FROM Dish
WHERE Type='Second Course';

-- исскуственная таблица где находятся только блюда категории 'Dessert'
CREATE VIEW dessert_dish As
SELECT Type,Name FROM Dish
WHERE Type='Dessert';

-- исскуственная таблица где находятся только блюда категории 'Appetizer'
CREATE VIEW appetizer_dish As
SELECT Type,Name FROM Dish
WHERE Type='Appetizer'

CREATE VIEW number_of_dishes AS
SELECT Count(FC.Name)'Num of First Course', Count(SC.Name)'Num of Second Course',Count(AP.Name)'Num of Appetizer',Count(D.Name)'Num of Dessert' FROM first_course_dish FC 
FULL JOIN second_course_dish SC ON FC.Type=SC.Type
FULL JOIN appetizer_dish AP ON AP.Type=SC.Type
FULL JOIN dessert_dish D ON AP.Type=D.Type

SELECT * FROM number_of_dishes

-- DELETE QUERY
--Удаление Блюда в названии которых есть слово 'Salad'

DELETE FROM Dish
WHERE Name LIKE '%Salad%';


--UPDATE QUERY
--Замена фамилии с инициалами

UPDATE Client SET 
Last_name= SUBSTRING(Last_name,1,1);




