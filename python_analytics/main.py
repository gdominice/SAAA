import pandas as pd

# Definir Funções
def calcular_custos_agregados(df_input):
    df_input['custo_total_linha'] = df_input['horas_gastas'] * df_input['custo_hora']
    return df_input.groupby('nome')['custo_total_linha'].sum()

def calcular_soma_horas(df_input):
    return df_input.groupby('id_consultor')['horas_gastas'].sum()

# Carregar Dados
caminho_arquivo = "/home/gibapc/Giba/projetos/Projeto-SAAA-Auditoria/planilhas_excel/saaa_planilha.xlsx"

df_timesheet = pd.read_excel(caminho_arquivo, sheet_name='SAAA - Timesheet', header=2, usecols="B:F")
df_consultores = pd.read_excel(caminho_arquivo, sheet_name='SAAA - Consultores', header=2, usecols="B:E")
df_projetos = pd.read_excel(caminho_arquivo, sheet_name='SAAA - Projetos', header=2, usecols="B:F")
df_despesas = pd.read_excel(caminho_arquivo, sheet_name='SAAA - Despesas', header=2, usecols="B:F")

# Joins
df_tc = pd.merge(df_timesheet, df_consultores, on='id_consultor', how='left')
df_tcp = pd.merge(df_tc, df_projetos, on='id_projeto', how='left')

df_despesas['custo_total_linha'] = df_despesas['valor_despesa']

# Armazenar Cálculos
resumo_custos = calcular_custos_agregados(df_tcp)
resumo_despesas = df_despesas.groupby('id_projeto')['custo_total_linha'].sum()
resumo_horas = calcular_soma_horas(df_tcp)
