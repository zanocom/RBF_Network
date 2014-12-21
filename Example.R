#########################################################################
# Example of RBF network

# import dataset
    
    train_set <- read.table (  "train.csv" , sep="," , header = TRUE )
    test_set <- read.table (   "test.csv" , sep="," , header= TRUE )

    head ( train_set)
    
 
    plot( train_set$x1 , train_set$x2 , col=train_set$Y+3)
    
# Model creation
#    system.time ( rbf(X=train_set[,1:2], Y=train_set[,3]) )[3] #  88.63 --> 3.32 
    rbf.model <- rbf(X=train_set[,1:2], Y=train_set[,3]) # using default values for K and gamma
    rbf.model
    
# Prediction on test set
#    system.time ( rbf.predict(model= rbf.model, X= test_set[,1:2] , classification=TRUE) )[3] #  15.45 --> 0.67 
    rbf.pred <- rbf.predict(model= rbf.model, X= test_set[,1:2] , classification=TRUE)
    
    
    binary.error <- sum(rbf.pred != test_set[,3])/nrow(test_set)
    binary.error  # 0.027


    plot( test_set$x1, test_set$x2, col=test_set$Y+3, pch=0)
    points(test_set$x1, test_set$x2, col=rbf.pred+3, pch=3)
    points(rbf.model$centers, col="black", pch=19) # draw the model centers
    legend("topleft",c("true value","predicted"),pch=c(0,3),bg="white")
    

# Plot of right vs wrong classification
    plot( test_set$x1, test_set$x2, col=(rbf.pred==test_set$Y)+4, pch=(rbf.pred==test_set$Y)+1)
    
    
    
    
    
    