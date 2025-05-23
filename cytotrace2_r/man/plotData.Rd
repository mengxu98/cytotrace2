% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotting.R
\name{plotData}
\alias{plotData}
\title{Plot Data}
\usage{
plotData(
  cytotrace2_result,
  annotation = NULL,
  expression_data = NULL,
  is_seurat = FALSE,
  slot_type = "counts",
  pc_dims = 30,
  seed = 14
)
}
\arguments{
\item{cytotrace2_result}{output of cytotrace2 function (a dataframe with genes as rows and cells as columns,
or a Seurat object containing predictions of raw and final potency scores and categories)}

\item{annotation}{Dataframe, contains annotation data ' (optional, default is NULL, used only in phenotype based plots)
Has rownames which are single cell IDs as in expression data, and at least 1 columns for the phenotype/grouping variable of interest}

\item{expression_data}{Dataframe, expression data to be used for plotting
If cytotrace2 is a Seurat object and is_seurat = TRUE, can be left NULL (default is NULL).}

\item{is_seurat}{Logical, indicating whether the input is a Seurat object (default is FALSE). 
If TRUE and Seurat object contains PCA and UMAP embeddings, those will be automatically used for visualization, otherwise, PCA and UMAP will be calculated.}

\item{slot_type}{Character, indicating the type of slot to access from "RNA" assay if provided is a Seurat object &
is_seurat = TRUE. Can be 'counts' or 'data' (default is 'counts')}

\item{pc_dims}{The number of principal components to use for UMAP visualization (default: 30).}

\item{seed}{integer specifying the seed for reproducibility in random processes (default is 14).}
}
\value{
A named list of 3 or 5 plots (3 UMAPs colored by predicted potency group, potency score and relative order,
and, if annotation file provided, 1 UMAP colored by phenotype and 1 boxplot of phenotype ~ potency score).
}
\description{
This function generates plots (UMAPs, Boxplots) based on the input expression,
prediction, and annotation data by functions of the Seurat library
}
\examples{
 # download the .rds file (this will download the file to your working directory)
 download.file("https://drive.google.com/uc?export=download&id=1ivi9TBlmzVTDGzNWQrXXeyL68Wug989K", "Pancreas_10x_downsampled.rds")
 # load rds
 data <- readRDS("Pancreas_10x_downsampled.rds")
 # extract expression data
 expression_data <- data$expression_data
 # running CytoTRACE 2 main function - cytotrace2 - with default parameters
 cytotrace2_result <- cytotrace2(expression_data)
 # extract annotation data
 annotation <- data$annotation
 # generate prediction and phenotype association plots with plotData function
 plots <- plotData(cytotrace2_result, expression_data, annotation)
 plots  

}
