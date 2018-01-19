rev_neg_array <- function(overview, genes_minus, sum_exl_read_dens) {
  #Function that inverts rows in the overview array of negative strand genes. Since genes are excluded, the negative strand gene list has to be updated
  
  exl_neg <- sum_exl_read_dens[1:nrow(genes_minus)] #Select from boolean vector range of negative strand genes
  # genes_minus_exl <- genes_minus[exl_neg,] #Exclude genes from negative strand gene list not necesary
  overview[1:table(exl_neg)["TRUE"],,] <- overview[1:table(exl_neg)["TRUE"], ncol(overview):1, ]  # table(exl_neg)["TRUE"] gives length/amount of minus_genes
  
  return(overview)
}