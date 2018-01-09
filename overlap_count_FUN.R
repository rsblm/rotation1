overlap_count <- function() {
#Function that 
  
s <- (promoter_region$V2[[i]]:(promoter_region$V3[[i]]-1))

b <- as.data.frame(test_bw)
b2 <- b[(b$seqnames==as.character(promoter_region$V1[[i]])),] # Specify chr. Added as.character because otherwise you're comparing factors and they don't have the same levels (because the bigwig file has chrM and promoter_region not), but maybe this is not the best solution
b3 <- b2[b2$end>min(s),]
b3 <- b3[b3$start<max(s),]

if(sum(b3$width)>=length(s)){
  b3[1,2] <- min(s)
  b3[nrow(b3),3] <- max(s)
  c <- rep(b3$score, times=((b3$end-b3$start)+1))
  
} else if(max(b2$width)==1) {
  c <- vector("numeric", length(s)) # fill this at position of b3$start with value score
  b3$start <- b3$start-min(s)
  c[b3$start] <- b3$score
} else {
  print("For now this doesn't work yet with this bw file, because it neither has continues values nor only the values with width 1. I'm sure you can solve it if you look in the second approach (after else if) an combine it with the first approach")
}
print ("does it work?")

test[as.character(promoter_region$V4[[i]]), 1,] <- c
return(test)
}