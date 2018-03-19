# Predicting Adult Income
This repository has demo materials for building a SPSS Modeler model, deploying it with Watson Machine Learning, and visualizing it with a Shiny dashboard.

### Contents:

- [Lab Instructions](https://github.com/gfilla/PredictingIncomeDashboard/tree/master/Lab%20Instructions) - PDF guide to building a SPSS Modeler Model
- [Modeler Flow](https://github.com/gfilla/PredictingIncomeDashboard/tree/master/Modeler%20flow) - a Modeler stream file that can be loaded instead of building with instructions
- [Dashboard](https://github.com/gfilla/PredictingIncomeDashboard/tree/master/Dashboard) - Materials needed to create an R Shiny dashboard to visualize the deployed model


---


## Building the Modeler Flow and deploying your model

- Follow [the Lab Instructions](https://github.com/gfilla/PredictingIncomeDashboard/tree/master/Lab%20Instructions) to create a flow and deploy the model.
  - You can also [use a pre-built Modeler flow](https://github.com/gfilla/PredictingIncomeDashboard/tree/master/Modeler%20flow)
  - *Note* - if using the pre-built flow, the lab instructions are still needed to save the model and create a deployment



## Running the Dashboard

- Open RStudio from the top navigation

![rstudio](https://github.com/gfilla/PredictingIncomeDashboard/blob/master/img/rstudio.png?raw=true)

- When RStudio opens, run this R command to close this repository:
```r
# clone this repository to your RStudio
system("git clone https://github.com/gfilla/PredictingIncomeDashboard.git")
```

- Now you have all the files in this repo copied to your RStudio directory. Run the following R command to install packages required for the dashboard to run:

```r
# find the R markdown file and run
source("PredictingIncomeDashboard/Dashboard/requirements.r")


```

The dependencies we need to install:
-  [`flexdashboard`](https://github.com/rstudio/flexdashboard)- created by RStudio to make it easy to build dashboards quickly using Shiny
- [`R4WML`](https://github.com/Davin-IBM/R4WML) - a great package written by [Davin Shearer](https://github.com/Davin-IBM) at IBM that makes it simple to score WML deployed models using R

- Now to run the dashboard, execute this command:

```r
# find the R markdown file and run
rmarkdown::run("PredictingIncomeDashboard/Dashboard/income_prediction_dashboard.Rmd")

```

This is a fully working dashboard.  To learn how this was built, follow the steps below.

---

## Building the Dashboard

If you followed the steps above, you now have all the materials of this repository cloned in your RStudio environment.

Inside the `Dashboard` folder, you will find a number of R files to help you build the dashboard.  Use these files in the following order to help you create the full dashboard:

- **Dashboard/dashboard_template.RMD** - This file is the foundation for your dashboard.  It has the layout in place and needs to be populated with chunks of R code
- **Dashboard/*.r files** - All the `R` files in the directory are short scripts that can be copied and pasted inside the dashboard template to add in functionality.  The template specifies which script should be copied in each section.

The only R script that needs to be edited is the `install_config.r` file.  For this file, follow these steps:

- First, obtain the credentials for your Watson Machine Learning service from IBM Cloud.  
- Go to [IBM Cloud](https://console.ng.bluemix.net/) and log in
- Click the three lines (hamburger) menu in the top left then click **Dashboard** to see your IBM Cloud services
- Open Watson Machine Learning and find your credentials:

![WML Creds](https://github.com/gfilla/PredictingIncomeDashboard/blob/master/img/getcreds.png?raw=true)

- From here you can copy the WML Username and Password required for the `install_config.r` script

To find the scoring_url for your deployed model, please follow [the Lab Instructions](https://github.com/gfilla/PredictingIncomeDashboard/tree/master/Lab%20Instructions)

---

### Challenges

1. Add new tab to the dashboard called `Data` with a view of the dataframe `testScores`
2. Replace the JSON output with visualization of your choice
3. Train a new model and update the dashboard to score with this model

---

### Hints:

1. Check out renderDataTable
2. Start by duplicating the viz in the demo and check out this [Plotly book](https://plotly-book.cpsievert.me/) to help find interesting plots
3. The scoring_url is the unique part of our dashboard that integrates the model

---

Created by [Greg Filla](https://www.linkedin.com/in/gfilla/)
