## makeCacheMatrix and cacheSolve are used in conjunction with each other to return the inverse of a matrix
## either through a caclulation or by returning the cache of a prior calculation 

## makeCacheMatrix creates creates an environmnet and functions for the storage, caching, and retrieval of a matrix and it's inverse 
## Note that if set is called I is automatically set to NULL so that it will be calculated in cacheSolve 
## Sample call: xx <- makeCacheMatrix(x)
makeCacheMatrix <- function(x = matrix()) {
        I <- NULL
        set <- function(y) {
                x <<- y
                I <<- NULL
        }
        get <- function() x
        setI <- function(inverse) I <<- inverse
        getI <- function() I
        list(set = set, get = get,
             setI = setI,
             getI = getI)
}



## cacheSolve takes a matrix object created by makeCacheMatrix and returns it's inverse (either through the cache or through inital calculation).  
## Sample call: cacheSolve(xx)
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		I <- x$getI()
        if(!is.null(I)) {
                message("getting cached data")
                return(I)
        }
        data <- x$get()
        I <- solve(data, ...)
        x$setI(I)
        I
}

