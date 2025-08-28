#First I had to install the dependencies:
#sudo apt-get install gfortran
#sudo apt-get install libcurl4-openssl-dev
#remove this file: rm ~/.R/Makevars because it calls CXX17 = g++-7 -std=gnu++17 -fPIC (from: https://ask.cyberinfrastructure.org/t/why-is-r-in-rstudio-attempting-to-build-package-binaries-with-g-7/3121)
#sudo apt-get install libpng-dev

install.packages(c("SeuratObject", "httr", "igraph", "irlba", "leidenbase", 
                 "lmtest", "plotly", "png", "RcppAnnoy", "reticulate", 
                 "RSpectra", "Rtsne")) 

#run in terminal: wget https://cran.r-project.org/src/contrib/Archive/Matrix/Matrix_1.6-4.tar.gz
install.packages("~/Documents/PCa/Matrix_1.6-4.tar.gz", repos = NULL, type="source")
install.packages("SeuratObject")
install.packages(c("sctransform", "spatstat.explore", 
                 "spatstat.geom", "uwot", "RcppEigen"))

install.packages("Seurat")
# sudo apt install libharfbuzz-dev libfribidi-dev
# sudo apt install libfontconfig1-dev
install.packages('devtools')
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("SummarizedExperiment")
devtools::install_github('immunogenomics/presto', force = TRUE)

install.packages("enrichR")
install.packages("readxl")
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
remotes::install_github('chris-mcginnis-ucsf/DoubletFinder', force = TRUE)

BiocManager::install("decoupleR", force = TRUE)
BiocManager::install("OmnipathR", force = TRUE)
install.packages("msigdbr")
install.packages("ggtext")
install.packages("clustree")
BiocManager::install("AnnotationHub")
#from https://bioconductor.org/packages/devel/bioc/vignettes/AnnotationHub/inst/doc/TroubleshootingTheHubs.html#default-caching-location-update
#because I got an error when calling AnnotationHub()
#error: Error in AnnotationHub() : 
#DEFUNCT: As of AnnotationHub (>2.23.2), default caching location has changed.
#Problematic cache: /home/ismini/.cache/AnnotationHub
#See https://bioconductor.org/packages/devel/bioc/vignettes/AnnotationHub/inst/doc/TroubleshootingTheCache.html#default-caching-location-update

#rappdirs::user_cache_dir(appname="AnnotationHub")
#tools::R_user_dir("AnnotationHub", which="cache")
# make sure you have permissions on the cache/files
# use at own risk


#moveFiles<-function(package){
#  olddir <- path.expand(rappdirs::user_cache_dir(appname=package))
#  newdir <- tools::R_user_dir(package, which="cache")
#  dir.create(path=newdir, recursive=TRUE)
#  files <- list.files(olddir, full.names =TRUE)
#  moveres <- vapply(files,
#                    FUN=function(fl){
#                      filename = basename(fl)
#                      newname = file.path(newdir, filename)
#                      file.rename(fl, newname)
#                    },
#                    FUN.VALUE = logical(1))
#  if(all(moveres)) unlink(olddir, recursive=TRUE)
#}

#package="AnnotationHub"
#moveFiles(package)
install.packages("caret")
install.packages("randomForest")
install.packages("pROC")
install.packages("tidyverse")
#had to apt install libgsl-dev and cmake first before installing the below packages
install.packages("RcppGSL")
devtools::install_github("DiseaseNeurogenomics/dreamlet")
install.packages('msigdbdf', repos = 'https://igordot.r-universe.dev')
install.packages("gprofiler2")
