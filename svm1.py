from sklearn.linear_model import LogisticRegression

import MySQLdb
import random
from numpy import array
import pandas
from sklearn import datasets
from sklearn.metrics import confusion_matrix
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC

import pandas
from joblib import dump, load


# con=MySQLdb.connect(host='localhost',port=3306,user='root',passwd='',db='leafdetec')
# cmd=con.cursor()
#
# cmd.execute("select * from mfeature where id_id!=0")
# dataframe =cmd.fetchall() #pandas.read_csv("select * from feautureextraction", header=None,delimiter=',')
# dataset= cmd.fetchall()

url = "inputdata.csv"
names = ['lanslide_type', 'trigger', 'landslide_size', 'distance_to_river', 'elevation', 'aspect', 'soil_type',
         'latitude', 'longitude', 'class_label']
dataframe = pandas.read_csv(url, names=names)
dataset = dataframe.values

dataset1=[]
ansset=[]
print(len(dataset))
for d in dataset:
    # print("=======",len(d))
    datarow=[]
    datarow.append(d[0])
    datarow.append(d[1])
    datarow.append(d[2])

    datarow.append(d[3])
    datarow.append(d[4])
    datarow.append(d[5])
    datarow.append(d[6])
    datarow.append(d[7])
    datarow.append(d[8])

    dataset1.append(datarow)
    ansset.append(int(d[9]))

secure_random = random.SystemRandom()


def svm_classifier(prset):



    cs=[]
    cs1=[]


    yyy=[]


    yy = []
    yy.append(float(prset[0]))
    yy.append(float(prset[1]))
    yy.append(float(prset[2]))
    yy.append(float(prset[3]))
    yy.append(float(prset[4]))
    yy.append(float(prset[5]))
    yy.append(float(prset[6]))
    yy.append(float(prset[7]))
    yy.append(float(prset[8]))

    yyy.append(yy)


    datasetarray = array( dataset1 )

    yyy1=array(yyy)

    # fit final model
    X=datasetarray
    y=( ansset)

    print(len(X))
    print(len(X[0]))
    print(len(y))

    # print(X)
    # print(y)
    # svmtrain(X,y)
    model = LogisticRegression()
    model.fit(X, y)
    # # new instances where we do not know the answer

    Xnew=yyy1

    ynew = model.predict(Xnew)

    print((ynew))
    #
    # # show the inputs and predicted outputs
    # for i in range(len(Xnew)):
    #     print("X=%s, Predicted=%s" % (Xnew[i], ynew[i]))
    return ynew
# re=svm_classifier([3,4,2,166.44009,134,2,1,50.4335,-127.4846])
# print(re)



# while(1):
#     import time
#
#
#     time.sleep(5)
#
#     print("qwerty")
#     con = MySQLdb.connect(host='localhost', port=3306, user='root', passwd='', db='project')
#     cmd = con.cursor()
#     cmd.execute("select * from inputdatas where cls=9")
#     s=cmd.fetchone()
#     if s is not None:
#         d=[]
#         d.append(s[2])
#         d.append(s[3])
#         d.append(s[4])
#         d.append(s[5])
#         d.append(s[6])
#         d.append(s[7])
#         d.append(s[8])
#         d.append(s[9])
#         d.append(s[10])
#
#
#
#         re=svm_classifier(d)
#         print(re)
#         id = int(re[0])
#         cmd.execute("update mfeature set cls='"+str(id) +"' where id='"+str(s[0])+"'")
#         con.commit()
#         import time
#         time.sleep(5)

