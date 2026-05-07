# Dicionário de Dados — E-commerce

## customers

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| customer_id | SERIAL | Identificador do cliente | PK |
| full_name | VARCHAR(150) | Nome completo | NOT NULL |
| email | VARCHAR(150) | Email do cliente | NOT NULL, UNIQUE |
| phone | VARCHAR(20) | Telefone | NULL |
| created_at | TIMESTAMP | Data de criação | NOT NULL |

---

## categories

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| category_id | SERIAL | Identificador da categoria | PK |
| name | VARCHAR(100) | Nome da categoria | NOT NULL, UNIQUE |

---

## products

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| product_id | SERIAL | Identificador do produto | PK |
| category_id | INT | Categoria do produto | FK, NOT NULL |
| name | VARCHAR(150) | Nome do produto | NOT NULL |
| description | TEXT | Descrição do produto | NULL |
| current_price | NUMERIC(10,2) | Preço atual | NOT NULL |
| stock_quantity | INT | Estoque atual | NOT NULL |

---

## orders

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| order_id | SERIAL | Identificador do pedido | PK |
| customer_id | INT | Cliente do pedido | FK, NOT NULL |
| order_date | TIMESTAMP | Data do pedido | NOT NULL |
| status | VARCHAR(30) | Status do pedido | NOT NULL |
| shipping_address | TEXT | Endereço snapshot | NOT NULL |
| total_amount | NUMERIC(10,2) | Valor total | NOT NULL |

---

## order_items

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| order_item_id | SERIAL | Identificador do item | PK |
| order_id | INT | Pedido | FK, NOT NULL |
| product_id | INT | Produto | FK, NOT NULL |
| quantity | INT | Quantidade | NOT NULL |
| unit_price | NUMERIC(10,2) | Preço snapshot | NOT NULL |
| subtotal | NUMERIC(10,2) | Valor parcial | NOT NULL |

---

## payments

| Coluna | Tipo | Descrição | Restrições |
|---|---|---|---|
| payment_id | SERIAL | Identificador do pagamento | PK |
| order_id | INT | Pedido pago | FK, NOT NULL |
| payment_method | VARCHAR(50) | Método de pagamento | NOT NULL |
| payment_date | TIMESTAMP | Data do pagamento | NULL |
| amount | NUMERIC(10,2) | Valor pago | NOT NULL |
| status | VARCHAR(30) | Status do pagamento | NOT NULL |