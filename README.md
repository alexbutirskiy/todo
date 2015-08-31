## Ruby Garage test TODO list and SQL task
---

#### SQL TASK
```sql
-- Postgres
CREATE TABLE projects (
  id SERIAL PRIMARY KEY,
  name varchar(255)
);

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  name varchar(255),
  status varchar(255),
  project_id int
);
```

**1. get all statuses, not repeating, alphabetically ordered**
```sql
('
SELECT DISTINCT status 
FROM tasks 
ORDER BY status ASC;
')
```
---
**2. get the count of all tasks in each project, order by tasks count descending**
```sql
SELECT projects.name, COUNT(tasks.name) AS task_count
FROM projects
LEFT JOIN tasks
ON tasks.project_id=projects.id
GROUP BY projects.name
ORDER BY task_count DESC;
```
---
**3. get the count of all tasks in each project, order by projects names**
```sql
SELECT projects.name, COUNT(tasks.name) AS task_count
FROM projects
INNER JOIN tasks
ON tasks.project_id=projects.id
GROUP BY projects.name
ORDER BY projects.name;
```
---
**4. get the tasks for all projects having the name beginning with “N” letter**
```sql
SELECT * from tasks
WHERE name LIKE 'N%';
```
---
**5. get the list of all projects containing the ‘a’ letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id=NULL**
```sql
SELECT projects.name, COUNT(tasks.name) AS task_count
FROM projects
LEFT JOIN tasks
ON tasks.project_id=projects.id
WHERE projects.name LIKE '_%a%_'
GROUP BY projects.name;
```
---
**6. get the list of tasks with duplicate names. Order alphabetically**
```sql
SELECT name
FROM tasks
GROUP BY name
HAVING (COUNT(name)>1)
ORDER by name;
```
---
**7. get the list of tasks having several exact matches of both name and status, from the project ‘Garage’. Order by matches count**
```sql
SELECT t.name, t.cnt
FROM
  (
    SELECT tasks.name, status, project_id, COUNT(tasks.name) AS cnt 
    FROM tasks
    INNER JOIN projects
    ON projects.id=tasks.project_id
    WHERE projects.name = 'Garage'
    GROUP BY tasks.name, status, project_id
    HAVING (COUNT(tasks.name)>1)
  ) t
GROUP BY t.name, t.cnt
ORDER BY t.cnt;
```
---
**8. get the list of project names having more than 10 tasks in status ‘completed’. Order by project_id**
```sql
SELECT prj.name
FROM
(
  SELECT projects.name, projects.id, COUNT (c.name) AS cnt
  FROM projects
  LEFT JOIN
  ( SELECT * FROM tasks WHERE status='completed' ) c
  ON projects.id=c.project_id
  GROUP BY projects.id
) prj
WHERE cnt>10
ORDER BY prj.id;
```
