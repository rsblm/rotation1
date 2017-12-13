graph_samples <- function(combined){
#Function that makes a linegraph for every sample in the same graph, detects number of samples etc
  #Expects a dataframe with columns for each sample and row being bins
  suppressPackageStartupMessages(require(ggplot2))
  suppressPackageStartupMessages(require(reshape2))
  
  combined2 <- cbind(rep(1:nrow(combined), times=ncol(combined)), combined, row.names=NULL)
  colnames(combined2) <- c("number", colnames(combined))
  mcom <- melt(combined2, id="number", measure=colnames(combined))
  
  ggplot(mcom, aes(number, value, colour = variable)) + geom_line(ylab="bp")
}



