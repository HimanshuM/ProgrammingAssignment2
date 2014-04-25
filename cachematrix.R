## Program to cache the inversion of matrix, to reduce the computation time.
## The program caches the inverse of matrix during first computation and
## returns the cached version for every subsequent call for the same matrix.

## makeCacheMatrix() provides an interface to cache the matrix and it's
## inverse and later retrieve the cached version.
## Returns a list of setter and getter functions.

makeCacheMatrix <- function(x = matrix()) {
       i <- NULL
       ## Function to set the matrix.
       set <- function(y) {
               x <<- y
               i <<- NULL
       }
       # Function to get the matrix.
       get <- function() x
       # Function to set the inverse.
       setinverse <- function(inverse) i <<- inverse
       Function to return the inverse.
       getinverse <- function() i
       list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve() first checks if the cached inverse is already available;
## if it is, retrieves and returns it. If not, computes the inverse and
## caches it using makeCacheMatrix().
## Returns the invers in either cases.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	i <- x$getinverse()
	# Cached version is available; use it.
	if(!is.null(i)) {
                message("getting cached data")
                return(i)
	}
	data <- x$get()
	# Perform the inversion.
	i <- solve(data, ...)
	x$setinverse(i)
	i
}
