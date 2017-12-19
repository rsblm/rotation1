#### Make an GRange object of regions of interest in bins


bin_matrix <- function(promoter_region, binsize){

  suppressPackageStartupMessages(require("GenomicRanges"))

rangelength <- promoter_region[1,3]-promoter_region[1,2]
numberbin <- rangelength/binsize

if (identical(round(numberbin), numberbin)) {
  
} else{
  print("The combination of genomic range and binsize makes the number of bins not round. So either change them or fix this problem somehow")
  stop()
}


bin_matrix <- as.data.frame(matrix(nrow=(nrow(promoter_region)*numberbin), ncol=6))
colnames(bin_matrix) <- c("gene", "bin_num", "chr", "start", "end", "strand")

bin_matrix[,1] <- rep(promoter_region[,4], each=numberbin)
bin_matrix[,2] <- rep(seq(1, numberbin), times=nrow(promoter_region))
bin_matrix[,3] <- rep(promoter_region[,1], each=numberbin)
bin_matrix[,6] <- rep(promoter_region[,6], each=numberbin)
bin_matrix[,4] <- rep(promoter_region[,2], each=numberbin)
bin_matrix[,4] <- bin_matrix[,4]+(binsize*(bin_matrix[,2]-1))
bin_matrix[,5] <- (bin_matrix[,4]+(binsize-1))


bin_grange <- makeGRangesFromDataFrame(bin_matrix, seqnames.field = "chr", start.field = "start", end.field = "end", keep.extra.columns = TRUE)

res2 <- list(bin_grange=bin_grange, bin_matrix=bin_matrix, numberbin=numberbin) 
return(res2)
}