RBF_Network
===========
RBF network functions

The repository contains code by Joao Nieto ( http://www.di.fc.ul.pt/~jpn/r/rbf/rbf.html ) 
developed by me in order to obtain better performance.

The files are:
* rbf.R           # computes a RBF model, require package pracma
* rbf_predict.R   # predict values given a rbf model
* rbf_dist.R      # computes rbf distance among points and centers

* train.csv       # train set for example (10e3 rows x 3 columns with header) 
* test.csv        # test set for example (2e3 rows x 3 columns with header)
* Dataset_creation.R # code used for creating train.csv and test.csv
* Example.R       # example

The functions are edited substituting for loops with apply.
The function rbf applied to dataset train with default parameters takes 3.32 sec 
versus 88.63 sec of the original version.

Package pracma is required.

Next step is to add a sanity check in rbf_dist function

