graph_samples <- function(combined, minus, plus, name, filesbw){
#Function that makes a linegraph for every sample in the same graph, detects number of samples etc
  #Expects a dataframe with columns for each sample and row being bins
  
  suppressPackageStartupMessages(require(ggplot2))
  suppressPackageStartupMessages(require(reshape2)) # is necessary for melt
  suppressPackageStartupMessages(require(ggthemes))
  
  combined2 <- cbind(seq(-minus, plus-1, 1), as.data.frame(combined), row.names=NULL)
  colnames(combined2) <- c("bp", unique(names(filesbw)))
  cmcom <- melt(combined2, id="bp", measure=unique(names(filesbw)))
  
  lp <- ggplot(cmcom, aes(bp, value, colour = variable)) + geom_line()
  lp2 <- lp + ggtitle(paste("Metageneplot from", name, "experiments", sep = " ")) + theme(plot.background = element_rect(fil="grey97"), panel.grid.major= element_line(colour = "grey80", size=0.001), panel.grid.minor= element_line(colour = "grey80", size=0.001), panel.background = element_rect(fill = "grey90"), legend.position = "right", legend.key=element_rect(fill=NA), legend.title=element_blank(), plot.title = element_text(size=15, face="bold", margin = margin(10, 0, 10, 0))) + scale_colour_tableau() + guides(colour = guide_legend(override.aes = list(size=1.5))) + xlab("Position to TSS (bp)") + ylab("Normalised Pol II occupancy")


  return(lp2)
}



#colnames(combined) <- gsub('//biochstore4.bioch.ox.ac.uk/Mellor/Rosa/cerevisiae_dataForRosa/xrn1_glugalData/NETseq|*_NETseq_minus.bw|*_NETseq_plus.bw|/uzun_*', '', filesbw)
#|ntsub_unsmo_posstrand.bigwig|ntsub_unsmo_negstrand.bigwig|nnt_unipos.bw|nnt_unimin.bw