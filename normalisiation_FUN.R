normalisation <- function (binned_matrix, numberbin) {
#Function that normalises every value by dividing it by the sum of reads over that specific gene/region(sum of all bins specific for that sample)
  #Needs a matrix (binned_matrix) and a value, the number of bins (numberbin)
len <- rep(1:(nrow(binned_matrix)/numberbin), each=numberbin)
gene_total <- rowsum(binned_matrix, len)

a <- gene_total[rep(seq(nrow(gene_total)), each=numberbin),]
b <- binned_matrix/a
b[is.nan(b)] <- 0

return(b)

}



