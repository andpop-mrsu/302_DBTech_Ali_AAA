# Task02: High-Speed ETL Pipeline & SQLite Database Initialization

This utility implements a highly optimized **ETL (Extract, Transform, Load)** pipeline to parse raw text dataset matrices (`movies.csv`, `ratings.csv`, `tags.csv`, and `users.txt`) and load them into an analytical relational SQLite database wrapper.
---

##  Environment Requirements

Before running the initialization routines, ensure the target local host machine has the following tools globally mapped on its system variable environment tracking paths:
* **Python 3.x** execution binaries.
* **SQLite3 CLI application utilities** binary package toolchain core engine.

---


## How to Start

Open your console workspace terminal inside the `Task02` folder directory and execute the primary entrypoint shell script:
```bash
./db_init.bat
```

---

##  How It Works

The automated pipeline executes through a sequence of operations coordinated natively by the operating system:
1. **Extraction & Transformation:** The pipeline triggers `make_db_init.py` via Python. The script streams individual file segments out of the root `../dataset/` directory, extracts column attributes, strips nested year identifiers using regular expression capture maps, and escapes unsafe single quotes.
2. **Plaintext SQL Generation:** Instead of running immediate database calls, the Python driver serializes structural blueprints (`DROP TABLE`, `CREATE TABLE`) and thousands of formatted `INSERT INTO` parameters directly into an intermediate text script named `db_init.sql`.
3. **Piping & Database Generation:** The `db_init.bat` shell pipeline pipes the full text script down to the native machine terminal tool via `sqlite3 movies_rating.db < db_init.sql`. The engine reads the raw input directives, builds a clean binary structural payload file named `movies_rating.db`, and completes the ingestion.

---

## Why It Is Fast
* **The Problem:** By default, every isolated `INSERT` query executed in SQLite initiates an implicit disk write cycle (Auto-commit mode). Processing thousands of independent file transactions forces the physical hard drive/SSD headers to lock, write, and verify changes iteratively, causing execution time to stall.
* **The Solution:** This implementation wraps the entire sequence of `INSERT` string commands inside a structural block-transaction block using:
  ```sql
  BEGIN TRANSACTION;
  -- Thousands of database insert lines live here...
  COMMIT;
  ```
* **The Result:** The transaction boundary blocks tell the database engine to cache all operational steps inside the computer's volatile high-speed **RAM**. The entire data landscape is constructed in memory instantly, and SQLite flushes everything down to the solid-state disk array in one singular write operation at the very end. This architectural choice drops overall execution safely **under the 2-second time constraint threshold**  HOPEFULLY :).
