##########################################################
# RBF DIST

# The following function computes the radial basis distance between 
# x points and some centers
# x and centers must have the same dimensionS

    rbf_dist <- function ( x , centers= NULL , gamma= 1.0   ) {
          apply ( centers , 1 , function ( y ) { exp( -gamma * norm( as.matrix( x - y ) , "F") ^2 ) } )
        }

