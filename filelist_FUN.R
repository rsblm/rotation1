filelist <- function(bigwig_files_location, name, MinPlus_ann) {
  ##### makes a list of the bigwigfile locations to be used, expects a string with the path and a string with the name of the files to be analysed. 
  # Also associates names with the bigwig files, which is essential for later naming and combining strands
  # Does accept multiple names now if they are seperated by _and_
  
  name <- strsplit(name, "_and_")
  pat <- paste("*",name[[1]],"*.bw|*",name[[1]], "*.bigwig", sep="", collapse="|")
    filesbw <- dir(bigwig_files_location, pattern = glob2rx(pat), full.names=TRUE)
  
  names(filesbw) <- dir(bigwig_files_location, pattern = glob2rx(pat), full.names=FALSE)
  pat2 <- paste(MinPlus_ann[[1]], MinPlus_ann[[2]], ".bw", ".bigwig", "/", sep="|")
  names(filesbw) <- gsub(pat2, '', names(filesbw))
  
     if(identical(length(character(0)), length(filesbw))){
    print("Couldn't locate bigwig files")
       stop()
  }
  return(filesbw)
}
 

 