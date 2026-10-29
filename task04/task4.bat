chcp 65001

# Import your database file instantly under 2 seconds
sqlite3 movies_rating.db < db_init.sql

echo "1. Найти все пары пользователей, оценивших один и тот же фильм. Устранить дубликаты, проверить отсутствие пар с самим собой. Список 100 записей."
echo "--------------------------------------------------"
sqlite3 movies_rating.db -box -echo "SELECT u1.name AS User1, u2.name AS User2, m.title AS MovieTitle FROM ratings r1 JOIN ratings r2 ON r1.movie_id = r2.movie_id AND r1.user_id < r2.user_id JOIN users u1 ON r1.user_id = u1.id JOIN users u2 ON r2.user_id = u2.id JOIN movies m ON r1.movie_id = m.id LIMIT 100;"
echo " "

echo "2. Найти 10 самых свежих оценок от разных пользователей, вывести названия фильмов, имена пользователей, оценку, дату отзыва в формате ГГГГ-ММ-ДД."
echo "--------------------------------------------------"
sqlite3 movies_rating.db -box -echo "WITH LatestUserRatings AS (SELECT r.user_id, r.movie_id, r.rating, r.timestamp, ROW_NUMBER() OVER (PARTITION BY r.user_id ORDER BY r.timestamp DESC) as rn FROM ratings r) SELECT m.title, u.name, lur.rating, date(lur.timestamp, 'unixepoch') AS evaluation_date FROM LatestUserRatings lur JOIN users u ON lur.user_id = u.id JOIN movies m ON lur.movie_id = m.id WHERE lur.rn = 1 ORDER BY lur.timestamp DESC LIMIT 10;"
echo " "

echo "3. Вывести все фильмы с максимальным средним рейтингом и все фильмы с минимальным средним рейтингом. Отсортировать по году выпуска и названию. Колонка Рекомендуем."
echo "--------------------------------------------------"
sqlite3 movies_rating.db -box -echo "WITH MovieAverages AS (SELECT movie_id, AVG(rating) as avg_rating FROM ratings GROUP BY movie_id), Stats AS (SELECT MAX(avg_rating) as max_r, MIN(avg_rating) as min_r FROM MovieAverages) SELECT m.year, m.title, ma.avg_rating, CASE WHEN ma.avg_rating = s.max_r THEN 'Да' ELSE 'Нет' END AS 'Рекомендуем' FROM MovieAverages ma JOIN movies m ON ma.movie_id = m.id CROSS JOIN Stats s WHERE ma.avg_rating = s.max_r OR ma.avg_rating = s.min_r ORDER BY m.year ASC, m.title ASC;"
echo " "

echo "4. Вычислить количество оценок и среднюю оценку, которую дали фильмам пользователи-женщины в период с 2010 по 2012 год."
echo "--------------------------------------------------"
sqlite3 movies_rating.db -box -echo "SELECT COUNT(r.id) AS TotalRatings, AVG(r.rating) AS AverageRating FROM ratings r JOIN users u ON r.user_id = u.id WHERE u.gender = 'female' AND strftime('%Y', date(r.timestamp, 'unixepoch')) BETWEEN '2010' AND '2012';"
echo " "

echo "5. Список фильмов с указанием их средней оценки и места в рейтинге. Отсортировать по году и названиям. Первые 20 записей."
echo "--------------------------------------------------"
sqlite3 movies_rating.db -box -echo "WITH RankedMovies AS (SELECT movie_id, AVG(rating) as avg_rating, DENSE_RANK() OVER (ORDER BY AVG(rating) DESC) as ranking_position FROM ratings GROUP BY movie_id) SELECT m.year, m.title, rm.avg_rating, rm.ranking_position FROM RankedMovies rm JOIN movies m ON rm.movie_id = m.id ORDER BY m.year ASC, m.title ASC LIMIT 20;"
echo " "

echo "6. Вывести список из 10 последних зарегистрированных пользователей в формате Фамилия Имя|Дата регистрации."
echo "--------------------------------------------------"
sqlite3 movies_rating.db -box -echo "SELECT SUBSTR(name, INSTR(name, ' ') + 1) || ' ' || SUBSTR(name, 1, INSTR(name, ' ') - 1) || '|' || register_date AS 'Lastname Firstname|Register Date' FROM users ORDER BY register_date DESC LIMIT 10;"
echo " "

echo "7. С помощью рекурсивного CTE составить таблицу умножения для чисел от 1 до 10. Должен получиться один столбец."
echo "--------------------------------------------------"
sqlite3 movies_rating.db -box -echo "WITH RECURSIVE Counter(n) AS (SELECT 1 UNION ALL SELECT n + 1 FROM Counter WHERE n < 10), Multiplier AS (SELECT c1.n AS x, c2.n AS y FROM Counter c1 CROSS JOIN Counter c2) SELECT x || 'x' || y || '=' || (x * y) AS 'Multiplication Table' FROM Multiplier;"
echo " "

echo "8. С помощью рекурсивного CTE выделить все жанры фильмов, имеющиеся в таблице movies (каждый жанр в отдельной строке)."
echo "--------------------------------------------------"
sqlite3 movies_rating.db -box -echo "WITH RECURSIVE SplitGenres(genre, remainder) AS (SELECT '', genres || '|' FROM movies UNION ALL SELECT SUBSTR(remainder, 1, INSTR(remainder, '|') - 1), SUBSTR(remainder, INSTR(remainder, '|') + 1) FROM SplitGenres WHERE remainder <> '') SELECT DISTINCT genre FROM SplitGenres WHERE genre <> '' ORDER BY genre ASC;"
echo " "
