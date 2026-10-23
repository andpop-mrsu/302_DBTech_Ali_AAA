Last login: Tue Oct 20 08:34:21 on ttys000
MacBook-Pro-Mac:~ mac$ cd desktop/dev
MacBook-Pro-Mac:dev mac$ ls
302_DBTech_Ali_AAA
MacBook-Pro-Mac:dev mac$ cd 302_DBTech_ALI_AAA
MacBook-Pro-Mac:302_DBTech_ALI_AAA mac$ ls
Git_instruction.md	dataset			task02.md
README.md		task01.md		task03.md
Task01			task02			task04.md
MacBook-Pro-Mac:302_DBTech_ALI_AAA mac$ cd task2
-bash: cd: task2: No such file or directory
MacBook-Pro-Mac:302_DBTech_ALI_AAA mac$ cd task02
MacBook-Pro-Mac:task02 mac$ git push origin feature/task02-mods
fatal: unable to access 'https://github.com/andpop-mrsu/302_DBTech_Ali_AAA/': LibreSSL SSL_connect: SSL_ERROR_SYSCALL in connection to github.com:443 
MacBook-Pro-Mac:task02 mac$ git push origin feature/task02-mods
fatal: unable to access 'https://github.com/andpop-mrsu/302_DBTech_Ali_AAA/': LibreSSL SSL_connect: SSL_ERROR_SYSCALL in connection to github.com:443 
MacBook-Pro-Mac:task02 mac$ git push origin feature/task02-mods
^C
MacBook-Pro-Mac:task02 mac$ git status
On branch feature/task02-mods
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	../.DS_Store
	.DS_Store

nothing added to commit but untracked files present (use "git add" to track)
MacBook-Pro-Mac:task02 mac$ cd ..
MacBook-Pro-Mac:302_DBTech_ALI_AAA mac$ git status
On branch feature/task02-mods
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.DS_Store
	task02/.DS_Store

nothing added to commit but untracked files present (use "git add" to track)
MacBook-Pro-Mac:302_DBTech_ALI_AAA mac$ git add .
MacBook-Pro-Mac:302_DBTech_ALI_AAA mac$ git status
On branch feature/task02-mods
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	new file:   .DS_Store
	new file:   task02/.DS_Store

MacBook-Pro-Mac:302_DBTech_ALI_AAA mac$ git commit -m "final script adjustments" 
[feature/task02-mods 5c61b87] final script adjustments
 2 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 .DS_Store
 create mode 100644 task02/.DS_Store
MacBook-Pro-Mac:302_DBTech_ALI_AAA mac$ git checkout -b feature/task03-mods
Switched to a new branch 'feature/task03-mods'
MacBook-Pro-Mac:302_DBTech_ALI_AAA mac$ mkdir task03
MacBook-Pro-Mac:302_DBTech_ALI_AAA mac$ cd task03
MacBook-Pro-Mac:task03 mac$ cp ../task02/db_init.sql
usage: cp [-R [-H | -L | -P]] [-fi | -n] [-apvXc] source_file target_file
       cp [-R [-H | -L | -P]] [-fi | -n] [-apvXc] source_file ... target_directory
MacBook-Pro-Mac:task03 mac$ cd ..
MacBook-Pro-Mac:302_DBTech_ALI_AAA mac$ ls
Git_instruction.md	task01.md		task03.md
README.md		task02			task04.md
Task01			task02.md
dataset			task03
MacBook-Pro-Mac:302_DBTech_ALI_AAA mac$ cd task02
MacBook-Pro-Mac:task02 mac$ ls
create_db.py		db_init.sql		readme.md
db_init.bat		movies_rating.db
MacBook-Pro-Mac:task02 mac$ cd ..
MacBook-Pro-Mac:302_DBTech_ALI_AAA mac$ cd task03
MacBook-Pro-Mac:task03 mac$ cp ../task02/db_init.sql
usage: cp [-R [-H | -L | -P]] [-fi | -n] [-apvXc] source_file target_file
       cp [-R [-H | -L | -P]] [-fi | -n] [-apvXc] source_file ... target_directory
MacBook-Pro-Mac:task03 mac$ ls
MacBook-Pro-Mac:task03 mac$ ls
MacBook-Pro-Mac:task03 mac$ clear

MacBook-Pro-Mac:task03 mac$ cp ../task02/db_init.sql .
MacBook-Pro-Mac:task03 mac$ ls
db_init.sql
MacBook-Pro-Mac:task03 mac$ nano task3.bat
MacBook-Pro-Mac:task03 mac$ git add task3.bat
MacBook-Pro-Mac:task03 mac$ git update-index --chmod=+x task3.bat
MacBook-Pro-Mac:task03 mac$ ./task3.bat
-bash: ./task3.bat: Permission denied
MacBook-Pro-Mac:task03 mac$ git update-index --chmod=+x task3.bat
MacBook-Pro-Mac:task03 mac$ ./task3.bat
-bash: ./task3.bat: Permission denied
MacBook-Pro-Mac:task03 mac$ task3.bat
-bash: task3.bat: command not found
MacBook-Pro-Mac:task03 mac$ bash task3.bat
task3.bat: line 1: chcp: command not found
1. Составить список фильмов, имеющих хотя бы одну оценку. Список фильмов отсортировать по году выпуска и по названиям. В списке оставить первые 10 фильмов.
--------------------------------------------------
sqlite3: Error: unknown option: -box
Use -help for a list of options.
 
2. Вывести список всех пользователей, фамилии (не имена!) которых начинаются на букву 'A'. Полученный список отсортировать по дате регистрации. В списке оставить первых 5 пользователей.
--------------------------------------------------
sqlite3: Error: unknown option: -box
Use -help for a list of options.
 
3. Написать запрос, возвращающий информацию о рейтингах в более читаемом формате: имя и фамилия эксперта, название фильма, год выпуска, оценка и дата оценки в формате ГГГГ-ММ-ДД. Отсортировать данные по имени эксперта, затем названию фильма и оценке. В списке оставить первые 50 записей.
--------------------------------------------------
sqlite3: Error: unknown option: -box
Use -help for a list of options.
 
4. Вывести список фильмов с указанием тегов, которые были им присвоены пользователями. Сортировать по году выпуска, затем по названию фильма, затем по тегу. В списке оставить первые 40 записей.
--------------------------------------------------
sqlite3: Error: unknown option: -box
Use -help for a list of options.
 
5. Вывести список фильмов с указанием самых свежих фильмов. В список должны войти все фильмы последнего года выпуска, имеющиеся в базе данных. Запрос должен быть универсальным, не зависящим от исходных данных.
--------------------------------------------------
sqlite3: Error: unknown option: -box
Use -help for a list of options.
 
6. Найти все комедии, выпущенные после 2000 года, которые понравились мужчинам (оценка не ниже 4.5). Для каждого фильма в этом списке вывести название, год выпуска и количество таких оценок. Результат отсортировать по году выпуска и названию фильма.
--------------------------------------------------
sqlite3: Error: unknown option: -box
Use -help for a list of options.
 
7. Провести анализ занятий (профессий) пользователей - вывести количество пользователей для каждого рода занятий. Найти самую распространенную и самую редкую профессию посетителей сайта.
--------------------------------------------------
--- Distribution of Occupations ---
sqlite3: Error: unknown option: -box
Use -help for a list of options.
--- Most Common Occupation ---
sqlite3: Error: unknown option: -box
Use -help for a list of options.
--- Rarest Occupation ---
sqlite3: Error: unknown option: -box
Use -help for a list of options.
 
MacBook-Pro-Mac:task03 mac$ brew
-bash: brew: command not found
MacBook-Pro-Mac:task03 mac$ xattr -d com.apple.quarantine
MacBook-Pro-Mac:task03 mac$ 
MacBook-Pro-Mac:task03 mac$ 
MacBook-Pro-Mac:task03 mac$ clear

MacBook-Pro-Mac:task03 mac$ bash task3.bat
task3.bat: line 1: chcp: command not found
1. Составить список фильмов, имеющих хотя бы одну оценку. Список фильмов отсортировать по году выпуска и по названиям. В списке оставить первые 10 фильмов.
--------------------------------------------------
sqlite3: Error: unknown option: -box
Use -help for a list of options.
 
2. Вывести список всех пользователей, фамилии (не имена!) которых начинаются на букву 'A'. Полученный список отсортировать по дате регистрации. В списке оставить первых 5 пользователей.
--------------------------------------------------
sqlite3: Error: unknown option: -box
Use -help for a list of options.
 
3. Написать запрос, возвращающий информацию о рейтингах в более читаемом формате: имя и фамилия эксперта, название фильма, год выпуска, оценка и дата оценки в формате ГГГГ-ММ-ДД. Отсортировать данные по имени эксперта, затем названию фильма и оценке. В списке оставить первые 50 записей.
--------------------------------------------------
sqlite3: Error: unknown option: -box
Use -help for a list of options.
 
4. Вывести список фильмов с указанием тегов, которые были им присвоены пользователями. Сортировать по году выпуска, затем по названию фильма, затем по тегу. В списке оставить первые 40 записей.
--------------------------------------------------
sqlite3: Error: unknown option: -box
Use -help for a list of options.
 
5. Вывести список фильмов с указанием самых свежих фильмов. В список должны войти все фильмы последнего года выпуска, имеющиеся в базе данных. Запрос должен быть универсальным, не зависящим от исходных данных.
--------------------------------------------------
sqlite3: Error: unknown option: -box
Use -help for a list of options.
 
6. Найти все комедии, выпущенные после 2000 года, которые понравились мужчинам (оценка не ниже 4.5). Для каждого фильма в этом списке вывести название, год выпуска и количество таких оценок. Результат отсортировать по году выпуска и названию фильма.
--------------------------------------------------
sqlite3: Error: unknown option: -box
Use -help for a list of options.
 
7. Провести анализ занятий (профессий) пользователей - вывести количество пользователей для каждого рода занятий. Найти самую распространенную и самую редкую профессию посетителей сайта.
--------------------------------------------------
--- Distribution of Occupations ---
sqlite3: Error: unknown option: -box
Use -help for a list of options.
--- Most Common Occupation ---
sqlite3: Error: unknown option: -box
Use -help for a list of options.
--- Rarest Occupation ---
sqlite3: Error: unknown option: -box
Use -help for a list of options.
 
MacBook-Pro-Mac:task03 mac$ nano task3.bat

  GNU nano 2.0.6              File: task3.bat                                   

sqlite3 movies_rating.db -box -echo "SELECT id, title, year, genres FROM movies$
echo " "

echo "6. Найти все комедии, выпущенные после 2000 года, которые понравились муж$
echo "--------------------------------------------------"
sqlite3 movies_rating.db -box -echo "SELECT m.title, m.year, COUNT(r.rating) AS$
echo " "

echo "7. Провести анализ занятий (профессий) пользователей - вывести количество$
echo "--------------------------------------------------"
echo "--- Distribution of Occupations ---"
sqlite3 movies_rating.db -box -echo "SELECT occupation, COUNT(*) AS user_count $
echo "--- Most Common Occupation ---"
sqlite3 movies_rating.db -box -echo "SELECT occupation, COUNT(*) AS user_count $
echo "--- Rarest Occupation ---"
sqlite3 movies_rating.db -box -echo "SELECT occupation, COUNT(*) AS user_count $
echo " "

