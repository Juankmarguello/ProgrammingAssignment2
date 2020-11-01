

makeCacheMatrix <- function(x = matrix()) {
  x.inv<- NULL
  inv <- function (x.inv1) {
    x <<- x.inv1
    x.inv <<- NULL
  }
  get.I <- function() x
  set.inv <- function(inverse) x.inv <<- inverse
  get.inv <- function() x.inv
  list(set= inv,get=det.I,setINVERSA=set.inv,getINVERSA=get.inv)
}



cacheSolve <- function(x, ...) {
        cache.inv<-x$makeCacheMatrix
        if (!is.null(cache.inv)){
          print('Cached data is:')
          return(cache.inv)
        } else {
          print('The invers of the matrix')
          return(makeCacheMatrix(x)$get.inv)
        }
}
