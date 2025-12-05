FROM rocker/tidyverse:4.5.2
LABEL MAINTAINER="sminot@fredhutch.org"

# Install devtools
RUN R -e "install.packages('curl', repos = 'http://cran.us.r-project.org'); library(curl)"
RUN R -e "install.packages('httr', repos = 'http://cran.us.r-project.org'); library(httr)"
RUN R -e "install.packages('usethis', repos = 'http://cran.us.r-project.org'); library(usethis)"
RUN R -e "install.packages('ragg', repos = 'http://cran.us.r-project.org'); library(ragg)"
RUN R -e "install.packages('pkgdown', repos = 'http://cran.us.r-project.org'); library(pkgdown)"
RUN R -e "install.packages('devtools', repos = 'http://cran.us.r-project.org'); library(devtools)"
RUN R -e "install.packages('tidyverse', repos = 'http://cran.us.r-project.org'); library(tidyverse)"
RUN R -e "install.packages('vroom', repos = 'http://cran.us.r-project.org'); library(vroom)"
RUN R -e "install.packages('VGAM', repos = 'http://cran.us.r-project.org'); library(VGAM)"

# Install phyloseq
RUN apt update
RUN apt-get install -y libglpk-dev
RUN R -e "install.packages('igraph', dependencies=TRUE); library(igraph)"
RUN R -e "install.packages('BiocManager'); BiocManager::install('phyloseq'); library(phyloseq)"

# Install radEmu
RUN R -e "library(devtools); devtools::install_github('statdivlab/radEmu@b0f8b76f25181f3cb2df0616d5d23c23f58501d2'); library(radEmu)"
