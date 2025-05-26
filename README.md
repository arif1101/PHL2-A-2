## Q-1. What is PostgreSQL?

PostgreSQL is a free, open-source database system that supports both relational (SQL) and non-relational (JSON) queries.  
It is widely used as a back-end database for dynamic websites and web applications, financial systems, scientific and research databases, as well as mobile and IoT apps.

**PostgreSQL supports many programming languages:** Python, Java, C/C++, C#, Node.js, Go, Ruby, Perl, and Tcl.

PostgreSQL was developed at the Computer Science Department of the University of California, Berkeley.

### Key Features

- **Open-Source:** Free to use, modify, and distribute.
- **Relational:** Uses tables with rows and columns to store data.
- **SQL & Advanced Queries:** Supports standard SQL and advanced querying capabilities.
- **ACID Compliant:** Ensures data integrity through Atomicity, Consistency, Isolation, and Durability.
- **Extensible:** You can create your own data types, functions, and more.
- **Supports JSON & XML:** Handles both structured and semi-structured data.
- **Cross-Platform:** Runs on Linux, Windows, macOS, and more.

## Q-2. What is the purpose of a database schema in PostgreSQL?

A schema is like a folder inside your PostgreSQL database.

Just as you organize different types of files into folders on your computer, PostgreSQL organizes tables, views, and other objects into schemas.

### Why is a Schema Useful?

- **Organize things:** Keeps your database neat and clean.
- **Avoid name conflicts:** You can use the same table name in different schemas.
- **Set permissions:** Control who can see or change what’s inside a schema.
- **Work safely:** Different teams or users can work in separate schemas without interfering with each other.

## Q-3. Explain PK (Primary Key) and FK (Foreign Key)

**Primary Key (PK):**  
A Primary Key is like a unique ID for each row in a table.
- Each row must be different (unique).
- The key cannot be empty (NOT NULL).

**Example:**
```sql
CREATE TABLE persons (
  person_id SERIAL PRIMARY KEY,
  name TEXT
);
```
Here, `person_id` is the Primary Key. It gives each person a unique number like 1, 2, 3, etc.

---

**Foreign Key (FK):**  
A Foreign Key is used to connect two tables.
- It is a column in one table that refers to the Primary Key in another table.

**Example:**
```sql
CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY,
  name TEXT,
  person_id INT REFERENCES persons(person_id) NOT NULL
);
```
Here, `person_id` in the `employees` table is a Foreign Key. It links each employee to a person in the `persons` table.