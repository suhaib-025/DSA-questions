# DSA Question Bank

A growing collection of data-structures, algorithms, and database questions I have solved.

This repository serves two purposes:

- **Interview preparation:** show the topics, patterns, and question types I have covered.
- **Revision:** quickly revisit solutions, concepts, and common approaches before interviews.

## Progress snapshot

| Topic | Questions solved |
| --- | ---: |
| SQL | 6 |
| Arrays | — |
| Strings | — |
| Linked Lists | — |
| Trees | — |
| Graphs | — |
| Dynamic Programming | — |

> I will update this table as the repository grows.

## Repository structure

Each topic has its own directory. Within it, each solution should include the problem statement, solution, key concepts, explanation, and complexity notes where useful.

```text
DSA-questions/
├── SQL/
├── Arrays/
├── Strings/
├── Linked-Lists/
├── Trees/
├── Graphs/
└── Dynamic-Programming/
```

## Topics

- [SQL](#sql)
- Arrays *(coming soon)*
- Strings *(coming soon)*
- Linked Lists *(coming soon)*
- Trees *(coming soon)*
- Graphs *(coming soon)*
- Dynamic Programming *(coming soon)*

## SQL

| # | Problem | Key concepts |
| ---: | --- | --- |
| 175 | [Combine Two Tables](SQL/Combine%20two%20table(175).sql) | LEFT JOIN, table aliases |
| 178 | [Rank Scores](SQL/Rank%20Scores(178).sql) | correlated subquery, dense ranking, `COUNT(DISTINCT)` |
| 180 | [Consecutive Numbers](SQL/ConsecutiveNums.sql) | self join, `DISTINCT`, consecutive rows |
| 181 | [Employees Earning More Than Their Managers](SQL/Employee%20Earning%20more%20than%20Manager(181).sql) | self join, comparisons |
| 182 | [Duplicate Emails](SQL/Dubliicate%20Emails(182).sql) | `GROUP BY`, `HAVING`, aggregation |
| 183 | [Customers Who Never Order](SQL/Customer%20Who%20Never%20Order(183).sql) | LEFT JOIN, NULL handling |

## How I add a new question

1. Add the solution under the relevant topic directory.
2. Include the question number and title in the filename when available.
3. Add a row to that topic's table above.
4. Update the progress snapshot.

## Goals

- Build consistent coverage across core DSA topics.
- Record the patterns behind solutions, not only final answers.
- Maintain a practical revision resource for interviews.
