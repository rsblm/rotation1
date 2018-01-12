source("https://bioconductor.org/biocLite.R")
biocLite("GenomicRanges")
biocLite("ggplot2")
biocLite("rtracklayer")
library("rtracklayer")
library("GenomicRanges")
library("ggplot2")

##### Constructing genomic intervals of interest

source("/home/immd0754/Documents/R_things/General R scripts/metagene/regionlist_length_yeast_FUN.R")
res <- regionlist(plus=1000, minus=500, pos_strand="/home/immd0754/S_MELLOR/Rosa/pos_strand_annotations.bed", neg_strand="/home/immd0754/S_MELLOR/Rosa/neg_strand_annotations.bed")

promoter_region <- res$promoter_region
genes_plus <- res$genes_plus
genes_minus <- res$genes_minus


##### Data import

source("/home/immd0754/Documents/R_things/General R scripts/metagene/filelist_FUN.R")
filesbw <- filelist("/home/immd0754/S_MELLOR/Rosa/cerevisiae_dataForRosa", "uzun", MinPlus_ann=c("plus|posstrand|unipos","minus|negstrand|unimin"))


###### Make a matrix with the bins for every gene

source("/home/immd0754/Documents/R_things/General R scripts/metagene/bin_genelist_FUN.R")
listwv <- bin_matrix(promoter_region, binsize=5)
bin_matrix <- listwv$bin_matrix
bin_grange <- listwv$bin_grange
numberbin <- listwv$numberbin



##### CountOverlap bit
source("/home/immd0754/Documents/R_things/General R scripts/metagene/countoverlap_fun.R")
binned_matrix <- overlapcount(bin_grange, filesbw, bin_matrix, MinPlus_ann=c("plus|posstrand|unipos","minus|negstrand|unimin"))

###Reverse rownames of negative strands: WORKS ONLY AS LONG AS genes_minus is first half, otherwise you have to change this bit
source("C:/Users/immd0754/Documents/R_things/General R scripts/metagene/revneg_fun.R", local=T)
stri_bins <- revneg(bin_matrix)


##### sum over bins

source("C:/Users/immd0754/Documents/R_things/General R scripts/metagene/normalisiation_FUN.R")
binned_matrix <- normalisation(binned_matrix,numberbin)

source("C:/Users/immd0754/Documents/R_things/General R scripts/metagene/bin_sum_withapply_FUN.R")
metagene_table <- bin_sum(binned_matrix, stri_bins)

source("C:/Users/immd0754/Documents/R_things/General R scripts/metagene/combstrand_fun.R")
combined <- comstrand(metagene_table)



############ what has happened to genes that are overlapping. Multiple transcription start sites.
############ data is not normalised yet?


source("C:/Users/immd0754/Documents/R_things/General R scripts/metagene/graph_samples_fun.R")
graph_samples(combined, plus=1000, minus=500, numberbin, name="booth")
