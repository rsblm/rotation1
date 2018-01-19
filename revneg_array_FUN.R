revneg <- function(overview, genes_minus) {
  overview[1:nrow(genes_minus),,] <- overview[1:nrow(genes_minus),ncol(overview):1,]
  return(overview)
}