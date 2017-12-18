bin_sum <- function(binned_matrix, i, j) {
  sum(binned_matrix[which(binned_matrix[,1]==i),(j+1)])
}


m3 <- mapply(binned_matrix, i=(1:numberbin), j=(1:length(filesbw)), FUN=bin_sum)

m2 <- mapply(binned_matrix, FUN=bin_sum)


m2 <- matrix(NA, nrow=numberbin, ncol = length(filesbw))


dummy <- function(x, y) paste(x, y)
sapply(1:4, function(i) sapply(1:4, function(j) dummy(nfl_teams[i], years[j])))


m2 <- sapply(1:numberbin, function(i) sapply(1:length(filesbw), function(j) bin_sum(binned_matrix[i,j])))

############################


bin_sum <- function(binned_matrix, i, j, stri) {
   sum(binned_matrix[which(stri==i),(j)])

  }


### This gives the error incorrect number of dimensions

bin_sum <- function(binned_matrix, m3, i, j, stri) {
  m3[i,j] <- sum(binned_matrix[which(stri==i),(j)])
  return(m3)
}



test_binned_matrix <- binned_matrix[,2:13]
stri <- binned_matrix[,1]


m4 <- apply(m2, MARGIN=c(1,2), FUN=bin_sum, test_binned_matrix,i=(1:300), j=(1:12), stri=stri)

sum(test_binned_matrix[which(stri==1),(1)])

#### Use by?

bin_sum <- function(binned_matrix, i, j, stri) {
 sum(binned_matrix[which(stri==i),(j)])
 
}

dm3 <- by(test_binned_matrix, INDICES = stri, colSums)
as.data.frame(do.call(cbind,dm3, check.names))
return(as.data.frame(do.call(cbind,combined)))


dm4 <- as.matrix(unlist(dm3))

dm2 <- as.data.frame(cbind(dm3))
dm5 <- unlist(dm2, recursive=FALSE)

dm5 <- as.data.frame(do.call(rbind,dm3))

c <- by(t(test_binned_matrix))
