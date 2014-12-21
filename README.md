RBF_Network
===========
RBF network functions

The repository contains code by Joao Nieto ( http://www.di.fc.ul.pt/~jpn/r/rbf/rbf.html ).

The files are:
* rbf.R           # compute a RBF model, require package pracma
* rbf_predict.R   # predict values given a rbf model

* train.csv - train set for example (10e3 rows x 3 columns with header) 
* test.csv - test set for example (2e3 rows x 3 columns with header)
* Dataset_creation.R - code used for creating train.csv and test.csv

The functions are edited in order to improve performance substituting for loops with apply.




