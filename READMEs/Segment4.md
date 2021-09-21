# Presentation
## Topic
The question we are seeking to answer is whether proximity to a professional baseball or basketball venue has any effect on the revenues of college athletics programs with regard to those sports. This topic was chosen becasue the data were readily available and the question was of personal interest to our teaam.

## Data Sources
- College and financial data from Equity in Athletics Data Analysis (EADA).
- MLB teams/stadiums from **https://appac.github.io/mlb-data-api-docs/#team-data-list-teams-get**
- NBA teams/stadiums from **https://en.wikipedia.org/wiki/National_Basketball_Association**
- Geographical coordinates via Wikimedia API.
- Distances to nearest professional stadiums computed using coordinates for stadiums and schools.

## Data Exploration
Our dataset consists of information from 1,808 colleges and universities whose pages were geotagged on Wikipedia. The original EADA table contained 2,074 schools, so approximately 13% of the data was lost because coordinates for the school could not be found through Wikimedia's API. We hypothesize that these schools without geotagged Wikipedia pages are mostly small colleges. Three additional schools were dropped because they shared names with schools outside the United States and were therefore mislocated by the API.

We hypothesize that most of the schools that had to be dropped were relatively small. Thus, the loss of these data points is not especially significant for our project, since we are more interested in the revenues of larger schools, and because it seems evident that smaller schools will have lower revenues in virtue of a smaller student/alumni base, bracketing all other factors.

Exploratory data analysis revealed no correlation between distance from professional teams and revenues for the whole dataset, but notable levels of correlation when the schools are grouped by region. This suggests that the region in which a college is located may be significant factor in determining the revenues for baskentball and baseball at that school. 

All Schools

<img width="497" alt="corr_matrix_all" src="https://user-images.githubusercontent.com/80861610/133851044-765134e5-3580-46d5-8cf6-500b8ba37e8a.png">

Grouped by Region

<img width="484" alt="corr_matrix_region" src="https://user-images.githubusercontent.com/80861610/133851049-394d8e9c-961e-4a8c-b1a3-70cd82e456ce.png">

# GitHub
## Communication Protocols
Communication will be done over Slack. Project members should check the check the channel designated for this project regularly.

## Project outline
The project is broken into four parts:
1. Data gathering and transformation in Jupyter Notebook. (Complete.)
2. Machine learning using Scikit Learn. (Near complete.)
3. Data visualization using Tableau. (In progress.)
4. Final presentation as slideshow and webpage. (Started.)

# Machine Learning
## Overview
We attempted to apply several machine learning algotithms to out data to develop models of the correlation between distance from professional stadiums and other relevant factors and the revenues of college programs. Multiple linear regression, random forest regression, and AdaBoost methods were all unsuccessful at correlating the input factors to revenues in either sport. Possible reasons for this lack of success are the relatively small number of data points (<2000 for either sport) and the shape of the overall distribution (which I hypothesize to be bimodal with a split betwee high-revenue schools and a larger number of low-revenue schools). 

## Data Preprocessing and Feature Selection
The data input for our machine learning model was a combination of the columns from our school_geo and eada tables that we determined were relevant for the model. The features deemed relevant were:
1. Size of student body.
2. Revenue for baseball/men's basketball.
3. Region in which school is located.
4. Whether the school is in NCAA Div. I or not.
5. Whether the school is public or private, for-profit or non-profit, 2 year or 4 year.
6. Distance to nearest MLB/NBA stadium.

These features were selected because they were available or derivable from the EADA dataset and seemed most likely to contribute to sports revenues.

We examined the baseball and basketball data seperately, so information related particularly to each sport was not included in the machine learning model of the other. When schools did not have  revenues reported for the sport being considered, their data was dropped prior to machine learning analysis. Thus, 1,418 schools were included in the baseball model and 1,647 schools in the basketball model.

Additionally all schools whose region was "Other," i.e., was not in the continental United States, was dropped from the dataset. These schools were outliers in the context of our analysis in light of their being geographically or culturally separated from the continental US.

## Model Setup
Prior to running machine learning algorithms, categorical features were converted to binary variables using Scikit Learn's OneHotEncoder method. The revenue for baseball/basketball was then isolated from the rest of the data as the target vaviable, and the data was split into training and testing sets using the train_test_split method. Finally all features were scaled using the StandardScaler method, which transforms the values for each feature to the Z-scores for the distribution of that feature in the training data.

## Application of Machine Learning Methods
We decided to analyze the data with three different machine learning methods: multiple linear regression (MLR), random forest regression (RFR), and AdaBoost regression (ABR). 

The benefit of MLR is that it is the simplest model to understand and returns coefficients representing the magnitudes and directions of the relations between each feature and the dependent variable (revenue). 

RFR and ABR are more complex ensemble methods. RFR combines multiple decision tree models to produce an aggregate model. ABR creates several models over a series of iterations, where in each iteration it attempts to correct the bad predictions of the previous iteration. These models are therefore have capabilities to produce more finely-tuned models than MLR.

## Results of Machine Learning Methods
All three models performed poorly for baseball revenues, and none achieved an r2-score of greater than .2. 

All models were more successful with basketball revenues, but both were still only able to achieve r2-scores between .2 and .5.

# Database
Our database uses PostgreSQL and the schema outlined in the Database folder. Our machine learning programs use tables pulled directly from this database.

# Dashboard
Our final dashboard will be created from Tableau visualizations hosted on a webpage. It will have features allowing users to filter our data based on important parameters like region and school size.
It will also allow viewers to search our database to find the distances of colleges to the nearest MLB and NBA teams.

# Conclusions
We fail to show that there is a simple correlation between college baseball/basketball revenue and the distance to the nearest professional sports team of that sport. However, grouping by region does suggest that regions with less NBA/MLB teams have higher median revenue for those sports at the collegiate level.

Additional analysis that could supplement the work we have done would be to incorporate other college sports (particularly hockey and football) and to analyze them in the same we we treated baseball and basketball. If we had to do the project over, we might have tried to incorporate this.
