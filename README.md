# Re-creating README.md for Task 5 – SQL Joins after kernel reset

readme_content = """
#  Task 5 – SQL Joins (SQL Developer Internship)

This project demonstrates different types of SQL JOIN operations using the `StudentDB`, which contains `Students` and `Payments` tables. Each join is used to combine and analyze data across these related tables.

---

# Tables Used

- **Students**: Contains student personal and academic details.
- **Payments**: Records payment transactions made by students.

---

# Joins Demonstrated

# 1. INNER JOIN
Fetches only students who have made payments.
```sql
SELECT s.student_id, s.name, p.amount, p.payment_date
FROM Students s
INNER JOIN Payments p ON s.student_id = p.student_id;
