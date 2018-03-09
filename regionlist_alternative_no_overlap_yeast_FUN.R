regionlist <- function (plus, minus, pos_strand="/home/immd0754/S_MELLOR/Rosa/pos_strand_annotations.bed", neg_strand="/home/immd0754/S_MELLOR/Rosa/neg_strand_annotations.bed") {
#### List of regions of interest (for instance promoter proximal) based on reference genes/regions/genome
# For Yeast: Standard is genes according to Steinmetz lab Pechano et al. 2013
# This is a newer version that selects genes of certain lengths (currently >1000)
# Also output is now saved in /home/immd0754/Documents/R_things
  
  genes_plus <-read.table(pos_strand)
  genes_minus <- read.table(neg_strand)
  
  #Used try_remove_gene_overlap, remove_overlapping_genes function
  
  new_gene_list2 <- new_gene_list[new_gene_list$tot,]
  new_gene_list3 <- new_gene_list2[(new_gene_list2$V3-new_gene_list2$V2)>1000,1:6]

  
  #Select genes of length 1000<gene<4000    
  # To decide on length of genes, have a look at plot(sort(genes_minus$V3-genes_minus$V2))
  promoter_regionPlus <- new_gene_list3[new_gene_list3$V6=="+",]
  #promoter_regionPlus <- promoter_regionPlus[(promoter_regionPlus$V3-promoter_regionPlus$V2)<4000,]
  promoter_regionPlus1 <- promoter_regionPlus
  promoter_regionPlus[,3] <- promoter_regionPlus1[,2]+plus
  promoter_regionPlus[,2] <- promoter_regionPlus1[,2]-minus
  
  promoter_regionMinus <- new_gene_list3[new_gene_list3$V6=="-",]
  #promoter_regionMinus1 <- promoter_regionMinus[(promoter_regionMinus$V3-promoter_regionMinus$V2)<4000,]
  promoter_regionMinus1 <- promoter_regionMinus
  promoter_regionMinus[,3] <- promoter_regionMinus1[,3]+minus
  promoter_regionMinus[,2] <- promoter_regionMinus1[,3]-plus
  
 
  promoter_region <- rbind(promoter_regionMinus, promoter_regionPlus) ### don't change the order of minus/plus region without changing the renaming of the rownames of the minus strand just after the CountOverlap
  
  setwd("/home/immd0754/Documents/R_things")
  save(promoter_region, file="promoter_region.Rda")

}