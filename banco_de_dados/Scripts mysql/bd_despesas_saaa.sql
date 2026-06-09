CREATE VIEW resumo_despesas_clientes AS
SELECT nome_do_cliente, tipo_despesa, SUM(valor_despesa) AS total_despesas
FROM Tabela_Projetos
INNER JOIN Tabela_Despesas USING (id_projeto)
GROUP BY nome_do_cliente, tipo_despesa;

ALTER TABLE Tabela_Despesas
ADD CONSTRAINT chk_valor_positivo CHECK (valor_despesa > 0);