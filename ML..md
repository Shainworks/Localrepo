## 1
```python
import pandas as pd 
import numpy as np 
import matplotlib.pyplot as plt 
dataset = pd.read_csv("suv_data.csv") 
dataset.head() 
x = dataset.iloc[:, [2, 3]].values 
y = dataset.iloc[:, 4].values 
bool_series=pd.isnull(dataset["Gender"]) 
dataset[bool_series] 
bool_series=pd.notnull(dataset["Gender"]) 
dataset[bool_series] 
dataset[10:25]
new_data=dataset.dropna(axis=0,how='any') 
new_data 
dataset.replace(to_replace=np.nan,value=-99) 
dataset["Gender"].fillna("No Gender",inplace=True) 
dataset
print("Old data frame length:", len(dataset)) 
print("New data frame length:", len(dataset)) 
print("Number of rows with at least 1 NA value:", len(dataset)-len(new_data)) 
new_df1=dataset.fillna(method="ffill") 
new_df1
new_df3=dataset.dropna(how='all') 
new_df3 
```
## 2
```python
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
```
## 3
```python
from pandas import read_csv 
from numpy import set_printoptions 
from sklearn.model_selection import train_test_split 
from sklearn.feature_selection import SelectKBest 
from sklearn.feature_selection import f_classif 
from matplotlib import pyplot 
path=r'diabetes.csv' 
names=['preg','plas','pres','skin','test','mass','peds','age','class'] 
dataframe=read_csv(path,names=names) 
dataframe.head() 
array=dataframe.values 
x=array[:,0:8] 
y=array[:,8] 
print(x) 
print(y)
x_train,x_test,y_train,y_test,=train_test_split(x,y,test_size=0.33,random_state=1) 
fs= SelectKBest(score_func=f_classif,k='all') 
fs.fit(x_train,y_train) 
x_train_fs=fs.transform(x_train) 
x_test_fs=fs.transform(x_test) 
for i in range(len(fs.scores_)): 
print('feature %d:%f'%(i,fs.scores_[i])) 
pyplot.bar([i for i in range(len(fs.scores_))],fs.scores_) 
pyplot.show()
```
## 4
```python
import numpy as np 
import pandas as pd  
import matplotlib.pyplot as plt  
import seaborn as sns  
from sklearn.feature_selection import chi2 
df=pd.read_csv('loandata.csv') 
df.head() 
df=df[['Gender','Married','Dependents','Education','Self_Employed','Credit_History','Property
 _Area','Loan_Status']] 
df.head() 
#label encoding 
from sklearn.preprocessing import LabelEncoder 
for col in df.columns: 
le=LabelEncoder() 
df[col]=le.fit_transform(df[col]) 
df.head()
x=df.iloc[:,0:6] 
y=df.iloc[:,-1] 
f_score=chi2(x,y) 
f_score 
p_value=pd.Series(f_score[1], index=x.columns) 
p_value.sort_values(ascending=False,inplace=True) 
p_value 
p_value.plot(kind="bar") 
plt.xlabel("Features", fontsize=20) 
plt.ylabel("p_values", fontsize=20) 
plt.title("chi squared test base on p value") 
plt.show()
```
## 5
```python
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from sklearn import tree
from sklearn import metrics
from sklearn.metrics import accuracy_score, classification_report
from sklearn.datasets import load_iris
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split

iris = load_iris()
iris = sns.load_dataset('iris')
iris.head()
x=iris.iloc[:,:-1]
y=iris.iloc[:,-1]
x_train, x_test, y_train, y_test = train_test_split(x,y, test_size=0.33, random_state=42)
treemodel = DecisionTreeClassifier()
treemodel.fit(x_train, y_train)
y_pred = treemodel.predict(x_test)
plt.figure(figsize=(20,30))
tree.plot_tree(treemodel, filled=True)
print(classification_report(y_test, y_pred))
from sklearn.metrics import confusion_matrix
cm=confusion_matrix(y_test, y_pred)
print("Confusion Matrix:")
print(cm)
from sklearn.metrics import accuracy_score
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy of Decision Tree Model:", accuracy)
```
## 6
```python
import numpy as nm
import matplotlib.pyplot as mtp
import pandas as pd

dataset = pd.read_csv('User_Data.csv')
x= dataset.iloc[:,[2,3]].values
print(x)
y = dataset.iloc[:,4].values
print(y)
from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x,y, test_size=0.25, random_state=0)
from sklearn.preprocessing import StandardScaler
sc= StandardScaler()
x_train = sc.fit_transform(x_train)
x_test = sc.fit_transform(x_test)
from sklearn.naive_bayes import GaussianNB
classifier = GaussianNB()
classifier.fit(x_train , y_train)
y_pred= classifier.predict(x_test)
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)
print("Confusion Matrix:")
print(cm)
from sklearn.metrics import accuracy_score
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy of Decision Tree Model:", accuracy)
```
