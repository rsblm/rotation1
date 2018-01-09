overlapcount <- function(bin_grange, filesbw, bin_matrix, MinPlus_ann) {
##### Use CountOverlaps from GenomicRanges package to count overlap between bins and bigwig files and imports bigwig files with rtracklayer

  suppressPackageStartupMessages(require("GenomicRanges"))
  suppressPackageStartupMessages(require("rtracklayer"))
  
  
  binned_matrix <- matrix(NA, nrow =  length(bin_grange), ncol = length(filesbw))

  colnames(binned_matrix) <- names(filesbw)

  for (i in seq_len(length(filesbw))) {

    bigimp <- import.bw(filesbw[i])
  
    if (any(grep(MinPlus_ann[[1]], filesbw[i]))) {
      strand(bigimp) <- "+"
    } else {
      if (any(grep(MinPlus_ann[[2]], filesbw[i]))) {
        strand(bigimp) <- "-"
      }else{
        print("no strand specification found")
      }
    }
  
  
    binned_matrix[,i] <- countOverlaps(bin_grange, bigimp)
  } 
  
  return(binned_matrix)

}
