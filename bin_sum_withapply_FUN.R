bin_sum <- function(binned_matrix, stri) {
# Takes the sum of subset of rows(by bin number) in the columns (samples)
  #Expects a matrix for binned_matrix and a list (or integer?) with binnumbers. nrow of binned_matrix must be length(stri)
  dm3 <- by(binned_matrix, INDICES = stri, colSums)
  return(as.data.frame(do.call(rbind,dm3)))
}

