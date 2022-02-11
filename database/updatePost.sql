UPDATE articles
SET authors_id = :newAuthor,
    title = :newTitle,
    start_date = :newStartDate,
    end_date = :newEndDate,
    content = :newContent,
    importance_level = :newImportance
WHERE articles.id = :postId;
