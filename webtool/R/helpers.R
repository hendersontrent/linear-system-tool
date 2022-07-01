#--------------- System generation ---------------

#' Function to generate nicer terms for equations 2 and 3 in the system
#' @param row_vals the first row of terms for equation 1
#' @return an object of class vector
#' @author Trent Henderson
#' 

generate_later_rows <- function(row_vals){
  
  n <- length(row_vals) - 1
  
  # Assign values
  
  for(i in 1:length(row_vals)){
    
    # Check if values are divisible by 2. If yes, just use those for niceness
    
    if(row_vals[i] %% 2 == 0){
      row_vals[i] <- row_vals[i] %% 2
      
    } else{
      opts <- c(0, 1, 999) # 0 = coefficient is 0, 1 = coefficient is 1, 999 = variable stays the same value
      opt <- sample(opts, size = 1, replace = FALSE) # Randomly choose one for a bit of spiciness
      
      # Generate new vector of coefficients based on random choice above
      
      if(opt == 0){
        row_vals[i] <- 0
      } else if (opt == 1){
        row_vals[i] <- 1
      } else{
      }
    }
  }
  return(row_vals)
}

#' Function to generate a linear system of equations
#' @param n the number of variables
#' @return an object of class matrix
#' @author Trent Henderson
#' 

generate_system_eqs <- function(n = c(2, 3)){
  
  stopifnot(length(n) == 1 || n %in% c(2, 3) || is.numeric(n))
  
  # Generate coefficient matrix A
  
  n_terms <- (n * n) + n # Number of total values
  row1 <- floor(sample(x = -15:15, size = n, replace = TRUE))
  
  if(n == 2){
    row2 <- generate_later_rows(row1)
    A <- matrix(append(row1, row2), byrow = TRUE, nrow = n, ncol = n)
  }
  
  if(n == 3){
    row2 <- generate_later_rows(row1)
    
    # Generate row 3 using a bit of randomness
    
    opts <- c(1, 2) # 1 = use row 1, 2 = use row 2
    opt <- sample(opts, size = 1, replace = FALSE) # Randomly choose one for a bit of spiciness
   
    if(opt == 1){
      row3 <- generate_later_rows(row1)
    } else{
      row3 <- generate_later_rows(row2)
    }
    A <- matrix(append(row1, row2, row3), byrow = TRUE, nrow = n, ncol = n)
  }
  
  # Generate RHS vector b and append to A to form augmented matrix
  
  b <- floor(sample(x = -15:15, size = n, replace = TRUE))
  aug <- unname(cbind(A, b))
  return(aug)
}

#' Function to solve system of equations in matrix form
#' @param aug the augmented matrix
#' @return a numeric vector of solutions to the variables
#' @author Trent Henderson
#' 

solve_system <- function(aug){
  
  stopifnot(class(aug) == c("matrix", "array"))
  
  #--------- Solve the system ---------
  
  lhs <- aug[, 1:(ncol(aug) - 1)]
  rhs <- aug[, ncol(aug)]
  solution <- solve(lhs, rhs)
  return(solution)
}

#--------------- Data visualisation --------------

#' Function to plot 2x2 equations
#' @param A the matrix of equations
#' @param solution the matrix solutions
#' @param animate Boolean whether to animate the plot or not. Defaults to \code{FALSE}
#' @return an object of class ggplot
#' @author Trent Henderson
#' 

plot_system <- function(A, solution, animate = FALSE){
  
  xx
}
