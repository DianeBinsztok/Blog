DELETE FROM comments
WHERE comments.articles_id = :postId;
DELETE FROM articles_has_categories
WHERE articles_has_categories.articles_id = :postId;
DELETE FROM articles
WHERE articles.id = :postId;
