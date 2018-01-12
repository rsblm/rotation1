bw_to_vectorlist <- function(bwfile) {

b <- as.data.frame(bwfile)
    
f <- as.vector(by(b$end, INDICES = b$seqnames, max)) # with chrM, used later to compare to sum(b$width)
l <- f[!levels(b$seqnames)=="chrM"] # without chrM, used to make list with chromosomes

t <- lapply(l, function(x) vector("numeric", x))
chr_names <- levels(b$seqnames)
names(t) <- chr_names[!levels(b$seqnames)=="chrM"]

if (max(b$width)==1) {
  
  for (i in 1:length(names(t))) {
    
    t[[i]][b[(b$seqnames==as.character(names(t)[[i]])),]$start] <- b[(b$seqnames==as.character(names(t)[[i]])),]$score# works for type test_bw (not continuous, width 1)
  }
  } else if (identical(f, as.vector(by(b$width, INDICES = b$seqnames, sum)))) {
  
  for (i in 1:length(l)) {
    
    t[[as.character(names(t)[[i]])]] <- rep(b[(b$seqnames==as.character(names(t)[[i]])),]$score, times=((b[(b$seqnames==as.character(names(t)[[i]])),]$end-b[(b$seqnames==as.character(names(t)[[i]])),]$start)+1)) # works for type test_bw2 (continuous, same length as max value, variable width)
  }
  } else {
    print("For now this doesn't work yet with this bw file, because it neither has continues values nor only the values with width 1. I'm sure you can solve it if you look in the second approach (after else if) an combine it with the first approach")
  }
  
return(t)

}