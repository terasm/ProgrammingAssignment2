## Functions set a matrix and calculates the inverse of the matrix only after the
## inverse of the matrix is called for. Inverse of the matrix is cached, so if the
## inverse of the matrix is called again it does not have to bee calculated again but
## retrieved from the cache.

## Function sets the matrix and also the functions needed to calculate
## and cahce the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
get <- function() x
setinverse <- function(solve) m <<- solve
getinverse <- function() m
list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)
}


## Function first checks if the inverse of the matrix has been calculated,
## and if it has not been calculated it will calculate it and store it. If the inverse of
## the matrix has already been calculated function retrieves the inverse of the matrix 
## from the cache, informs that it is "getting cahced data" and then prints it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
