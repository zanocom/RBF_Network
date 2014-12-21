######################################################################
# RBF

# returns a rbf model given the:
# * observations x1, xN of dataset D
# * output value for each observation
# * number of centers
# * gamma value
    
    rbf <- function(X, Y, K=10, gamma=1.0) {
      
          require ( pracma )
          source ( "rbf_dist.R" )
      
          N     <- dim(X)[1] # number of observations
          ncols <- dim(X)[2] # number of variables
          
          repeat {
            km <- kmeans(X, K)  # let's cluster K centers out of the dataset
            if (min(km$size)>0) # only accept if there are no empty clusters
              break
          }
          
          mus <- km$centers # the clusters points  
          Phi <- matrix(NA , nrow= N , ncol=K)

          # function rbf_dist is used to compute radial kernel
          Phi <- t(apply ( X= X , 1 , FUN= rbf_dist , gamma= 1, centers= mus  )  )
          Phi <- cbind (1 , Phi)
          
          # weights optimization
          w <- pinv(t(Phi) %*% Phi) %*% t(Phi) %*% Y  # find RBF weights
          
          list(weights=w, centers=mus, gamma=gamma)  # return the rbf model
        }
