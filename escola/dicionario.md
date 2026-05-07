# Dicionário de Dados — Escola

## students

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| student_id | SERIAL | Identificador do aluno | PK |
| full_name | VARCHAR(150) | Nome do aluno | NOT NULL |
| birth_date | DATE | Data de nascimento | NOT NULL |
| email | VARCHAR(150) | Email | UNIQUE |

---

## teachers

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| teacher_id | SERIAL | Identificador do professor | PK |
| full_name | VARCHAR(150) | Nome do professor | NOT NULL |

---

## subjects

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| subject_id | SERIAL | Identificador da disciplina | PK |
| name | VARCHAR(100) | Nome da disciplina | NOT NULL |

---

## classes

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| class_id | SERIAL | Identificador da turma | PK |
| subject_id | INT | Disciplina | FK, NOT NULL |
| teacher_id | INT | Professor | FK, NOT NULL |
| semester | VARCHAR(20) | Semestre letivo | NOT NULL |

---

## enrollments

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| enrollment_id | SERIAL | Identificador da matrícula | PK |
| student_id | INT | Aluno | FK, NOT NULL |
| class_id | INT | Turma | FK, NOT NULL |
| enrollment_date | DATE | Data da matrícula | NOT NULL |
| final_grade | NUMERIC(4,2) | Nota final | NULL |