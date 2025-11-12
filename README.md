
````markdown
# World Cup Database

This repository contains my **World Cup Database** project for the **freeCodeCamp Relational Database Certification**.  
It demonstrates how to design, populate, and query a PostgreSQL database using **SQL** and **Bash scripting**.

---

## Project Overview

The goal of this project is to build a relational database that stores results from the final three rounds of the FIFA World Cup (since 2014).  
You will:
- Create and structure a PostgreSQL database.
- Populate it automatically using a Bash script.
- Query it to extract meaningful statistics about the games and teams.

---

## Files Included

| File | Description |
|------|--------------|
| `games.csv` | Dataset containing results of World Cup matches. |
| `insert_data.sh` | Bash script to insert teams and games data into the database. |
| `queries.sh` | Bash script with SQL queries to extract statistics. |
| `worldcup.sql` | SQL dump file containing the full database (tables, data, constraints). |

---

## Database Design

### Tables

#### `teams`
| Column | Type | Constraints |
|---------|------|-------------|
| `team_id` | SERIAL | PRIMARY KEY |
| `name` | VARCHAR | UNIQUE, NOT NULL |

#### `games`
| Column | Type | Constraints |
|---------|------|-------------|
| `game_id` | SERIAL | PRIMARY KEY |
| `year` | INT | NOT NULL |
| `round` | VARCHAR | NOT NULL |
| `winner_id` | INT | FOREIGN KEY → `teams.team_id`, NOT NULL |
| `opponent_id` | INT | FOREIGN KEY → `teams.team_id`, NOT NULL |
| `winner_goals` | INT | NOT NULL |
| `opponent_goals` | INT | NOT NULL |

---

## Setup and Usage

### 1. Create the database
```bash
psql --username=freecodecamp --dbname=postgres
CREATE DATABASE worldcup;
\c worldcup
````

### 2. Run the data insertion script

```bash
./insert_data.sh
```

### 3. Run the queries

```bash
./queries.sh
```

### 4. Export your database (optional)

```bash
pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql
```

---

## Requirements / Tests

* The database must contain **24 unique teams**.
* There must be **32 games** inserted.
* All columns must be **NOT NULL**.
* The output of `queries.sh` must exactly match `expected_output.txt`.

---

## Skills Demonstrated

* Database design and normalization
* PostgreSQL and SQL scripting
* Bash automation
* Data integrity and foreign key management
* Query optimization and data analysis

---

## Certification

This project is part of the **freeCodeCamp Relational Database Certification**.
Completing this project demonstrates proficiency in PostgreSQL, shell scripting, and data modeling.

---

**Author:** Ahlem LOUNAS
**Certification:** freeCodeCamp Relational Database Projects
**License:** MIT

```

