regionlist <- function (plus, minus, pos_strand="//biochstore4.bioch.ox.ac.uk/Mellor/Rosa/pos_strand_annotations.bed", neg_strand="//biochstore4.bioch.ox.ac.uk/Mellor/Rosa/neg_strand_annotations.bed") {
  
  #Standard is genes according to Steinmetz lab Pechano et al. 2013
  genes_plus <-read.table(pos_strand)
  genes_minus <- read.table(neg_strand)
  
  promoter_regionPlus <- genes_plus[(genes_plus$V3-genes_plus$V2)>1000,]
  promoter_regionPlus <- promoter_regionPlus[(promoter_regionPlus$V3-promoter_regionPlus$V2)<4000,]
  promoter_regionPlus1 <- promoter_regionPlus
  promoter_regionPlus[,3] <- promoter_regionPlus1[,2]+plus
  promoter_regionPlus[,2] <- promoter_regionPlus1[,2]-minus
  
  promoter_regionMinus <- genes_minus[(genes_minus$V3-genes_minus$V2)>1000,]
  promoter_regionMinus1 <- promoter_regionMinus[(promoter_regionMinus$V3-promoter_regionMinus$V2)<4000,]
  promoter_regionMinus1 <- promoter_regionMinus
  promoter_regionMinus[,3] <- promoter_regionMinus1[,3]+minus
  promoter_regionMinus[,2] <- promoter_regionMinus1[,3]-plus
  
  promoter_region <- rbind(promoter_regionMinus, promoter_regionPlus) ### don't change the order of minus/plus region without changing the renaming of the rownames of the minus strand just after the CountOverlap bit (chunk 5)
  
  res <- list(promoter_region=promoter_region, genes_plus=promoter_regionPlus1, genes_minus=promoter_regionMinus1)
  
  return(res)
}
