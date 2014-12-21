######################################################################
# RBF PREDICT
# The following function 

# Input:
# rbf model from rbf function
# dataset X

# Output:
# vector with predited values

    rbf.predict <- function( model, X, classification=FALSE ) {
      
      gamma   <- model$gamma
      centers <- model$centers
      w       <- model$weights
#       N       <- dim(X)[1]    # number of observations
#       
#       pred <- rep( w[1] ,N)  # we need to init to a value, so let's start with the bias
#       
#       for (j in 1:N) {  
#         # find prediction for point xj
#         for (k in 1:length(centers[,1])) {
#           # the weight for center[k] is given by w[k+1] (because w[1] is the bias)
#           pred[j] <- pred[j] + w[k+1] * exp( -gamma * norm(as.matrix(X[j,]-centers[k,]),"F")^2 )
#         }
#       }
#       
      pred_mat <- t(apply ( X= X , 1 , FUN= rbf_dist , gamma= gamma , centers= centers  )  )
      pred_mat <- cbind (1 , pred_mat)
      pred <- pred_mat %*% w
      
      
      if (classification) {
        pred <- unlist(lapply(pred, sign))
      }
      pred
    }
    
