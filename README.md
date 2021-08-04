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
  - TBU (To be updated) 
#### 2.3. Authentication  
  - Using [ShinyProxy](https://www.openanalytics.eu/tags/shinyproxy/)  
  - TBU  
### 3. Demo apps  
#### 3.1. App_01_Mining Stock_using_ggplot  
- Source code  
- Features:
  - Several tabs
  - Sliders and get values to calculate a new column
  - Scatter plot with brush selection  
  - Datatable of the brush selection  
  - Download datable as csv 
  - Embeded iframe video from youtube  
- Deployment using Shinyapps.io  
At console run: 
  ```commandline
  > library(rsconnect)
  > rsconnect::deployApp('C:/AI/R-Shiny-Apps/App_01_Mining Stock')
  
  Output:
  Preparing to deploy application...DONE
  Uploading bundle for application: 4340562...Detecting system locale ... en_AU
  DONE
  Deploying bundle: 4775276 for application: 4340562 ...
  Waiting for task: 962766641
    building: Parsing manifest
    building: Building image: 5477946
    building: Installing packages
    building: Installing files
    building: Pushing image: 5477946
    deploying: Starting instances
    rollforward: Activating new instances
    success: Stopping old instances
  Application successfully deployed to https://r-apps-at-apf.shinyapps.io/app_01_mining_stock/
  ```  
Now we can access at: https://r-apps-at-apf.shinyapps.io/app_01_mining_stock/   
