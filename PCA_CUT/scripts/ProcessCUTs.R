#import libraries

library('reshape')
library('plyr')
library('vegan')
library('ggplot2')

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

#Generate distance matrix: https://stat.ethz.ch/R-manual/R-devel/library/stats/html/dist.html

setwd("/Users/chet/Dropbox/lepto_science letter_writing/CAIpythoncolab/PCA_CUT/")
##Read in all files
files <- dir('trimmedCUT/', pattern =".txt")
codonList <- data.frame(matrix(nrow=0,ncol = 64))

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
  outCUT$codon
  if (i ==1 ){
    colnames(codonList)<- outCUT$codon
  }
  inName <-  files[i]
  inName<- paste("ctrl", gsub("_CUT_Apr2017.txt", "", inName), sep="_")
  codonList[inName,]<-  outCUT$percent
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
  codonList[inName,]<-  outCUT$percent
}

d<- dist(codonList, method = "euclidean", diag = FALSE, upper = FALSE, p = 2)
d.mds <- metaMDS(d)  #using all the defaults
stressplot(d.mds)
goodness(d.mds)


#plot out
data.scores <- as.data.frame(scores(d.mds))  #Using the scores function from vegan to extract the site scores and convert to a data.frame
data.scores$gene <- c(rep("control", times= 10), c(rep("tox", times=10)))
data.scores$taxon <- c(rep(c("Aq", "Ar", "Ca", "Cc", "Ch", "Dz", "Li", "Lm", "Pb", "Pr"), times=2))

head(data.scores)  #look at the data

ggplot(data.scores, aes(x=NMDS1, y=NMDS2, color=taxon, shape=gene)) +
  geom_point(size = 5, alpha=0.5) + ggtitle("Codon usage tables for tox vs control")

