overlap1 <- function(promoter_region, genes_minus, genes_plus, minus) {
# Way to remove regions of which the termination site of one gene overlaps with the promoter region of the previous gene
  # 1st attempt: Very simple way of doing this - calculate if termination site - transcription start site > minus, the value before TSS we take into account
  # Potential problem: if there's two or even more TSS before a previous gene terminates
  
  l1 <- vector("logical", (nrow(genes_plus)-1))
  l2 <- vector("logical", (nrow(genes_minus)-1))
  
    for (i in 1:(nrow(genes_plus)-1)) {
    l1[[i]] <-(genes_plus[i,3]-genes_plus[i+1,2])<minus
    }
  
  
  for (i in 1:(nrow(genes_minus)-1)) {
    l2[[i]] <-(genes_minus[i+1,2]-genes_minus[i,3])>minus
  }
  
  l1 <- c("TRUE", l1)
  l2 <- c(l2, "TRUE")
  
  l3 <- c(l2,l1)
  
  class(l3) <- "logical"
  
  promoter_region2 <- promoter_region[l3,]
  
  return(promoter_region2)
}







