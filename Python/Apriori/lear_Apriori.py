import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from apyori import apriori
store_data = pd.read_csv('store_data.csv', header=None)

  
records = store_data.astype(str).values.tolist()

association_rules = apriori(records, min_support=0.0015, min_confidence=0.1, min_lift=2, min_length=2)
association_results = list(association_rules)


data = []
for item in association_results:
    pair = item[0]
    items = [x for x in pair]
  #  for bufitems in items:
  #     if 'nan' in bufitems:
  #         continue
    rule = ''
    for bufitems in items:
        rule = rule + bufitems + ' -> '
    if 'nan' in rule:
        continue
    rows = []
    rows.append(rule)
    rows.append(item[1])
    rows.append(item[2][0][2])
    rows.append(item[2][0][3])
    data.append(rows)
labels = ['rule','support','confidence','lift']
df = pd.DataFrame.from_records(data, columns=labels)
df.to_csv('out.csv',index=False)
print('done')
