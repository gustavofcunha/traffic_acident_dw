import pandas as pd

date_range = pd.date_range(start='2020-01-01', end='2022-12-31', freq='D')

meses_pt = {
    1: 'janeiro', 2: 'fevereiro', 3: 'março', 4: 'abril',
    5: 'maio', 6: 'junho', 7: 'julho', 8: 'agosto',
    9: 'setembro', 10: 'outubro', 11: 'novembro', 12: 'dezembro'
}

dias_semana_pt = {
    0: 'segunda-feira', 1: 'terça-feira', 2: 'quarta-feira',
    3: 'quinta-feira', 4: 'sexta-feira', 5: 'sábado', 6: 'domingo'
}

dim_date = pd.DataFrame({
    'chave_data': date_range.strftime('%Y%m%d').astype(int),
    'dia': date_range.day,
    'mes': date_range.month,
    'mes_descricao': date_range.month.map(meses_pt),
    'ano': date_range.year,
    'dia_semana': date_range.weekday.map(dias_semana_pt)
})

dim_date.to_csv('/home/gustavocunha/tp_final_ad/seeds/data.csv', index=False)
