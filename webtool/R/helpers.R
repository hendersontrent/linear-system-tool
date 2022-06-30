#' Function to generate a linear system of equations
#' @param n the number of variables
#' @return an object of class matrix
#' @author Trent Henderson
#' 

generate_system_eqs <- function(n = c(2, 3)){
  
  stopifnot(length(n) == 1 || n %in% c(2, 3) || is.numeric(n))
  
  # Generate coefficients and values
  # e.g., if n = 2, we need 6 integers (x, y, and rhs value across 2 equations)
  
  n_terms <- (n * n) + n # Number of total values
  term_vals <- floor(sample(x = -15:15, size = n_terms, replace = TRUE)) # Randomly generated values (integers for cleanliness)
  A <- matrix(term_vals, byrow = TRUE, nrow = n, ncol = n + 1) # Matrix for the system
  return(A)
}

#' Function to solve system of equations in matrix form
#' @param A the matrix
#' @return a numeric vector of solutions to the variables
#' @author Trent Henderson
#' 

solve_system <- function(A){
  
  stopifnot(class(A) == c("matrix", "array"))
  
  #--------- Solve the system ---------
  
  lhs <- A[, 1:(ncol(A) - 1)]
  rhs <- A[, ncol(A)]
  solution <- solve(lhs, rhs)
  return(solution)
}
