bin_sum <- function(binned_matrix, i, j) {
  sum(binned_matrix[which(binned_matrix[,1]==i),(j+1)])
}


m3 <- mapply(binned_matrix, i=(1:numberbin), j=(1:length(filesbw)), FUN=bin_sum)

m2 <- mapply(binned_matrix, FUN=bin_sum)


_m2 <- matrix(NA, nrow=numberbin, ncol = length(filesbw))


dummy <- function(x, y) paste(x, y)
sapply(1:4, function(i) sapply(1:4, function(j) dummy(nfl_teams[i], years[j])))


m2 <- sapply(1:numberbin, function(i) sapply(1:length(filesbw), function(j) bin_sum(binned_matrix[i,j])))
