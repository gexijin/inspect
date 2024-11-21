
# Inspect: An R Package for automated EDA (exploratory analysis)
Writtend mostly by GPT-4, this R package renders an EDA report based on this [R Markdown file.](https://raw.githubusercontent.com/gexijin/inspect/main/inst/eda.Rmd)  It can be used to generate an EDA [report like this,](https://rpubs.com/ge600/eda)  from any data set. You can also generate this report using the Shiny app [RTutor.](https://RTutor.ai)  Contact or feedback [Steven Ge](https://www.linkedin.com/in/steven-ge-ab016947/)

# Install & use
```
library("remotes")
install_github("gexijin/inspect")
library(inspect)

eda(mtcars)   # Generate EDA report for a data frame, i.e. mtcars
eda(iris, "Species")  # Specifying a dependent/target variable
```
#  Main goal
Exploratory data analysis (EDA) is an essential first step in any data science project. Consider it the equivalent of an annual doctor’s check-up but for data science projects. I have long believed that EDA can be automated as the tasks are very general. While there are existing R packages for EDA such as DataExplorer, summarytools, tableone, and GGally, I have not found what I was looking for. Leveraging GPT-4, I was able to create an EDA script in just a few hours.

Given a data set, the main idea is to streamline these steps:
1.  Starts with a data summary.
2.  Any missing values and outliers?
3.  Plots distribution of numerical variables using histograms and QQ plots. When excessive skewness is present, a log transformation is recommended.
4.  Distribution of categorical variables.
5.  It provides a general data overview with a heatmap and a correlation plot.
6.  Correlation matrix (corrplot)
7.  Scatter plots to examine correlations between numerical variables.
8.  It uses violin plots and performs ANOVA to study the differences between groups delineated by categorical variables.
9.  Are categorical variables independent of each other? Uses Chi-squared test and bar plots.

To use this RMarkdown file, you just need to obtain a copy from this GitHub repository. Replace the demo data file with your own, specify a target variable, and you’re ready to render the report.

If that sounds like too much work, simply upload your data file to [RTutor.ai](https://RTutor.ai), and click on the EDA tab. A comprehensive report will be generated in 2 minutes. The template was originally written for RTutor.

# Example plots

![Missing](https://github.com/gexijin/gEDA/assets/18232433/3b4d49cc-a9db-49ff-9790-2e6c5f6f5f4d)

##
![Correlation](https://github.com/gexijin/gEDA/assets/18232433/1c925e74-2b8d-41fd-9542-015e396c2f3c)

##

![Heatmap](https://github.com/gexijin/gEDA/assets/18232433/d16b5db4-4e32-4872-b7ac-df727a1b6a67)

##


![Histogram](https://github.com/gexijin/gEDA/assets/18232433/e67f51c7-be2e-403d-b56f-6130791650d3)

##


![Barplot](https://github.com/gexijin/gEDA/assets/18232433/5cef4db8-fc23-49e9-b6aa-0b822ecdc2b5)

##



![Scatter plot](https://github.com/gexijin/gEDA/assets/18232433/7ff6f681-7f91-4030-aefa-6bc7990e999b)

##


![Boxplot](https://github.com/gexijin/gEDA/assets/18232433/0f71123a-cce5-4a6a-9d98-217063951c24)

##


![Combination](https://github.com/gexijin/gEDA/assets/18232433/a57e1be7-7187-4b9c-9e10-2d884170d2f9)



Why do fathers take an extra pair of socks when they go golfing? In case they get a hole in one!
