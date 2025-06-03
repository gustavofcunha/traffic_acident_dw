import pandas as pd

times = []
for h in range(24):
    for m in range(60):
        times.append({
            'chave_tempo': int(f"{h:02d}{m:02d}"),
            'hora': h,
            'minuto': m
        })

dim_tempo = pd.DataFrame(times)
dim_tempo.to_csv('dim_tempo.csv', index=False)
