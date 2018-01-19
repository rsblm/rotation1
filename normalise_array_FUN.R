normalise_array <- function(overview, filesbw) {

    f <- apply(overview_rev, c(1,3) ,FUN = sum)
    
    for (i in 1:(length(filesbw)/2)) {
     f[which(f[,i]==0),i] <- 1 ### this is a bit shady since it assumes if sum=0 than max=0 so if it's /1 or not it's always 0
        overview[,,i] <- overview_rev[,,i]/f[,i]
      
        }
    
return(overview)
}


