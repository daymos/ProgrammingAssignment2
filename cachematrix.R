## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## makeCacheMatrix takes a matrix and returns and "object" I I may call it so, with one attributeand some methods.
## the attribute is the variable m wich is first initialised to 0. 
## method set replace the value of the matrix with a new one


makeCacheMatrix <- function(x = numeric()) {
        m <- NULL
        z <- x
        set <- function(y) {
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



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        m <- x$getinverse()
        if(!is.null(m)&& ) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}

