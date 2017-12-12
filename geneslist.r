#### List of regions of interest (for instance promoter proximal) based on reference genes/regions/genome

regionlist <- function (plus, minus, pos_strand="//biochstore4.bioch.ox.ac.uk/Mellor/Rosa/pos_strand_annotations.bed", neg_strand="//biochstore4.bioch.ox.ac.uk/Mellor/Rosa/neg_strand_annotations.bed") {
 
   #Standard is genes according to Steinmetz lab Pechano et al. 2013
  genes_plus <-read.table(pos_strand)
  genes_minus <- read.table(neg_strand)
  
  promoter_regionPlus <- genes_plus[]
  promoter_regionPlus[,3] <- genes_plus[,2]+plus
  promoter_regionPlus[,2] <- genes_plus[,2]-minus
  
  promoter_regionMinus <- genes_minus[]
  promoter_regionMinus[,3] <- genes_minus[,3]+minus
  promoter_regionMinus[,2] <- genes_minus[,3]-plus
  
  promoter_region <- rbind(promoter_regionMinus, promoter_regionPlus) ### don't change the order of minus/plus region without changing the renaming of the rownames of the minus strand just after the CountOverlap bit (chunk 5)
  return(promoter_region)
}



