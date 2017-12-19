graph_samples <- function(combined, minus, plus, numberbin){
#Function that makes a linegraph for every sample in the same graph, detects number of samples etc
  #Expects a dataframe with columns for each sample and row being bins
  suppressPackageStartupMessages(require(ggplot2))
  suppressPackageStartupMessages(require(reshape2))
  
  combined2 <- cbind(rownames(combined) <- round(seq(-minus, plus, (plus-(-minus))/(numberbin-1))), combined, row.names=NULL)
  colnames(combined2) <- c("bp", colnames(combined))
  mcom <- melt(combined2, id="bp", measure=colnames(combined))
  mcom2 <- mcom[6000:6600,]
  
  lp <- ggplot(mcom, aes(bp, value, colour = variable)) + geom_line()
  lp2 <- lp + theme(legend.position="right")
  return(lp2)
}



#colnames(combined) <- gsub('//biochstore4.bioch.ox.ac.uk/Mellor/Rosa/cerevisiae_dataForRosa/xrn1_glugalData/NETseq|*_NETseq_minus.bw|*_NETseq_plus.bw|/uzun_*', '', filesbw)
#|ntsub_unsmo_posstrand.bigwig|ntsub_unsmo_negstrand.bigwig|nnt_unipos.bw|nnt_unimin.bw