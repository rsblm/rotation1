bw_to_countmatrix <- function(filesbw, genes_minus, genes_plus, plus, minus, MinPlus_ann=c("plus|posstrand|unipos","minus|negstrand|unimin")) {
  
  source("/home/immd0754/Documents/R_things/General R scripts/metagene/bw_to_vectorlist_FUN.R")
  source("/home/immd0754/Documents/R_things/General R scripts/metagene/overlap_matrix_FUN.R")
  suppressPackageStartupMessages(require(rtracklayer))
  
  overview <- array(NA, dim = c(nrow(rbind(genes_minus, genes_plus)), plus+minus, length(filesbw)/2))
  read_dens_matrix <- matrix(1, ncol = (length(filesbw)/2), nrow = 2)
  
  
    for (i in 1:length(filesbw)) {
    
      bwfile <- import.bw(filesbw[[i]])
     
       k <- bw_to_vectorlist(bwfile, genes_minus, genes_plus)
       t <- k$t
      
      if (any(grep(MinPlus_ann[[2]], filesbw[i]))) { # neg strand
        
        m <- overlap_matrix(genes = genes_minus, t = t, plus = plus, minus = minus)
        overview[1:nrow(genes_minus),,round((0.5+i)/2)] <- m
        read_dens_matrix[1,round((0.5+i)/2)] <- k$read_dens
        
        
      } else if(any(grep(MinPlus_ann[[1]], filesbw[i]))) { # pos strand
        
        m <- overlap_matrix(genes = genes_plus, t = t, plus = plus, minus = minus)
       overview[nrow(genes_minus)+1:nrow(genes_plus),,round((0.5+i)/2)] <- m
       read_dens_matrix[2,round((0.5+i)/2)] <- k$read_dens
        
      } else {
        print("no strand specification found")
      }
    }
  
  
  test <- matrix(NA, nrow(rbind(genes_minus, genes_plus)), length(filesbw)/2)
 
  f <- apply(overview, c(1,3) ,FUN = sum) #Sum of every row(aka gene)
  
  test[1:nrow(genes_minus),] <- f[1:nrow(genes_minus),]>(read_dens_matrix[1,]*(plus+minus)) # returns boolean for genes being above threshold
  test[nrow(genes_minus)+1:nrow(genes_plus),] <- f[nrow(genes_minus)+1:nrow(genes_plus),]>(read_dens_matrix[2,]*(plus+minus))
  
  sum_exl_read_dens <- (as.matrix(apply(test, 1, sum)))>5
  overview_exl <- overview[sum_exl_read_dens,,]
 
  overview_sum <- list(overview_exl=overview_exl, sum_exl_read_dens=sum_exl_read_dens)
  
return (overview_sum)
  
}








