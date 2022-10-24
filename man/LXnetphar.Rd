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

library(devtools)
install_github("gluck4668/netphar")
library(netphar)

??netphar

setwd("D:/桌面/R_example/LXnetphar_example")

name <- c("地骨皮")

# 在https://tcmsp-e.com/tcmsp.php中输入中药名，然后copy网址

# website="https://tcmsp-e.com/tcmspsearch.php?qr=Lycii%20Cortex&qsr=herb_en_name&token=755efa934098c7e038b120ab0a0f416a"

netphar(name,website)

}
