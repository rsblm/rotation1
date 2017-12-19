comstrand <- function(metagene_table) {
#Combines columns with the same names, so it's meant to be combine plus and minus strand
  #Expects metagene_table as a dataframe with column names
combined <- by(t(metagene_table), INDICES = rownames(t(metagene_table)), FUN=colSums)
  #Needs an if stop loop if no cols with the same name
return(as.data.frame(do.call(cbind,combined)))
}