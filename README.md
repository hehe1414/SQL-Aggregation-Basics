# SQL Aggregation Basics – Northwind

**Task 23 – SQL Aggregation Basics**
Veda Technology | Data Analytics Track | Level 1, Day 23

## About
I wrote 10 SQL queries that use the aggregate functions `COUNT`, `SUM`, `AVG`, `MIN` and `MAX` on the Northwind sample database, combined them with `GROUP BY`, and checked how aggregates treat `NULL` values. I saved a screenshot of each result.

**Where I ran them:**the W3Schools Try-SQL editor, which has the Northwind sample database (it runs SQLite).

## What each function does
| Function | What it does |
|----------|--------------|
| `COUNT(*)` | Counts rows |
| `SUM(column)` | Adds up the values |
| `AVG(column)` | Gives the average |
| `MIN(column)` / `MAX(column)` | Give the smallest and largest value |
| `GROUP BY` | Splits the rows into groups so each aggregate is calculated per group |

## The 10 queries and their results
| # | Question | Functions | Result | Output |
|---|----------|-----------|--------|--------|
| 1 | How many customers are there? | COUNT | 91 | `q1.png` |
| 2 | How many products, and the average price? | COUNT, AVG | 77 | `q2.png` |
| 3 | Cheapest and most expensive price | MIN, MAX | 77 | `q3.png` |
| 4 | Total units ordered | SUM | 12743 | `q4.png` |
| 5 | How many orders are there? | COUNT | 196 | `q5.png` |
| 6 | Customers per country | COUNT + GROUP BY | USA ..| `q6.png` |
| 7 | Products and average price per category | COUNT, AVG + GROUP BY | 8 | `q7.png` |
| 8 | Orders handled per employee | COUNT + GROUP BY | 9 | `q8.png` |
| 9 | Total units ordered per product | SUM + GROUP BY | 77 | `q9.png` |
| 10 | NULL behavior test | COUNT, SUM, AVG | 1 | `q10.png` |

The full queries are in `queries.sql`.

## How I checked my results
- The grouped counts add up to the totals: the customers per country (Query 6) add up to Query 1, the products per category (Query 7) add up to the product count in Query 2, and the orders per employee (Query 8) add up to Query 5
- Query 3 shows the same cheapest and most expensive prices that I see when I sort the Products table

## NULL behavior (Query 10)
I made a tiny test table with the scores 10, 20, NULL and 30:

| Measure | Result | What it shows |
|---------|--------|---------------|
| `COUNT(*)` | 4 | Counts every row, including the NULL row |
| `COUNT(Score)` | 3 | Skips the NULL |
| `SUM(Score)` | 60 | Ignores the NULL |
| `AVG(Score)` | 20 | Divides by 3, not 4, because the NULL is ignored |
| `AVG(COALESCE(Score, 0))` | 15 | Treats the NULL as 0, which changes the average |

**Lesson:** aggregate functions skip NULLs, so `COUNT(*)` and `COUNT(column)` can give different numbers, and the average can be misleading if missing values really mean zero.

## What I learned
- Every column in `SELECT` must either be in `GROUP BY` or be inside an aggregate function
- `COUNT(*)` counts rows, but `COUNT(column)` counts only the non-NULL values
- `AVG` ignores NULLs, so I need to decide whether missing means "unknown" or "zero"

## Files
- `queries.sql` – the 10 queries
- `outputs/` – a screenshot of each result
- `README.md`

## Tools used
SQL (Northwind sample database)

## Author
Rabia
