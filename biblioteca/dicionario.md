# Dicionário de Dados — Biblioteca

## users

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| user_id | SERIAL | Identificador do usuário | PK |
| full_name | VARCHAR(150) | Nome | NOT NULL |

---

## books

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| book_id | SERIAL | Identificador do livro | PK |
| title | VARCHAR(200) | Título | NOT NULL |
| author | VARCHAR(150) | Autor | NOT NULL |
| isbn | VARCHAR(20) | ISBN | UNIQUE |

---

## copies

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| copy_id | SERIAL | Exemplar físico | PK |
| book_id | INT | Livro relacionado | FK, NOT NULL |
| status | VARCHAR(30) | Disponibilidade | NOT NULL |

---

## loans

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| loan_id | SERIAL | Empréstimo | PK |
| copy_id | INT | Exemplar emprestado | FK, NOT NULL |
| user_id | INT | Usuário | FK, NOT NULL |
| loan_date | DATE | Data empréstimo | NOT NULL |
| due_date | DATE | Data devolução prevista | NOT NULL |
| return_date | DATE | Data devolução real | NULL |
| fine_amount | NUMERIC(10,2) | Multa | NOT NULL |