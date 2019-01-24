library("NMOF")
set.seed(134577)

 N <- 8 
 p <- sample.int(N) 
 data.frame(row = 1:N, column = p)
 
  print_board <- function(p, q.char = "Q", sep = " ") {
   n <- length(p)
   row <- rep("-", n)
   for (i in seq_len(n)) {
     row_i <- row
     row_i[p[i]] <- q.char
     cat(paste(row_i, collapse = sep))
     cat("\n")
   }
 }
 
  print_board(p)
  
  mat <- array(NA, dim = c(N,N)) 
   for (r in 1:N)
    for (c in 1:N)
      mat[r,c] <- c - r
   mat
  
   n_attacks <- function(p) {     #attack on row, col, diag
    
     sum(duplicated(p)) +
       
       sum(duplicated(p - seq_along(p))) +
       
       sum(duplicated(p + seq_along(p)))
   }
    n_attacks(p)
   
    neighbour <- function(p) {
      step <- 8
      i <- sample.int(N, 1)
      p[i] <- p[i] + sample(c(1:step, -(1:step)), 1)
      if (p[i] > N)
        p[i] <- 1
      else if (p[i] < 1)
        p[i] <- N
      p
    }
    print_board(p)
    
    print_board(p <- neighbour(p))
    
    print_board(p <- neighbour(p))
    
    p0 <- rep(1, N) ## or a random initial solution: p0 <- sample.int(N)
    print_board(p0)
    
    sol <- LSopt(n_attacks, list(x0 = p0,
                                 neighbour = neighbour,
                                 printBar = FALSE,
                                 nS = 10000))
    
    print_board(sol$xbest)
    print("end")
    
    sol <- TAopt(n_attacks, list(x0 = p0,
                                 neighbour = neighbour,
                                 printBar = FALSE,
                                 nS = 1000))
    
    print_board(sol$xbest)
    
    sol <- SAopt(n_attacks, list(x0 = p0,
                                 neighbour = neighbour,
                                 printBar = FALSE,
                                 nS = 1000))
    print("no sol")
    print("no sol")
    print("no sol")
    print("no sol")
    print_board(sol$xbest)
    
    