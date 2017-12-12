##### Data import function

filelist <- function(bigwig_files_location, name) {
  
  pat <- paste("*",name,"*.bw|*",name, "*.bigwig", sep="")
  filesbw <- dir(bigwig_files_location, pattern = glob2rx(pat), full.names=TRUE)
  names(filesbw) <- gsub('//biochstore4.bioch.ox.ac.uk/Mellor/Rosa/cerevisiae_dataForRosa|*_NETseq_minus.bw|*_NETseq_plus.bw|/uzun_*', '', filesbw)
  filesbw
  
     if(identical(length(character(0)), length(filesbw))){
    print("Couldn't locate bigwig files")
  }
}
 

 