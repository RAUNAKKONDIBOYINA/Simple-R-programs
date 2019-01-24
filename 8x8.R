
N=8
globe=FALSE

printSolution<-function(board) #[N][N]
{
    i=1
    while(i<=N){ #for (i = 0; i < N; i++)
      j=1
      while(j<=N){
        print(board[i][j])
        j=j+1
      }
        print("new")
        i=i+1
    }

}

isSafe<-function(board, row, col)
{
    t=TRUE
    f=FALSE
  
    i=1
    while(i<=col){
      if (board[row][i]){
        FALSE
        break
      }
      i=i+1
    }
  
  i=row
  j=col
  while(i>0 && j>0){
  #for (i=row, j=col; i>=0 && j>=0; i--, j--)
    if (board[i][j]){
      FALSE
      break
    }
    i=i-1
    j=j-1
  }
  
  i=row
  j=col
  
  while(j>=1 && i<=N){       #for (i=row, j=col; j>=0 && i<N; i++, j--)
  
    if (board[i][j]){
      FALSE
      break
    }
    i=i+1
    j=j-1
  }
  TRUE
}


solveNQUtil<-function(board,col)
{
  
    if (col >= N){
      TRUE
      break
    }
  
    i=0
    while(i<N)
    {
      
        if ( isSafe(board, i, col) ){
            board[i][col] = 1
            
            
              if ( solveNQUtil(board, col + 1) ){
                TRUE
                break
              }
            
            
            board[i][col] = 0 # BACKTRACK
        }
      i=i+1
    }
            
            
    FALSE
  }
            
            
solveNQ<-function()
{
  board=matrix(c(0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0),byrow = TRUE,nrow=8)
            
  if ( solveNQUtil(board, 0) == FALSE )
  {
    print("Solution does not exist")
    FALSE
    break
  }
            
  printSolution(board)
  TRUE
}
            
solveNQ()
            