Got it 💪 — here’s a **clean, professional, and perfectly formatted** version of your `README.md` for the **World Cup Database** project (no broken markdown, no formatting issues):

---

````markdown
# 🏆 World Cup Database

This repository contains my **World Cup Database** project for the **freeCodeCamp Relational Database Certification**.  
It demonstrates how to design, populate, and query a PostgreSQL database using **SQL** and **Bash scripting**.

---

## 📘 Project Overview

The goal of this project is to build a relational database that stores results from the final three rounds of the FIFA World Cup (since 2014).  
You will:
- Create and structure a PostgreSQL database.
- Populate it automatically using a Bash script.
- Query it to extract meaningful statistics about the games and teams.

---

## 🗂️ Files Included

| File | Description |
|------|--------------|
| `games.csv` | Dataset containing results of World Cup matches. |
| `insert_data.sh` | Bash script to insert teams and games data into the database. |
| `queries.sh` | Bash script containing SQL queries for analysis. |
| `worldcup.sql` | SQL dump file with the complete database (tables, data, constraints). |
| `expected_output.txt` | Expected results of all queries for testing. |

---

## 🏗️ Database Structure

### Table: `teams`

| Column | Type | Constraints |
|---------|------|-------------|
| `team_id` | SERIAL | PRIMARY KEY |
| `name` | VARCHAR | UNIQUE, NOT NULL |

### Table: `games`

| Column | Type | Constraints |
|---------|------|-------------|
| `game_id` | SERIAL | PRIMARY KEY |
| `year` | INT | NOT NULL |
| `round` | VARCHAR | NOT NULL |
| `winner_id` | INT | REFERENCES teams(team_id), NOT NULL |
| `opponent_id` | INT | REFERENCES teams(team_id), NOT NULL |
| `winner_goals` | INT | NOT NULL |
| `opponent_goals` | INT | NOT NULL |

---

## ⚙️ Setup and Usage

### 1. Create the database
```bash
psql --username=freecodecamp --dbname=postgres
CREATE DATABASE worldcup;
\c worldcup

### 2. Run the data insertion script

```bash
./insert_data.sh
```

### 3. Run the queries

```bash
./queries.sh
```

### 4. (Optional) Export your database

```bash
pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql
```

---

## ✅ Tests and Requirements

* The database must contain **24 unique teams**.
* There must be **32 game entries** in total.
* All table columns must have the **NOT NULL** constraint.
* The output of `queries.sh` must exactly match **expected_output.txt**.

---

## 🧠 Skills Demonstrated

* Database design and normalization
* PostgreSQL and SQL scripting
* Bash automation
* Data integrity and relational constraints
* Querying and statistical aggregation

---

## 🏁 Certification

This project is part of the **freeCodeCamp Relational Database Certification**.
Completing this project demonstrates proficiency in PostgreSQL, shell scripting, and data modeling.

---

**Author:** *Ahlem LOUNAS*
**Certification:** *freeCodeCamp Relational Database Projects*
**License:** *MIT*
```
````
