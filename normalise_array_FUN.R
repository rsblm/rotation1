normalise_array <- function(overview_rev, filesbw) {

    f <- apply(overview_rev, c(1,3) ,FUN = sum)
    
    for (i in 1:(length(filesbw)/2)) {
    # f[which(f[,i]==0),i] <- 1 ### this is a bit shady since it assumes if sum=0 than max=0 so if it's /1 or not it's always 0
      #above isn't necessary anymore since non-expressed genes are not included anymore. Unless a gene is significantly expressed(as in more than the random amoun of reads) and equal in pos and neg values which would make the sum exactly 0
        overview_rev[,,i] <- overview_rev[,,i]/f[,i]
      
        }
    
return(overview_rev)
}


