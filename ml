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
https://drive.google.com/drive/folders/1SLV9dpMdTekcrZCdF24FS4iGCiPMugDC?usp=drive_link
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