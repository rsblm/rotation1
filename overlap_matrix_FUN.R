overlap_matrix <- function(genes, t, plus, minus) {
# Function that selects bits of the bw file scores that overlap with genes
# Takes t, a list of vectors (bw_to_vectorlist_FUN) for every chromosome from a bigwigfile
# And you need to provide it with the correct list of genes (in genes), either genes plus or genes minus depending on the bigwigfile

m <- matrix(NA, nrow=nrow(genes), ncol=plus+minus)
rownames(m) <- genes$V4

for (i in 1:nrow(m)) {
  m[i,] <- t[[genes$V1[i]]][genes$V2[i]:(genes$V3[i]-1)]
}

return(m)

}