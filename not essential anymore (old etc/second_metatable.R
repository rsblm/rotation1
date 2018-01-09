cores <- detectCores()
cl <- makeCluster(cores[1]-1) #not to overload your computer
registerDoParallel(cl)


library(foreach)
library(doParallel)







metatable <- function(numberbin, filesbw, binned_matrix) {
  ### sum over bins. Bin number must be specified in first column of binned_matrix
  require("BiocParallel")
  
  
  metagene_table <- as.data.frame(matrix(NA, nrow=numberbin, ncol = length(filesbw)))
  colnames(metagene_table) <- names(filesbw) 
  
  for (i in 1:numberbin) { 
    for (j in 1:length(filesbw)) {
      
      metagene_table[i,j] <- 
      
    }
  }
  return(metagene_table)
}

cores <- detectCores()
cl <- makeCluster(cores[1]-1) #not to overload your computer
registerDoParallel(cl)


library(foreach)
library(doParallel)



