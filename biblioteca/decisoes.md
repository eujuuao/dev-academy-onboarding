# Decisões de Projeto — Biblioteca

## 1. Separação entre Book e Copy

Livro representa a obra conceitual.
Copy representa o exemplar físico.

Isso permite:
- múltiplas cópias
- disponibilidade individual
- rastreamento físico

---

## 2. Controle de disponibilidade

O status foi colocado em `copies`,
pois cada exemplar possui estado próprio.

Exemplos:
- AVAILABLE
- LOANED
- LOST
- MAINTENANCE

---

## 3. Histórico de empréstimos

A tabela `loans` preserva:
- quem pegou
- quando pegou
- quando devolveu
- multa aplicada

Garantindo rastreabilidade histórica.

---

## 4. Integridade

As FKs impedem:
- empréstimo de exemplar inexistente
- empréstimo por usuário inexistente

---

## 5. Normalização

O modelo evita redundância:
- autor não se repete em empréstimos
- usuário não se repete em livros
- exemplar não mistura dados da obra