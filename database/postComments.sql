SELECT date, content, alias
FROM comments
         JOIN authors
              ON comments.authors_id = authors.id
