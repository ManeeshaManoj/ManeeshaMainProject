# Voting Ensemble for Classification

import numpy
import pandas
from sklearn import model_selection
from sklearn.externals import joblib
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.svm import SVC
from sklearn.ensemble import VotingClassifier


arr = []
url = "inputdata.csv"
names = ['lanslide_type', 'trigger', 'landslide_size', 'distance_to_river', 'elevation', 'aspect', 'soil_type', 'latitude', 'longitude','class_label']
dataframe = pandas.read_csv(url, names=names)
array = dataframe.values

X = array[:, 0:9]
Y = array[:, 9]
def training():
    global  X,Y
    seed = 7
    kfold = model_selection.KFold(n_splits=10, random_state=seed)
    # create the sub models
    estimators = []
    model1 = LogisticRegression()
    estimators.append(('logistic', model1))
    model2 = LogisticRegression()
    estimators.append(('logistic1', model2))
    model3 =LogisticRegression()
    estimators.append(('logistic2', model3))
    # create the ensemble model
    ensemble = VotingClassifier(estimators)

    results = model_selection.cross_val_score(ensemble, X, Y, cv=kfold)
    print("=============",results.mean())
    ensemble.fit(X,Y)
    joblib.dump(ensemble,"ds.joblib")

def predict(x):
    em=joblib.load("ds.joblib")
    global X,Y
    return (em.predict(numpy.array( [x])))
training()

# features=[0,0,0,2532,37,1,4,11.67372,75.750954];
#
# result=predict(features)
# if(result[0]==1):
#        print("possibility for Landslide")
# else:
#        print("Safe spot")