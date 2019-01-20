#!/usr/bin/env Rscript

getArgs <- function(verbose=FALSE, defaults=NULL) {
  myargs <- gsub("^--","",commandArgs(TRUE))
  setopts <- !grepl("=",myargs)
  if(any(setopts))
    myargs[setopts] <- paste(myargs[setopts],"=notset",sep="")
  myargs.list <- strsplit(myargs,"=")
  myargs <- lapply(myargs.list,"[[",2 )
  names(myargs) <- lapply(myargs.list, "[[", 1)

  ## logicals
  if(any(setopts))
    myargs[setopts] <- TRUE

  ## defaults
  if(!is.null(defaults)) {
    defs.needed <- setdiff(names(defaults), names(myargs))
    if(length(defs.needed)) {
      myargs[ defs.needed ] <- defaults[ defs.needed ]
    }
  }

  ## verbage
  if(verbose) {
    cat("read",length(myargs),"named args:\n")
    print(myargs)
  }
  myargs
}

args <- getArgs()
## Default setting when no arguments passed
SCRIPTPATH <- args$SCRIPTPATH
strain <- args$strain
output_path <- args$output_path


print(SCRIPTPATH)
print(strain)
print(output_path)

pMetaDataPath <- file.path(output_path, strain, "unique", "patientMetaData.csv")
pSuscData <- file.path(output_path, strain, "unique", "patientDrugSusceptibilityData.csv")
sweaveRep <- file.path(SCRIPTPATH, "Reports", "sweaveTB-WGS-Micro-Report.Rnw")
AbReport <- file.path(output_path, strain, "unique/")

print(pMetaDataPath)
print(pSuscData)
print(sweaveRep)
print(AbReport)


library(knitr)
library(dplyr)
library(ape) #needed in sweave doc
library(ggtree)
library(tinytex)


#source("http://bioconductor.org/biocLite.R")
#biocLite(ggtree)

#needed in sweave doc

options(warn=-1)


makeReport<-function(pInfo=NULL,drugDat = NULL){
  print("making report")
  id<-pInfo$ID
  print("copy the very original template")
  print(paste0(AbReport,id,"_strain",".Rnw", collapse =""))
  con<-file.copy(sweaveRep,
                 paste0(AbReport,id,"_strain",".Rnw", collapse =""),overwrite = TRUE)
  
  #print("environment variables magically get passed when compiled")
  Sweave2knitr(paste0(AbReport,id,"_strain",".Rnw", collapse =""),
               paste0(AbReport,id,"_strain",".Rnw"))
			   #print("checkpoint 1")
  con<-knit2pdf(paste0(AbReport,id,"_strain",".Rnw", collapse =""),
                compiler ='xelatex', quiet = F)
  print("moving and getting rid of extra files (just keep the pdf)")
  #file.remove(paste(paste0(id,"_strain",collapse=""),c(".log",".tex",".aux"),sep=""))
  file.rename(from=paste0(id,"_strain.pdf",collapse=""), 
              to=paste0(AbReport,id,"_strain.pdf",collapse=""))
 # file.remove(paste0(AbReport,id,"_strain",".Rnw"))
}

# Testing it out with some data. Each patient/sample needs to be included in this file. Test for blank case
print("Importing patDat")


patDat<-read.csv(file=pMetaDataPath,header=T,stringsAsFactors = F)
print("done")

print("Importing res data")
#Note, not tidy data, which is being converted into a tidy format
patDrugResistData<-read.csv(file=pSuscData,header=T,stringsAsFactors = F)
print("done")
#Not sure how different groups will handle the cluster data, I've just opted to do something
#Simple and random that illustrates that point. I will assume the phylogeny information comes
#from some other place. Everything is generated in the sweave template as a random tree

#Generating the reports
for(i in 1:nrow(patDat)){
  pInfo = patDat[i,]
  makeReport(pInfo,filter(patDrugResistData,ID == pInfo$ID))
}
