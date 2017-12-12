#### Invert negative strand bins

revneg <- function(binned_matrix, bin_matrix) {

rn <- rownames(binned_matrix)
rownames(binned_matrix) <- c(rev(rn[1:length(which(bin_matrix[,6]=="-"))]), rn[(length(which(bin_matrix[,6]=="-"))+1):length(rn)])

return(binned_matrix)

}