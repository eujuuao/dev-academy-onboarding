//Query 1 — Consultar timeline do pedido

SELECT
    t.vbeln,
    e.descricao AS etapa,
    t.data_hora,
    t.usuario
FROM tracking t
JOIN etapa e
    ON t.id_etapa = e.id_etapa
WHERE t.vbeln = '199000'
ORDER BY t.id_etapa;

//Query 2 — Verificar pedidos entregues

SELECT
    p.vbeln,
    t.data_hora AS data_entrega
FROM pedido p
JOIN tracking t
    ON p.vbeln = t.vbeln
WHERE t.id_etapa = 8
AND t.status = 'A';

//Query 3 — Consultar máquinas ativas

SELECT
    cod_barras,
    descricao,
    werks
FROM maquina
WHERE ativo = TRUE;

//Query 4 — Quantidade de pedidos por etapa
SELECT
    e.descricao,
    COUNT(*) AS total_pedidos
FROM tracking t
JOIN etapa e
    ON t.id_etapa = e.id_etapa
GROUP BY e.descricao
ORDER BY total_pedidos DESC;

//Query 5 — Última etapa de cada pedido
SELECT
    t.vbeln,
    MAX(t.id_etapa) AS ultima_etapa
FROM tracking t
GROUP BY t.vbeln;