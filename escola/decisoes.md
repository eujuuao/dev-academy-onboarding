# Decisões de Projeto — Escola

## 1. Relação N:N resolvida com enrollments

Alunos e disciplinas possuem relação N:N.

Porém a modelagem correta ocorre através da entidade `classes`,
pois disciplinas acontecem em turmas específicas.

A entidade `enrollments` resolve:
- qual aluno entrou
- em qual turma
- em qual data
- nota final

---

## 2. Separação entre Subject e Class

Disciplina representa o conteúdo.
Turma representa a oferta daquela disciplina em um semestre específico.

Isso evita redundância e melhora escalabilidade.

---

## 3. Integridade

Foi criada UNIQUE(student_id, class_id)
para impedir matrícula duplicada.

---

## 4. Normalização

O modelo evita:
- duplicação de professores
- duplicação de disciplinas
- dependências transitivas

Mantendo 1FN, 2FN e 3FN.