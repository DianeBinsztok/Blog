SELECT title, end_date, content, alias
FROM articles
JOIN authors ON articles.authors_id=authors.id

