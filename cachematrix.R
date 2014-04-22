##OVERALL DESCRIPTION
##makeCacheMatrix takes a matrix and create an object with one attribute and 4 methods, 
##which is rappresented in R as a list. 

##cacheSolve takes in the object created by the previous function as a list, and if the attribute m is 
##equal to 0 it calculates the inverse matrix. Othervise it returns the value found in m 


## DESCRIPTION OF makeCacheMatrix

## makeCacheMatrix takes a matrix and returns and "object" if I may call it so, with one attribute and some methods.
## the object is rappresented by a list in R.
## In other languages this would be called a constructor although it seems there are no classes in R so I dont know if 
## this is correct

## the attribute is the variable m wich is first initialised to 0. 
## method 'set' replace the value of the matrix with a new one within the closure of the object.
## 'set' also reinitialises the value of m, so if this method is used the cached valued will be overwritten.

## method 'get' return the value of the matrix within the closure
## method 'setinverse' solve the the matrix and store the inverse in the variable m
## method 'getinverse' returns the value of the inverse matrix

## list is the form in which the output is returned


makeCacheMatrix <- function(x = numeric()) {
        
        m <- NULL
        
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



## DESCRIPTION of cacheSolve

## this function takes an object described as before, in the form of a list
## it calls the method getinverse and if it returns zero it then calculate the inverse of the matrix.
## otherwise it returns the inverse which is stored in m

cacheSolve <- function(x, ...) {
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
