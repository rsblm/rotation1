bw_to_countmatrix <- function(filesbw, genes_minus, genes_plus, plus, minus, MinPlus_ann=c("plus|posstrand|unipos","minus|negstrand|unimin")) {
  
  source("/home/immd0754/Documents/R_things/General R scripts/metagene/bw_to_vectorlist_FUN.R")
  source("/home/immd0754/Documents/R_things/General R scripts/metagene/overlap_matrix_FUN.R")
  suppressPackageStartupMessages(require(rtracklayer))
  
  overview <- array(NA, dim = c(nrow(rbind(genes_minus, genes_plus)), plus+minus, length(filesbw)/2))
  
    for (i in 1:length(filesbw)) {
      
      bwfile <- import.bw(filesbw[[i]])
      t <- bw_to_vectorlist(bwfile)
      
      if (any(grep(MinPlus_ann[[2]], filesbw[i]))) {
        
        m <- overlap_matrix(genes = genes_minus, t = t, plus = plus, minus = minus)
        overview[1:nrow(genes_minus),,round((0.5+i)/2)] <- m
        
      } else if(any(grep(MinPlus_ann[[1]], filesbw[i]))) {
        
        m <- overlap_matrix(genes = genes_plus, t = t, plus = plus, minus = minus)
        overview[nrow(genes_minus)+1:nrow(genes_plus),,round((0.5+i)/2)] <- m
        
      } else {
        print("no strand specification found")
      }
    }
return (overview)
  
}