revneg <- function(bin_matrix) {
  #### Adds a column to binned_matrix that has the bin number and the reversered order binnumber for negative strand, effectively inverinting the negative strand fragments
  ## Expects 2 matrices (?)
  
rn <- bin_matrix$bin_num
stri_bins <- c(rev(rn[1:length(which(bin_matrix[,6]=="-"))]), rn[(length(which(bin_matrix[,6]=="-"))+1):length(rn)])

return(stri_bins)

}