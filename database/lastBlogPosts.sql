SELECT title, end_date, content, alias
FROM articles
JOIN authors ON articles.authors_id=authors.id
ORDER BY start_date DESC LIMIT 10;