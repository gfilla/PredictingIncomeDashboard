# Predicting Adult Income
This repository has demo materials for building a SPSS Modeler model, deploying it with Watson Machine Learning, and visualizing it with a Shiny dashboard.

### Contents:

- [Lab Instructions](https://github.com/gfilla/PredictingIncomeDashboard/tree/master/Lab%20Instructions) - PDF guide to building a SPSS Modeler Model
- [Modeler Flow](https://github.com/gfilla/PredictingIncomeDashboard/tree/master/Modeler%20flow) - a Modeler stream file that can be loaded instead of building with instructions
- [Dashboard](https://github.com/gfilla/PredictingIncomeDashboard/tree/master/Dashboard) - Materials needed to create an R Shiny dashboard to visualize the deployed model


---

## Finding the dataframe

- First log in to your account: https://datascience.ibm.com/
- Go
## Building the Modeler Flow

- [Follow the Lab Instructions to create a flow](https://github.com/gfilla/PredictingIncomeDashboard/tree/master/0.%20Lab%20Instructions)
- [Use a pre-built Modeler Flow](https://github.com/gfilla/PredictingIncomeDashboard/tree/master/1.%20Modeler%20flow)




## Running the Dashboard

### Load R.zip to your RStudio - Managing dependencies

0. [Get a Data Science Experience account (it's free!)](https://datascience.ibm.com/)
1. [Download the R.zip here](https://ibm.box.com/shared/static/fd8vgznfuv3x6rrx65vnxh4sj2chd7la.zip).
2. In your RStudio environment click `Upload`  then select the R.zip
<img src="https://github.com/gfilla/BankLoanPrediction/blob/master/img/upload.png" width= 400>

Note: This will take some time to complete

3. Click yes to the prompt about overwriting (unless you have R packages in your R directory you need to keep)

<img src="https://github.com/gfilla/BankLoanPrediction/blob/master/img/yes.png" width= 350>

4. Restart R!
<img src="https://github.com/gfilla/BankLoanPrediction/blob/master/img/restart.png" width= 300>


Now you are using the same package versions I used when developing the dashboard.

---

### Commands to run dashboard:

```r
# clone this repository to your RStudio
system("git clone https://github.com/gfilla/BankLoanPrediction.git")

# find the R markdown file and run
rmarkdown::run("BankLoanPrediction/dashboard/bankPredictionWML.Rmd")

```

---

### Challenges

1. Add new tab to the dashboard called `Data` with a view of the dataframe `testScores`
2. Replace the JSON output with visualization of your choice

---

### Hints:

1. Check out renderDataTable
2. Start by duplicating the viz in the demo and check out this [Plotly book](https://plotly-book.cpsievert.me/) to help find interesting plots


---

Created by [Greg Filla](https://www.linkedin.com/in/gfilla/)
