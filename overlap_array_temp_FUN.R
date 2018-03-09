
```{r}
overlap_array <- function(norm=FALSE, plus=1000, minus=500, pos_strand="/home/immd0754/S_MELLOR/Rosa/pos_strand_annotations.bed", neg_strand="/home/immd0754/S_MELLOR/Rosa/neg_strand_annotations.bed", bigwig_files_location="/home/immd0754/S_MELLOR/Rosa/cerevisiae_dataForRosa", name="", MinPlus_ann=c("plus|posstrand|unipos","minus|negstrand|unimin")) {
# Function that combines several functions to make an overview array of a certain number of bwfiles per gene
# Default plus=1000 and min=500 bp from TSS
# Default pos_strand and neg_strand are according to Pelechano et al Nature 2013, bigwig_files_location ="/home/immd0754/S_MELLOR/Rosa/cerevisiae_dataForRosa" 
# Name accepts one or multiple names seperated by _and_, but also empty is okay
# Default MinPlus_ann=c("plus|posstrand|unipos","minus|negstrand|unimin"), if the correct plus/minus isn't included ("no strand specified") alter this
# Default is no normalisation, if you want to normalise set norm to TRUE  

  ##Alternative 5/2/18 for selected genes list
    
 
  promoter_region <- promoter_region

  
  
  source("/home/immd0754/Documents/R_things/General R scripts/metagene/filelist_FUN.R")
  filesbw <- filelist(bigwig_files_location, name, MinPlus_ann)
  
  
  source("/home/immd0754/Documents/R_things/General R scripts/metagene/bw_to_countmatrix_FUN.R")
  overview_sum <- bw_to_countmatrix(filesbw, promoter_region, plus, minus, MinPlus_ann)
  
  overview <- overview_sum$overview_exl
  sum_exl_read_dens <- overview_sum$sum_exl_read_dens
  
  source("/home/immd0754/Documents/R_things/General R scripts/metagene/rev_neg_array_FUN.R")
  overview <- rev_neg_array(overview, promoter_region[promoter_region$V6=="-",], sum_exl_read_dens)
  
  
  if (norm==TRUE) {
  source("/home/immd0754/Documents/R_things/General R scripts/metagene/normalise_array_FUN.R")
  overview <- normalise_array(overview, filesbw)
  } else {}
  
  list_overview <- list(overview, sum_exl_read_dens)
  
  return(list_overview)
  
}

```

