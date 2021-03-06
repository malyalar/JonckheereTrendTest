#########################################################################
#
#   An easier Jonckheere-Terpstra test (for trend between ordered groups)
#   By Rohit Malyala. 
#   contact: malyalar@mcmaster.ca
#   2018-Aug-18
#
#
#   Information:
#   
#    The Jonckheere-Terpstra test is a test that evaluates 
#    trends in data of the following type:
#        1) Ordinal independent variables
#        2) Continuous dependent variable 
#        3) Likert dependent variable with >7 options.
#    
#    Data that can be plotted as boxplots with all the groups 
#    being ordered relative to each other should be evaluated 
#    using this test, not ANOVA (which is for unordered groups)
#
#    In my most recent use case, I used this test to compare a
#    set of Vitamin D statuses ("excess", "normal", "deficient"),
#    for the parathyroid hormone level in each (continuous variable).
#    
#    Vitamin D, a continuous variable, was intervaled into subgroups
#    based on biological relevance (>110ng/mL="excess", 50-110="normal")
#    It was not pertinent to use linear regression, since I wanted
#    to specifically see the relevance of the classifications we made.
#
#   --------------------------------------------------------------------
#
#   This file contains the following functionalities:
#       1) Simple two-column dataframe parsing with or without header
#          to conduct the hypothessis test. Uses the function:
#          "JonchkeereTest()"
#       2) Automatically conduct post-hoc tests with option:
#          "posthoc=TRUE" and "posthoc.select=c("x","y","z"...)"
#       3) Conduct the test from summary data only with function
#          "JonchkeereSummaryTest()"
#
#########################################################################

#########################################################################
#   Function JonchkeereTest:
#   
#   input parameters:
#   factors:            Dataframe colume with the (ordered) factors.
#   
#   factors.exclude:    Vector. Exclude certain factors from the test.
#  
#   factors.order:      Vector. By default ordering is alphabetical. If
#                       factors.exclude is used, you MUST use this to 
#                       rescore the order. For example, if you have 
#                       factors a,b,c,x,y,z, and you remove b, x, and z,
#                       you should reorder the factors as c("a","c","y")
#  
#   covariate:          Dataframe column with corresponding continuous
#                       variable for each factor. If data is missing...
#
#   impute:             A boolean describing whether to use group-mean 
#                       imputation, or to remove rows with missing data.
#                       Mean inputation here will take the mean of the
#                       covariate for each factor, and use that to replace
#                       missing covariate data. If factor data is missing,
#                       the covariate is assessed for which factor mean it 
#                       is closest to, and uses that factor as replacement. 
#                       Tends to reduce variance, and increase type I error.
#   
#   posthoc:            A boolean describing whether to conduct post-hoc
#                       t-tests on ALL factors.
#
#   posthoc.select:     A vector to exclude certain factors from post-hoc.
#
#   ---------------------------------------------------------------------
#   
#   Output:
#       1) The results and p-value of the JT test.
#       2) Results of serial post-hoc t-tests.
#          For your sake, don't include too many factors in the post-hoc.
#
##########################################################################


"JonchkeereTest" <- function(factors, covariate, factors.exclude,
                           factors.order, impute=F, posthoc=F,
                           posthoc.select)

(
    ## Check if coin and multcomp packages are loaded
    
    if(!require("coin"))
        (stop("Package 'coin' is required, and should be installed.\n
              Write the following command verbatim into the R console prompt: 
              \n
              > install.packages(\"coin\")" ) )
              
    ## repeat for the multcomp package          
    
    if(!require("multcomp"))
        (stop("Package 'multcomp' is required, and should be installed.\n
              Write the following command verbatim into the R console prompt: 
              \n
              > install.packages(\"multcomp\")" ) )
              
    ## create factors.list, an ordered list of factors for the JT test
        ## count unique strings in factor.list
        ## create vector of unique strings in alphabetical order

    ## remove factors from array according to factors.exclude
        ## resolve if strings in factors.exclude match factors.list
        ## error if strings in factors.exclude do not match factors.list
    
    ## reorder factors according to factors.order
        ## resolve if strings in factors.order match factors.list
        ## error if strings in factors.order do not match factors.list
    
    ## Imputation
        ## If impute=F (the default state) 
            na.rm ... yada yada.
        ## Include warning about number of missing observations
          
        ## If impute=T 
          ## resolve missing covariate values as described above
          ## resolve missing factor values as described above
          ## Include a warning about alpha error in output
          ## Include warning about number of replaced observations
            ## Missing factor values
            ## Missing covariate values
            
    ## Create covariates pieces.list 

        control <- c(40, 35, 38, 43, 44, 41)
        rough <- c(38, 40, 47, 44, 40, 42)
        accurate <- c(48, 40, 45, 43, 46, 44)

            pieces <- list(control, rough, accurate)
            n <- c(6, 6, 6)
            grp <- as.ordered(factor(rep(1:length(n),n)))
    
    ## Assign which indices in pieces.list belong to which factor
    
        (y <- unlist(pieces))
        k <- length(pieces)
        (x <- as.ordered(factor(rep(1:k,n))))
                  
    ## Call the actual JT function.







