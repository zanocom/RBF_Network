######################################################################
# RBF

# returns a rbf model given the:
# * observations x1, xN of dataset D
# * output value for each observation
# * number of centers
# * gamma value


# X <- train_set[,1:2]
# Y <- train_set[,3]
# K <- 10

    
    rbf <- function(X, Y, K=10, gamma=1.0) {
          require ( pracma )
      
          N     <- dim(X)[1] # number of observations
          ncols <- dim(X)[2] # number of variables
          
          repeat {
            km <- kmeans(X, K)  # let's cluster K centers out of the dataset
            if (min(km$size)>0) # only accept if there are no empty clusters
              break
          }
          
          mus <- km$centers # the clusters points  
          Phi <- matrix(NA , nrow= N , ncol=K)
          
    #       X[1,]-mus[1,]  #-0.9743206 -0.3140498
    #       X[1,]-mus[2,]  # -0.9455668 1.015942
    #       X[1,]-mus[3,] #  -1.613418 1.044853
    #       
    #       apply ( mus , 1 , function(x)  X[1,]-x    )
    
          
          gauss_dist <- function ( x , gamma= 1.0   ) {
                apply ( mus , 1 , function ( y ) { exp( -gamma * norm( as.matrix( x - y ) , "F") ^2 ) } )
                }
          
    #    system.time (t(apply ( X= X , 1 , FUN= gauss_dist , gamma= 1  )  )) [3]  # 3
          Phi <- t(apply ( X= X , 1 , FUN= gauss_dist , gamma= 1  )  )
    #      dim ( Phi )
    #      head ( Phi )      
    #       apply ( mus , 1 , gauss_dist )
    #       apply ( X= X[1,] , 1 , FUN= function ( x ) apply ( X= mus[1:3,] , 1 , FUN= function( y )  y-x ) )  
          
          
          
    #       exp( -gamma * norm(as.matrix(X[1,]-mus[1,]),"F")^2 ) #0.3506636
    #       exp( -gamma * norm(as.matrix(X[1,]-mus[2,]),"F")^2 ) #0.1456959
    #       exp( -gamma * norm(as.matrix(X[1,]-mus[3,]),"F")^2 ) #0.02485157
    #       exp( -gamma * norm(as.matrix(X[2,]-mus[1,]),"F")^2 ) #0.1410719
    #       exp( -gamma * norm(as.matrix(X[2,]-mus[2,]),"F")^2 ) #0.9113622
    #       exp( -gamma * norm(as.matrix(X[2,]-mus[3,]),"F")^2 ) #0.3894648
          
#           for (lin in 1:N) {
#             Phi[lin,1] <- 1    # bias column
#             for (col in 1:K) {
#               Phi[lin,col+1] <- exp( -gamma * norm(as.matrix(X[lin,]-mus[col,]),"F")^2 )
#             }
#           }
#           
          
          Phi <- cbind (1 , Phi)
          
          w <- pinv(t(Phi) %*% Phi) %*% t(Phi) %*% Y  # find RBF weights
          
          list(weights=w, centers=mus, gamma=gamma)  # return the rbf model
        }
