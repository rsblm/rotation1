ratio_body_promoter <- function(minus, plus, binsize, combined) {
  
  TSS <- round(minus/binsize)
  prom_prox <-round((minus+200)/binsize) #for now 200bp from TSS
  promoter <- colSums(combined[TSS:prom_prox,])
  
  dist1 <- round((plus-200)/binsize) #end of range -200
  dist2 <-round(plus/binsize) #for now 200bp 
  distal <- colSums(combined[dist1:dist2,])
  
  pause_ratio <- promoter/distal
  return(pause_ratio)
  
}
