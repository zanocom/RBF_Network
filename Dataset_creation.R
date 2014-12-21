####################################################
# DATASET for RBF network example
# For reproducibility


# target definition
    target <- function(x1, x2) {
      2*(x2 - x1 + .25*sin(pi*x1) >= 0)-1
    }
    
# Train set
    set.seed ( 888 )
    N <- 10000
    X <- data.frame(x1=runif(N, min=-1, max=1),
                    x2=runif(N, min=-1, max=1))
    Y <- target(X$x1, X$x2)
    train_set <- data.frame ( X , Y )
    

# Test set
    set.seed ( 988 )
    N.test <- 2000
    X.out <- data.frame(x1=runif(N.test, min=-1, max=1),
                        x2=runif(N.test, min=-1, max=1))
    Y.out <- target(X.out$x1, X.out$x2)
    test_set <- data.frame ( X.out , Y.out )
    colnames ( test_set ) <- colnames ( train_set )
    
# csv export
    write.table ( train_set , file= "train.csv" , sep="," ,
                  col.names= TRUE , row.names= FALSE )

    
    write.table ( test_set , file= "test.csv" , sep="," ,
                  col.names= TRUE , row.names= FALSE )
    

#####################################################################      
      
