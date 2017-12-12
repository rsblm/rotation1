comstrand <- function()

combined <- as.data.frame(matrix(NA, nrow=numberbin, ncol = (length(filesbw)/2)))
combined[,1] <- rowSums(metagene_table[,1:2])
combined[,2] <- rowSums(metagene_table[,3:4])


ggplot(data = combined, aes(x=1:numberbin)) + geom_line(aes(y=combined[,1], colour="dst1"))+ geom_line(aes(y=combined[,2], colour="spt4"))+ scale_colour_manual("", breaks = c("dst1", "spt4"), values = c("orange","cornflowerblue"))


ggplot(data = metagene_table, aes(x=1:numberbin)) + geom_line(aes(y=metagene_table[,1], colour="dst1_minus"))+ geom_line(aes(y=metagene_table[,2], colour="dst1_plus"))+ geom_line(aes(y=metagene_table[,3], colour="spt4_minus"))+ geom_line(aes(y=metagene_table[,4], colour= "spt4_plus")) + scale_colour_manual("", breaks = c("dst1_minus", "dst1_plus", "spt4_minus","spt4_plus"), values = c("red", "green", "blue","cornflowerblue"))
