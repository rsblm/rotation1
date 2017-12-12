### sum over bins

metatable <- function(numberbin, filesbw, binned_matrix) {
  metagene_table <- as.data.frame(matrix(NA, nrow=numberbin, ncol = length(filesbw)))
  colnames(metagene_table) <- names(filesbw) 

  for (i in 1:numberbin) { 
    for (j in 1:ncol(binned_matrix)) {
     
     metagene_table[i,j] <- mean(binned_matrix[which(row.names(binned_matrix)==i),j])
    
    }
  }
    return(metagene_table)
}