create database SAAA;
use SAAA;

CREATE TABLE Tabela_Consultores (
    id_consultor VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    custo_hora DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Tabela_Projetos (
    id_projeto VARCHAR(10) PRIMARY KEY,
    nome_do_cliente VARCHAR(100) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    orcamento_total DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Tabela_Timesheet (
    id_registro VARCHAR(10) PRIMARY KEY,
    id_consultor VARCHAR(10),
    id_projeto VARCHAR(10),
    data_trabalhada DATE NOT NULL,
    horas_gastas INT NOT NULL,
    FOREIGN KEY (id_consultor) REFERENCES Tabela_Consultores(id_consultor),
    FOREIGN KEY (id_projeto) REFERENCES Tabela_Projetos(id_projeto)
);

INSERT INTO Tabela_Consultores (id_consultor, nome, cargo, custo_hora) VALUES
('ID056', 'Camila', 'Júnior', 40.00),
('ID378', 'Luana', 'Júnior', 45.00),
('ID379', 'Samanta', 'Sênior', 64.00),
('ID380', 'Isabela', 'Plêno', 42.00),
('ID398', 'Luisa', 'Plêno', 46.00),
('ID382', 'Elisa', 'Júnior', 48.00),
('ID341', 'Fernando', 'Plêno', 45.00),
('ID786', 'Manuela', 'Sênior', 68.00);

INSERT INTO Tabela_Projetos (id_projeto, nome_do_cliente, data_inicio, data_fim, orcamento_total) VALUES
('IDP09', 'Selma', '2025-09-17', '2026-02-14', 19860.00),
('IDP45', 'Janaína', '2025-11-17', '2026-04-17', 9960.00),
('IDP89', 'Flora', '2025-09-10', '2026-03-05', 10660.00),
('IDP77', 'Débora', '2025-09-04', '2026-04-12', 19520.00),
('IDP65', 'Miguel', '2025-11-21', '2026-03-12', 5130.00),
('IDP22', 'Mirela', '2025-12-05', '2026-04-10', 11800.00),
('IDP33', 'Maria', '2025-10-15', '2026-04-04', 16670.00),
('IDP34', 'Carminha', '2025-11-16', '2026-04-06', 9600.00);

INSERT INTO Tabela_Timesheet (id_registro, id_consultor, id_projeto, data_trabalhada, horas_gastas) VALUES
('IDR02', 'ID056', 'IDP09', '2025-10-23', 4),
('IDR03', 'ID341', 'IDP33', '2025-10-30', 3),
('IDR04', 'ID378', 'IDP45', '2025-12-04', 5),
('IDR05', 'ID056', 'IDP09', '2025-11-13', 4),
('IDR06', 'ID379', 'IDP89', '2025-12-14', 8),
('IDR07', 'ID380', 'IDP77', '2025-10-27', 7),
('IDR08', 'ID341', 'IDP33', '2025-10-19', 3),
('IDR09', 'ID378', 'IDP45', '2025-11-26', 5),
('IDR10', 'ID056', 'IDP09', '2025-11-06', 4),
('IDR11', 'ID398', 'IDP65', '2025-11-24', 3),
('IDR12', 'ID786', 'IDP34', '2025-12-02', 5),
('IDR13', 'ID379', 'IDP89', '2025-10-23', 8),
('IDR14', 'ID380', 'IDP77', '2025-10-04', 7),
('IDR15', 'ID341', 'IDP33', '2025-11-16', 3),
('IDR16', 'ID378', 'IDP45', '2025-12-06', 5),
('IDR17', 'ID056', 'IDP09', '2025-10-05', 4),
('IDR18', 'ID398', 'IDP65', '2025-11-18', 3),
('IDR19', 'ID786', 'IDP34', '2025-10-10', 5),
('IDR20', 'ID379', 'IDP89', '2025-11-03', 8),
('IDR21', 'ID382', 'IDP22', '2025-10-27', 4),
('IDR22', 'ID056', 'IDP09', '2025-11-09', 4),
('IDR23', 'ID341', 'IDP33', '2025-12-21', 3),
('IDR24', 'ID398', 'IDP65', '2025-10-25', 3),
('IDR25', 'ID341', 'IDP33', '2025-11-02', 3),
('IDR26', 'ID056', 'IDP09', '2025-09-19', 4),
('IDR27', 'ID398', 'IDP65', '2025-12-04', 3),
('IDR28', 'ID786', 'IDP34', '2025-10-17', 5);