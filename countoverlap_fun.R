##### Use CountOverlaps to count overlap between bins and bigwig files

overlapcount <- function(bin_grange, filesbw, bin_matrix) {

  suppressPackageStartupMessages(require("GenomicRanges"))
  suppressPackageStartupMessages(require("rtracklayer"))
  
  
  binned_matrix <- matrix(NA, nrow =  length(bin_grange), ncol = length(filesbw))

  colnames(binned_matrix) <- names(filesbw)
  rownames(binned_matrix) <- bin_matrix[,2] ### try to make it Bin + bin number


  for (i in seq_len(length(filesbw))) {
  
  
    bigimp <- import.bw(filesbw[i])
  
    if (any(grep("plus", filesbw[i]))) {
      strand(bigimp) <- "+"
    } else {
      if (any(grep("minus", filesbw[i]))) {
        strand(bigimp) <- "-"
      }else{
        print("no strand specified")
      }
    }
  
  
    binned_matrix[,i] <- countOverlaps(bin_grange, bigimp)
  } 
  
  return(binned_matrix)

}