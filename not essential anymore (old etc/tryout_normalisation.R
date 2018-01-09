test_df <- as.data.frame(matrix(NA, nrow=nrow(promoter_region), ncol=ncol(test_binned_matrix)))

test_binned_matrix2 <- test_binned_matrix/colSums(test_binned_matrix)

for (i in 1:nrow(test_binned_matrix)/300){
  for (s in 3:ncol(test_binned_matrix)){
    gene_total = sum(test_binned_matrix[(i-1)*300 + 1:i*300,s])
    for (j in 1:300){
      test_binned_matrix2[(i-1)*300 + ,s-2]=test_binned_matrix[(i-1)*300 + j,s-2]/gene_total
    }
  }
}


for (i in 1:(nrow(test_binned_matrix)/300)){
  for (s in 3:ncol(test_binned_matrix)){
    
    gene_total <- sum(test_binned_matrix[((i-1)*300 + 1):(i*300),s])
  
    if (gene_total > 0){
      test_binned_matrix2[((i-1)*300 + 1):(i*300) ,s-2] <- test_binned_matrix[((i-1)*300 + 1):(i*300),s]/gene_total
    } else{
      test_binned_matrix2[((i-1)*300 + 1):(i*300) ,s-2] <- 0
    }
  }
}





      


rn <- bin_matrix$"bin#"
bin_num <- c(rev(rn[1:length(which(bin_matrix[,6]=="-"))]), rn[(length(which(bin_matrix[,6]=="-"))+1):length(rn)])
test_binned_matrix <- cbind(bin_num, binned_matrix)


metagene_table <- metatable(numberbin, filesbw, test_binned_matrix2)
metagene_table <- as.data.frame(matrix(NA, nrow=numberbin, ncol = length(filesbw)))
colnames(metagene_table) <- names(filesbw) 

for (i in 1:numberbin) { 
  for (j in 1:length(filesbw)) {
    
    metagene_table[i,j] <- mean(test_binned_matrix2[which(binned_matrix[,1]==i),j])
    
  }
}

combined <- comstrand(metagene_table)


graph_samples(combined*10^7)
