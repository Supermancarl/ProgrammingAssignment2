## Getting the inverse matrix
## Load the cache value if repeat the calculation


## Set the list to define cache matrix

makeCacheMatrix <- function(x = matrix()) {
     inv <- NULL
     getmat <- function() x # read the input matrix
     setinv <- function(inverse) inv <<- inverse  #make the cache inverse matrix
     getinv <- function() inv
     list(getmat=getmat,setinv=setinv,getinv=getinv) 
     #"set" funciotn in the example has never been used, so I removed it
}




## compute the inverse matrix or load the cache matrix

cacheSolve <- function(x, ...) {
     inv <- x$getinv()
     if (!is.null(inv)){
          message("cache value loaded")
          return(inv)
     }
     in_mat <- x$getmat()
     inv <- solve(in_mat)
     x$setinv(inv)
     inv
}

abc <- matrix(rnorm(81),9,9)
test <- makeCacheMatrix(abc)
cacheSolve(test)


