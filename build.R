# Build the html documentation

## install packagedocs if not installed:
if(!require("packagedocs")) {
  devtools::install_github("lhsego/packagedocs")
}

knitr::opts_knit$set(root.dir = normalizePath("."))

# Render the documents
packagedocs::render_docs(
  code_path = "~/R/Smisc",
  docs_path = ".",             # location of docs directory
  package_name = "Smisc",      # name of the package
  main_toc_collapse = TRUE,    # use collapsing toc on main page
  rd_toc_collapse = TRUE,      # use collapsing toc on rd page
  lib_dir = "assets",          # put assets in "assets" directory
  render_main = TRUE,          # render main page
  render_rd = TRUE,            # render rd page
  view_output = FALSE,         # look at the output after render
  rd_index = "./rd_index.yaml" # optional path to rd layout yaml
)

# Ensure the 'rsed' package is installed
if(!require("rsed")) {
  devtools::install_github("pnnl/rsed")
}

# Manual edits of index.html
rsed::streamEdit(list(# Map links for pkbinom to dkbinom
                      s = list(pattern = "rd.html#pkbinom", replacement = "rd.html#dkbinom", fixed = TRUE),

                      # Copyright on page
                      s = list(pattern = paste("Battelle Memorial Institute,", substr(Sys.Date(), 1, 4)),
                               replace = "Battelle Memorial Institute, 2016",
                               fixed = TRUE)),
                 
                 inFile = "index.html", outFile = "index.html")

# Manual edits of rd.html
rsed::streamEdit(list(# Links for LICENSE
                      s = list(pattern = "BSD_3_clause + file LICENSE",
                               replacement = paste("<a href=https://cran.r-project.org/web/licenses/BSD_3_clause>BSD_3_clause</a> +",
                                                   "<a href='LICENSE.txt'>LICENSE</a>"),
                               fixed = TRUE),

                      # Add links to imported CRAN packages
                      s = list(pattern = "parallel, utils, plyr, doParallel, methods",
                               replacement = paste("<a href=https://www.rdocumentation.org/packages/parallel>parallel</a>,",
                                                   "<a href=https://www.rdocumentation.org/packages/utils>utils</a>,",
                                                   "<a href=https://CRAN.R-project.org/package=plyr>plyr</a>,",
                                                   "<a href=https://CRAN.R-project.org/package=doParallel>doParallel</a>,",
                                                   "<a href=https://www.rdocumentation.org/packages/methods>methods</a>"),
                               fixed = TRUE),

                      # Add links to suggested CRAN packages
                      s = list(pattern = "testthat, foreach",
                               replacement = paste("<a href=https://CRAN.R-project.org/package=testthat>testthat</a>,",
                                                   "<a href=https://CRAN.R-project.org/package=foreach>foreach</a>"),
                               fixed = TRUE),
                                                   
                      # Fix left link for dkbinom
                      s = list(pattern = '<li><a href="#dkbinom">dkbinom</a></li>',
                               replacement = '<li><a href="#dkbinom">dkbinom, pkbinom</a></li>',
                               fixed = TRUE),
                      
                      # Fix header text for dkbinom
                      r = list(at = "<h2>dkbinom</h2>",
                               replacement = "<h2>dkbinom, pkbinom</h2>",
                               fixed = TRUE),
                      
                      # Fix the print method for hpd
                      r = list(at = "printhpd(x",
                               replacement = "## S3 method for class 'hpd'\nprint(x, ...)",
                               fixed = TRUE),

                      # Fix the plot method for hpd                      
                      r = list(at = "plothpd(x",
                               replacement = "## S3 method for class 'hpd'\nplot(x, ...)</code></pre>",
                               fixed = TRUE),
                      
                      # Fix the print method for movAvg2
                      r = list(at = "printmovAvg2(x",
                               replacement = "## S3 method for class 'movAvg2'\nprint(x, ...)",
                               fixed = TRUE),

                      # Fix the plot method for movAvg2                      
                      r = list(at = "plotmovAvg2(x",
                               replacement = "## S3 method for class 'movAvg2'\nplot(x, ...)</code></pre>",
                               fixed = TRUE),

                      # Fix the print method for cusum
                      r = list(at = "printcusum(x",
                               replacement = "## S3 method for class 'cusum'\nprint(x, ...)",
                               fixed = TRUE),

                      # Fix the plot method for cusum                      
                      r = list(at = "plotcusum(x",
                               replacement = "## S3 method for class 'cusum'\nplot(x, indexes = NULL, emphOOC = TRUE, ...)",
                               fixed = TRUE),

                      # Fix the signal method for cusum                      
                      r = list(at = "signalcusum(object",
                               replacement = "## S3 method for class 'cusum'\nsignal(object, ...)</code></pre>",
                               fixed = TRUE),

                      # Fix the link for grabLast in getExtension
                      s = list(pattern = "<code><a href='grabLast.html'>",
                               replacement = "<code><a href='#grablast'>",
                               fixed = TRUE),
                      
                      # Fix the link for plapply in dfplapply
                      s = list(pattern = "<code><a href='plapply.html'>",
                               replacement = "<code><a href='#plapply'>",
                               fixed = TRUE),
                      
                      # Fix the link for smartFilter in movAvg2
                      s = list(pattern = "<code><a href='smartFilter.html'>",
                               replacement = "<code><a href='#smartfilter'>",
                               fixed = TRUE),
                      
                      # Fix the link for smartTimeAxis in timeDiff.eg
                      s = list(pattern = "<code><a href='smartTimeAxis.html'>",
                               replacement = "<code><a href='#smarttimeaxis'>",
                               fixed = TRUE),
                      
                      # Fix the link for timeIntegration in PowerData
                      s = list(pattern = "<code><a href='timeIntegration.html'>",
                               replacement = "<code><a href='#timeintegration'>",
                               fixed = TRUE),
                      
                      # Fix the link for timeDiff in timeData
                      s = list(pattern = "<code><a href='timeDiff.html'>",
                               replacement = "<code><a href='#timediff'>",
                               fixed = TRUE),

                      # Copyright on page
                      s = list(pattern = paste("Battelle Memorial Institute,", substr(Sys.Date(), 1, 4)),
                               replace = "Battelle Memorial Institute, 2016",
                               fixed = TRUE)),
                 
                 inFile = "rd.html", outFile = "rd.html")
