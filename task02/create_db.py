import os
import csv
import re

def parse_year(title_str):
    match = re.search(r'\((\d{4})\)\s*$', title_str)
    if match:
        year = int(match.group(1))
        clean_title = re.sub(r'\s*\((\d{4})\)\s*$', '', title_str)
        return clean_title, year
    return title_str, "NULL"

def generate_sql():
    sql_path = "db_init.sql"
    dataset_dir = os.path.join("..", "dataset")
    
    with open(sql_path, "w", encoding="utf-8") as f:
        f.write("DROP TABLE IF EXISTS movies;\n")
        f.write("DROP TABLE IF EXISTS ratings;\n")
        f.write("DROP TABLE IF EXISTS tags;\n")
        f.write("DROP TABLE IF EXISTS users;\n\n")


        f.write("CREATE TABLE movies (id INTEGER PRIMARY KEY, title TEXT, year INTEGER, genres TEXT);\n")
        f.write("CREATE TABLE ratings (id INTEGER PRIMARY KEY AUTOINCREMENT, user_id INTEGER, movie_id INTEGER, rating REAL, timestamp INTEGER);\n")
        f.write("CREATE TABLE tags (id INTEGER PRIMARY KEY AUTOINCREMENT, user_id INTEGER, movie_id INTEGER, tag TEXT, timestamp INTEGER);\n")
        f.write("CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, email TEXT, gender TEXT, register_date TEXT, occupation TEXT);\n\n")


        f.write("BEGIN TRANSACTION;\n\n")


        movies_file = os.path.join(dataset_dir, "movies.csv")
        if os.path.exists(movies_file):
            with open(movies_file, "r", encoding="utf-8") as mf:
                reader = csv.reader(mf)
                next(reader, None)
                for row in reader:
                    if not row or len(row) < 3: continue
                    m_id, raw_title, genres = row[0], row[1], row[2]
                    clean_title, year = parse_year(raw_title)
                    clean_title = clean_title.replace("'", "''")
                    genres = genres.replace("'", "''")
                    f.write(f"INSERT INTO movies (id, title, year, genres) VALUES ({m_id}, '{clean_title}', {year}, '{genres}');\n")


        ratings_file = os.path.join(dataset_dir, "ratings.csv")
        if os.path.exists(ratings_file):
            with open(ratings_file, "r", encoding="utf-8") as rf:
                reader = csv.reader(rf)
                next(reader, None)
                for row in reader:
                    if not row or len(row) < 4: continue
                    u_id, m_id, rating, ts = row[0], row[1], row[2], row[3]
                    f.write(f"INSERT INTO ratings (user_id, movie_id, rating, timestamp) VALUES ({u_id}, {m_id}, {rating}, {ts});\n")


        tags_file = os.path.join(dataset_dir, "tags.csv")
        if os.path.exists(tags_file):
            with open(tags_file, "r", encoding="utf-8") as tf:
                reader = csv.reader(tf)
                next(reader, None)
                for row in reader:
                    if not row or len(row) < 4: continue
                    u_id, m_id, tag, ts = row[0], row[1], row[2], row[3]
                    tag = tag.replace("'", "''")
                    f.write(f"INSERT INTO tags (user_id, movie_id, tag, timestamp) VALUES ({u_id}, {m_id}, '{tag}', {ts});\n")


        users_file = os.path.join(dataset_dir, "users.txt")
        if os.path.exists(users_file):
            with open(users_file, "r", encoding="utf-8") as uf:
                for line in uf:
                    line = line.strip()
                    if not line or line.startswith("id|"): continue
                    parts = line.split("|")
                    if len(parts) < 6: continue
                    u_id, name, email, gender, r_date, occ = parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]
                    name = name.replace("'", "''")
                    occ = occ.replace("'", "''")
                    f.write(f"INSERT INTO users (id, name, email, gender, register_date, occupation) VALUES ({u_id}, '{name}', '{email}', '{gender}', '{r_date}', '{occ}');\n")

        f.write("\nCOMMIT;\n")
    print("db_init.sql generated successfully.")

generate_sql()