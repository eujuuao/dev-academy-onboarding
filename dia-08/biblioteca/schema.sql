CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) UNIQUE
);

CREATE TABLE copies (
    copy_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL,
    status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_copies_book
        FOREIGN KEY (book_id)
        REFERENCES books(book_id)
);

CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,
    copy_id INT NOT NULL,
    user_id INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    fine_amount NUMERIC(10,2) NOT NULL DEFAULT 0 CHECK (fine_amount >= 0),

    CONSTRAINT fk_loans_copy
        FOREIGN KEY (copy_id)
        REFERENCES copies(copy_id),

    CONSTRAINT fk_loans_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
);