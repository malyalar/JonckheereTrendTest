# JonckheereTrendTest

A simplified, modifiable R function to conduct the Jonckheere-Terpstra trend test, a method of comparing trends in distributions corresponding to ordinal indepedent factors.

    Information:
  
    The Jonckheere-Terpstra test is a test that evaluates 
    trends in data of the following type:
        1) Ordinal independent variables
        2) Continuous dependent variable 
        3) Likert dependent variable with >7 options.
    
    Data that can be plotted as boxplots with all the groups 
    being ordered relative to each other should be evaluated 
    using this test, not ANOVA (which is for unordered groups)

    In my most recent use case, I used this test to compare a
    set of Vitamin D statuses ("excess", "normal", "deficient"),
    for the parathyroid hormone level in each (continuous variable).
    
    Vitamin D, a continuous variable, was intervaled into subgroups
    based on biological relevance (>110ng/mL="excess", 50-110="normal")
    It was not pertinent to use linear regression, since I wanted
    to specifically see the relevance of the classifications we made.
    
    This file contains the following functionalities:
       1) Simple two-column dataframe parsing with or without header
          to conduct the hypothessis test. Uses the function:
          "JonchkeereTest()"
       2) Automatically conduct post-hoc tests with option:
          "posthoc=TRUE" and "posthoc.select=c("x","y","z"...)"
       3) Conduct the test from summary data only with function
          "JonchkeereSummaryTest()"
