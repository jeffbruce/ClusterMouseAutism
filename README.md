---
output: html_document
---
# ClusterMouseAutism

## Introduction

This project is an interactive web application coded in [R][1] for clustering mouse models of autism using neuroanatomical data.  It makes use of the [Shiny][2] web application framework (a package in R).  The app presents data from a research paper published in Molecular Psychiatry (reference) entitled <insert paper title> (reference).  

## Workflow

The app can be accessed in many ways.  Options include:

1. Launching the app locally, assuming you have R installed
    - download the app folder from GitHub
    - launch R in the terminal or launch RStudio
    - from within R, load the Shiny package and set your working directory to the folder _containing_ the app folder you just downloaded: 
        - setwd(_insert path name of app folder you just downloaded_)
    - launch the app with: 
        - runApp(appDir = 'ClusterMouseAutism', launch.browser = TRUE, display.mode = 'normal'), which will launch the app in your default browser
2. Launch the app directly from GitHub
    - use this command: 
        - runGitHub(repo='ClusterMouseAutism', username='jeffbruce')
    - this option distorts the style of the app for whatever reason
3. Access the app through the web
    - the app is currently hosted on a private Shiny server which resides on a Linux virtual machine
    - the app can be accessed by visiting the following site: 
        - <insert domain here>

## Dependencies

If you decide to run the app locally, you will need a number of R packages installed, potentially along with some additional configuration.

- R packages:
    - shiny
    - gplots
    - ggplot2
    - data.table
    - plyr
    - reshape2
    - stats
    - Hmisc
- Additional configuration:
    - none known as of yet

## Development Notes and Rationales

#### Inspirations

- Devium Web (reference)
- Radiant (reference)

<!---
References
-->
[1]: http://www.r-project.org/
[2]: http://shiny.rstudio.com/