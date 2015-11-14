## Fuctions that provide object creation and calculation of "special" matrices that can cache their inverse

## This function creates a "special" matrix that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  x.inv <- NULL
  get <- function() x
  set <- function(y) {
    x <<- y
  }
  getInverse <- function() x.inv
  setInverse <- function(y) {
    x.inv <<- y
  }
  
  list(get=get, set=set, getInverse=getInverse, setInverse=setInverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix.

cacheSolve <- function(x, ...) {
  if (is.null(x$getInverse())) {
    x$setInverse(solve(x$get()))
  }
  x$getInverse()
}
