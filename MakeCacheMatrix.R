makeCacheMatrix <- function(x = matrix()) { ## set an argument with default mode of "matrix"
    inv <- NULL                             ## initialize inv as NULL; It will contain values of the inverse matrix 
    set <- function(y) {                    ## define a set function to assign new 
         x <<- y                             ## value of matrix in parent environment
        inv <<- NULL                        ## if there is a new matrix, then reset inv to NULL
    }
    get <- function() x                     ## define a get function, which returns values of the matrix argument
    
    setinverse <- function(inverse) inv <<- inverse  ## assigns value of inv in parent environment
    getinverse <- function() inv                     ## gets the value of inv where called
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)  ## required to refer 
                                                                                  ## to the functions with the $ operator
}

