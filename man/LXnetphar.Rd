\name{LXnetphar}
\alias{LXnetphar}
\title{LXnetphar::LXnetphar}
\usage{
netphar(name,website)
}
\description{
The network pharmacology.
}
\examples{

install.packages("devtools")
library(devtools)

install_github("gluck4668/LXnetphar")
library(LXnetphar)

??LXnetphar

setwd("D:/桌面/R_example/LXnetphar_example")

name <- c("当归")

# 在https://tcmsp-e.com/tcmsp.php中输入中药名，然后copy网址

# website="https://tcmsp-e.com/tcmspsearch.php?qr=Angelicae%20Sinensis%20Radix&qsr=herb_en_name&token=c88d326638493acc09ee7a413aa83f00"

netphar(name,website)

}
