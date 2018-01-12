normalise_array <- function(overview, filesbw) {

    f <- apply(overview_rev, c(1,3) ,FUN = sum)
    
    for (i in 1:(length(filesbw)/2)) {
    overview[,,i] <- t(t(overview_rev[,,i])/f[,i])
    }
    
return(overview)
}
