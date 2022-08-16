## R-Shiny-Apps  
### 1. Install  
- Install R: Choose the package for your OS.  
  Eg. [Windows](https://cran.r-project.org/bin/windows/base/)
- Install RStudio  
  Eg. [Windows](https://www.rstudio.com/products/rstudio/download/#download)  
- Install Shiny  
  At R session > install.packages("shiny")  
- Install shinythemes, ggplot2, DT (DataTable), plotly 
  At R session  
  > install.packages("shiny")
  > install.packages("shinythemes")  
  > install.packages("ggplot2")  
  > install.packages("dplyr")
  > install.packages('DT')  
  > install.packages('mongolite')  
  > install.packages('heatmaply')  
  > install.packages("plotly")  
  > install.packages("dash")   
  > install.packages("devtools")  
  > install_github("StatsWithR/statsr")  
### [My R code examples in Jupyternotebook](https://github.com/tuantla80/R-Shiny-Apps/tree/main/R_Examples)  
### [R Workshop at ANU](https://github.com/tuantla80/R-Shiny-Apps/tree/main/R%20workshops)  
### 2. Deploy apps  
#### 2.1. Shinyapps.io  
- Step 1. Access and sign-up to https://www.shinyapps.io/  
- Step 2. Install rsconnect (connect RStudio to your Shinyapps account) and 
  <br> make AUTHORIZE ACCOUNT as described at https://www.shinyapps.io/admin/#/dashboard
  > install.packages('rsconnect')  
- Step 3. Deploy: the below code at console 
  > library(rsconnect)
  > rsconnect::deployApp('path/to/your/app')  
  - Note 1: to run in production the file name should be  
    (1) Mono script: app.R  
    (2) Double script: server.R and ui.R  
  - Note 2: It will be public. To have data privacy, need a paid standard or premium accounts.
#### 2.2 Own server on Linux  
 
#### 2.3. Authentication  
  - Using [ShinyProxy](https://www.openanalytics.eu/tags/shinyproxy/)  
