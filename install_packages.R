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
