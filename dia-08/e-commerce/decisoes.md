# Decisões de Projeto — E-commerce

## 1. Uso de entidade associativa Order_Items

O relacionamento entre pedidos e produtos é N:N.
Um pedido pode possuir vários produtos e um produto pode aparecer em vários pedidos.

Por isso foi criada a entidade associativa `order_items`.

Além de resolver o N:N, ela armazena:
- quantidade
- preço histórico
- subtotal

---

## 2. Snapshot de preço

O preço do produto foi salvo em `order_items.unit_price`.

Isso garante integridade histórica:
mesmo que o preço do produto mude futuramente,
o pedido continua refletindo o valor original da compra.

---

## 3. Snapshot de endereço

O endereço foi salvo diretamente em `orders.shipping_address`.

O objetivo é preservar o endereço utilizado no momento da compra,
mesmo que o cliente altere seus dados posteriormente.

---

## 4. Normalização

O modelo foi construído respeitando:
- 1FN: sem grupos repetidos
- 2FN: atributos dependem da chave inteira
- 3FN: sem dependências transitivas

---

## 5. Integridade

Foram utilizadas:
- PKs para unicidade
- FKs para integridade referencial
- CHECK para valores inválidos
- UNIQUE para email