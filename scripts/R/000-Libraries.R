###------LIBRARY SETUP-----
## @knitr libraries

rm(list = ls()) # Remove Previous Workspace
gc(reset = TRUE) # Garbage Collection


# R Workspace Options
options(scipen = 12) # Scientific Notation
options(digits = 6) # Specify Digits
options(java.parameters = "-Xmx1000m") # Increase Java Heap Size


#Functions, Libraries, & Parallel Computing 
## Functions 
# Specify Number of Digits (Forward)
numb_digits_F <- function(x,y){
  numb_digits_F <- do.call("paste0", list(paste0(rep(0, y - nchar(x)), collapse = ""), x))
  numb_digits_F <- ifelse(nchar(x) < y, numb_digits_F, x)
}

# Remove Double Space 
numb_spaces <- function(x) gsub("[[:space:]]{2,}", " ", x)


# Install and load pacman for easier package loading and installation
if (!require("pacman", character.only = TRUE)){
  install.packages("pacman", dep = TRUE)
  if (!require("pacman", character.only = TRUE))
    stop("Package not found")
}


# Libraries
pkgs <- c(
  "tidyverse",     # Tidyverse
  "data.table",    # Data Management/Manipulation
  "doParallel",    # Parallel Computing
  "foreach",       # Parallel Computing
  "openxlsx",      # Microsoft Excel Files
  "stringi",       #Character/String Editor
  "stringr",       # Character/String Editor
  "reshape2",      # Data Management/Manipulation
  "scales",        # Number formatting
  "cowplot",       # Plot Grids
  "tmap",          # Cartography
  "tmaptools",     # Cartographic tools
  "sp",            # Spatial Objects
  "grid",          # Plot Grids
  "kableExtra",    # Pretty Tables
  "pdftools",      # Load pdfs
  "R.utils",       # Utilities
  "IDPmisc",        # Quality na.rm
  "ggrepel",
  "raster",
  "gridExtra",
  "magick",
  "pdftools",
  "readxl",
  "zoo",
  "bsts",
  "CausalImpact",
  "kableExtra",
  "philentropy",
  "ggridges",
  "janitor",
  "gghighlight",
  "inflection",
  "ggpubr",
  "gtable",
  "gridExtra"
  
)

# Install missing packages
# Will only run if at least one package is missing

if(!sum(!p_isinstalled(pkgs))==0){
  install.packages( pkgs[!p_isinstalled(pkgs)])
}

# load the packages
p_load(pkgs, character.only = TRUE)
rm(pkgs)

write.excel <- function(x,row.names=FALSE,col.names=TRUE,...) {
  write.table(x,"clipboard",sep="\t",row.names=row.names,col.names=col.names,...)
}


##Parallel Computing 
# Establish Parallel Computing Cluster
clusters <- makeCluster(detectCores() - 1) # Create Cluster with Specified Number of Cores
registerDoParallel(clusters) # Register Cluster
# Parallel Computing Details
getDoParWorkers() # Determine Number of Utilized Clusters
getDoParName() #  Name of the Currently Registered Parallel Computing Backend
getDoParVersion() #  Version of the Currently Registered Parallel Computing Backend