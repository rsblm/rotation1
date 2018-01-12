overlap_count <- function(promoter_region, bwfile, gene_array ) {
#Function that extracts the score and position from the regions of a bigwig file that overlap with a gene and stores them in the appropriate row in the array
  # It takes the promoter_region table (promoter_region) as data.frame with 6 columns (chr, start, end, gene name, ? and strand) names V1-V6
  # Bwfile is imported bigwigfile
  # gene_array is the array that has to be substituted

## get bwfile and trim it to the need of your gene
b <- as.data.frame(test_bw)
b2 <- b[(b$seqnames==as.character(promoter_region$V1[[i]])),] # Specify chr. Added as.character because otherwise you're comparing factors and they don't have the same levels (because the bigwig file has chrM and promoter_region not), but maybe this is not the best solution
b3 <- b2[b2$end>promoter_region$V2[[i]],]
b3 <- b3[b3$start<(promoter_region$V3[[i]]-1),]

if(sum(b3$width)>=minus+plus){
  b3[1,2] <- promoter_region$V2[[i]]
  b3[nrow(b3),3] <- (promoter_region$V3[[i]]-1)
  c <- rep(b3$score, times=((b3$end-b3$start)+1))
  
} else if(max(b2$width)==1) {
  c <- vector("numeric", minus+plus) # fill this at position of b3$start with value score
  b3$start <- b3$start-promoter_region$V2[[i]]
  c[b3$start] <- b3$score
} else {
  print("For now this doesn't work yet with this bw file, because it neither has continues values nor only the values with width 1. I'm sure you can solve it if you look in the second approach (after else if) an combine it with the first approach")
}
print ("does it work?")

gene_array[as.character(promoter_region$V4[[i]]), 1,] <- c
return(gene_array)
}