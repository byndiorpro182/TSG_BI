'''
#1 : thu thập dữ liệu
#2 : xử lý dữ liệu
#3 : xây dựng model
#4 : dự đoán kết quả
#5 : đánh giá xem model có hiệu quả hay không
'''
from sklearn import tree
import pandas as pd

df  = pd.read_excel('dataSample.xlsx','Sheet2')
data = df.iloc[:250,1:9].values.tolist()
label = []
for i in range(0,250):
    label.append(df.iloc[:250,9:10].values[i][0])

awsLabel = []
for i in range(0,6):
    awsLabel.append(df.iloc[250:256,9:10].values[i][0])
    

aws = df.iloc[250:256,1:9].values.tolist()

my_tree = tree.DecisionTreeClassifier()
learn = my_tree.fit(data,label)
result = learn.predict(aws)
print(learn.score(aws,awsLabel))


