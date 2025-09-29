import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
data = pd.read_csv('Titanic-Dataset.csv')
print(data)
x = data.drop('Survived', axis = 1)
y = data['Survived']
print(x)
print(y)
x.drop(['Name', 'Ticket', 'Cabin'],axis = 1, inplace = True)
print(x)
x['Age'] = x['Age'].fillna(x['Age'].mean())
print(x)
x['Embarked'] = x['Embarked'].fillna(x['Embarked'].mode()[0])
print(x)
x = pd.get_dummies(x, columns = ['Sex', 'Embarked'],prefix = ['Sex', 'Embarked'],drop_first 
= True)
print(x)
from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size = 0.2, random_state = 0)
print(x_train)
print(y_train)
from sklearn.preprocessing import StandardScaler
std_x = StandardScaler()
x_train = std_x.fit_transform(x_train)
x_test = std_x.transform(x_test)
print(x_train)