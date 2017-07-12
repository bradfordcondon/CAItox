#import libraries

library('reshape')
library('plyr')
library('vegan')

#set path

setwd("/Users/chet/Dropbox/lepto_science letter_writing/CAIpythoncolab/PCA_CUT/")
##Read in all files
files <- dir('trimmedCUT/', pattern =".txt")
codonList <- list()
for(i in 1:length(files)){
  file <- read.table(paste("trimmedCUT/", files[i], sep=""),header=FALSE)
  set1<-file[,1:2]
  colnames(set1) <- c("codon", "percent")
set2<- file[,4:5]
colnames(set2)<- colnames(set1)
  set3<- file[,7:8]
  colnames(set3)<- colnames(set1)
  set4<- file[,10:11]
  colnames(set4)<- colnames(set1)
outCUT<- rbind(set1, set2, set3, set4)
outCUT$percent<- gsub('\\(', "", outCUT$percent) #remove parenthesis
inName <-  files[i]
 inName<- paste("ctrl", gsub("_CUT_Apr2017.txt.trim", "", inName), sep="_")
 codonList[[inName]]<- outCUT
}

files <- dir('toxCUT/', pattern =".txt")
for(i in 1:length(files)){
  file <- read.table(paste("toxCUT/", files[i], sep=""),header=FALSE)
  set1<-file[,1:2]
  colnames(set1) <- c("codon", "percent")
  set2<- file[,4:5]
  colnames(set2)<- colnames(set1)
  set3<- file[,7:8]
  colnames(set3)<- colnames(set1)
  set4<- file[,10:11]
  colnames(set4)<- colnames(set1)
  outCUT<- rbind(set1, set2, set3, set4)
  outCUT$percent<- gsub('\\(', "", outCUT$percent) #remove parenthesis
  inName <-  files[i]
  inName<- paste("tox", gsub("_tox_cut.txt", "", inName), sep="_")
  codonList[[inName]]<- outCUT
}




