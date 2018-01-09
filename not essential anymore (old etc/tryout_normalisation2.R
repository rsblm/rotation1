test_binned_matrix <- binned_matrix[,1:4]


test_df <- as.data.frame(matrix(NA, nrow=nrow(promoter_region), ncol=ncol(test_binned_matrix)))

for (i in nrow(test_df)) {
test_df[i,] <- colSums(test_binned_matrix[i:numberbin+i,])

}

test_binned_matrix[1:numberbin,] <- test_binned_matrix[1:numberbin,]/a 
head(test_binned_matrix)


test_binned_2 <- cbind(bin_matrix[,1], as.data.frame(test_binned_matrix))




gene_average <- c()

colSums(test_binned_matrix[1:300,])






############# Test other point of combining strands

test_binned_matrix2 <- comstrand(binned_matrix)

source("C:/Users/immd0754/Documents/R_things/General R scripts/metagene/revneg_fun.R", local=T)
test_binned_matrix <- revneg(test_binned_matrix, bin_matrix)

test_binned_matrix2 <- revneg(binned_matrix, bin_matrix)

binned_matrix <- revneg(binned_matrix, bin_matrix)

df2 <- data.frame(bin_matrix$gene, test_binned_matrix)
listave <- by(df2[,2:5], INDICES =df2$bin_matrix.gene  , FUN=colSums)
#Needs an if stop loop if no cols with the same name
df3 <- as.data.frame(do.call(rbind,listave))


rn_test <- rownames(test_binned_matrix)
rownames(test_binned_matrix) <- c(rev(rn[1:length(which(bin_matrix[,6]=="-"))]), rn[(length(which(bin_matrix[,6]=="-"))+1):length(rn)])

rownames(binned_matrix) <- bin_matrix[,2]
rn <- rownames(binned_matrix)
rownames(binned_matrix) <- c(rev(rn[1:length(which(bin_matrix[,6]=="-"))]), rn[(length(which(bin_matrix[,6]=="-"))+1):length(rn)])


identical(rownames(binned_matrix), rownames(test_binned_matrix))

colSums(binned_matrix[,1:4])
colSums(test_binned_matrix[,])



normal <- function()





























colnames(binned_matrix) <- c("binnum", gsub('//biochstore4.bioch.ox.ac.uk/Mellor/Rosa/cerevisiae_dataForRosa/xrn1_glugalData/NETseq/*|*.bigwig|*negstrand*|*posstrand*|*.bw|*unimin*|*unipos*', "", filesbw))
