% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/genes.R
\name{addGeneNames}
\alias{addGeneNames}
\title{addGeneNames}
\usage{
addGeneNames(genes.data, orgDb="auto", keys=NULL, keytype="ENTREZID", names="SYMBOL")
}
\arguments{
\item{genes.data}{(GenesData object) A valid genes.dat object like the ones obtained by \code{\link{makeGenesDataFromTxDb}}}

\item{orgDb}{The orgDb object to use to extract the gene symbols. If "auto" the function will try to determine automatically the correct organism. See available obects at https://bioconductor.org/packages/release/BiocViews.html#___OrgDb (defaults to "auto")}

\item{keys}{(character vector ) The keys to be used in the internal select statement to get the names. If NULL, the first column of \code{mcols(GenesData$genes)} will be used. (defaults to NULL)}

\item{keytype}{(character) The keytype used in the internal select statement. (defaults to "ENTREZID", that is, gene_id)}

\item{names}{The column to extract from orgDb to use as gene names. (deafults to "SYMBOL")}
}
\value{
The original GenesData object with one additional column named "names" in 
\code{GenesData$genes$names}.
}
\description{
Adds the gene names (defaults to symbols) to a GenesData object to 
be used by kpPlotGenes
}
\details{
This function takes a valid data object and uses an OrgDb object to 
find the gene names (symbols by default) and add them. Names are added 
as a column named \code{names} to the \code{genes} element of GenesData 
and they replace anything that was present there before.
If no \code{ObjDb} object is given, the function will try to identify
the correct organism using the data in \code{GenesData$metadata} and
select the OrgDb object if available. If it cannot identify the organism 
or there's no valid OrgDb for that organism it will fail with an error.
Internally, the function uses a call to \code{AnnotationDbi::select} on
the OrgDb. It is possible to specify the keys and keytypes as well as
the column we want to use as names (defaults to SYMBOL for gene symbols).
}
\examples{
 

library(TxDb.Hsapiens.UCSC.hg19.knownGene)

zoom <- toGRanges("chr17:29e6-30e6")
kp <- plotKaryotype(genome="hg19", zoom=zoom)
genes.data <- makeGenesDataFromTxDb(TxDb.Hsapiens.UCSC.hg19.knownGene, 
                 karyoplot=kp, plot.transcripts=FALSE,
                 plot.transcripts.structure=FALSE)
genes.data <- addGeneNames(genes.data)
kpPlotGenes(kp, data=genes.data, r1=0.5, plot.transcripts=FALSE,
            gene.name.position = "left")
 
  
}
\seealso{
\code{\link{kpPlotGenes}}, \code{\link{makeGenesDataFromTxDb}}
}
