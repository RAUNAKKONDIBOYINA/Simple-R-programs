#library("NMOF")
set.seed(134577)

 N <- 8 ## board size
 p <- sample.int(N) ## a random solution
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
  
  mat <- array(NA, dim = c(N,N)) ## diagonals
   for (r in 1:N)
    for (c in 1:N)
      mat[r,c] <- c - r
   mat
  
   n_attacks <- function(p) {
     ## more than one Q on a column?
     sum(duplicated(p)) +
       ## more than one Q on a diagonal?
       sum(duplicated(p - seq_along(p))) +
       ## more than one Q on a reverse diagonal?
       sum(duplicated(p + seq_along(p)))
   }
    n_attacks(p)
   
    neighbour <- function(p) {
      step <- 3
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
    
    sol <- TAopt(n_attacks, list(x0 = p0,
                                 neighbour = neighbour,
                                 printBar = FALSE,
                                 nS = 1000))
    
    print_board(sol$xbest)
    
    sol <- SAopt(n_attacks, list(x0 = p0,
                                 neighbour = neighbour,
                                 printBar = FALSE,
                                 nS = 1000))
    
    print_board(sol$xbest)
    