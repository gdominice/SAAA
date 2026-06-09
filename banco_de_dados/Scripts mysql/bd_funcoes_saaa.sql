CREATE INDEX idx_timesheet_data_projeto 
ON Tabela_Timesheet (data_trabalhada, id_projeto);

DELIMITER //
CREATE FUNCTION fn_soma_horas (fn_id VARCHAR(6))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE soma_total_horas int;

SELECT sum(horas_gastas) into soma_total_horas
FROM Tabela_Timesheet
WHERE id_consultor = fn_id;

RETURN soma_total_horas;
END //
DELIMITER ;

SELECT fn_soma_horas('ID056');

DELIMITER //
CREATE FUNCTION fn_custos_agregados(v_ID VARCHAR(6))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE v_custo_hora DECIMAL(10,2);
DECLARE v_horas_gastas INT;

SELECT custo_hora INTO v_custo_hora
FROM Tabela_Consultores
WHERE Tabela_Consultores.id_consultor = v_ID;

SET v_horas_gastas = fn_soma_horas(v_ID);

RETURN v_custo_hora * v_horas_gastas;
END //
DELIMITER ;

SELECT fn_custos_agregados('ID056');