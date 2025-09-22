SELECT lb.book_id, title, author, genre, publication_year, null_count as current_borrowers
FROM library_books lb
JOIN (
    SELECT book_id, SUM(CASE WHEN return_date IS NULL THEN 1 ELSE 0 END) AS null_count
    FROM borrowing_records
    GROUP BY book_id ) as h
    ON h.book_id = lb.book_id
    WHERE null_count = total_copies
    ORDER BY current_borrowers DESC, title ASC