For this project, we will be looking at 2012-2016 [General Social Survey](http://gss.norc.org/) (GSS) data on religious affiliation and beliefs. Specifically, we will be exploring whether the degree of congruence between affiliation and belief increases with a person's level of education.

Sociologists of religion have long been aware that there is only a moderate correlation at best between religious identity and religious beliefs and practices. Related to this point, the number of Americans who have no religious affiliation has grown substantially  from around 7% in the early 1990s to roughly 20-25% of the population today. Yet, many of these unaffiliated individuals (the "nones") still express belief in god and the afterlife and many also engage in religious activities like prayer of attendance at religious services. The degree to which non-affiliation predicts non-belief can be thought of as the congruence between religious identify and belief. We might hypothesize that increasing levels of education would increase this congruence by revealing an underlying cognitive dissonance between identity and beliefs (and thus causing individuals to shift one or the other). We will explore this hypothesis with the GSS data from 2012 to 2016. Specifically, we will look at the relationship between non-affiliation and belief in god. 

## Step 1: organize the data

I have used the handy [GSS Data Explorer](https://gssdataexplorer.norc.org/) to create a [small extract](https://gssdataexplorer.norc.org/projects/40124/extracts/37696?token=Edfdt_VMavs1vVuyALRy) of GSS data. 
This data extract is located in the `input` directory of this repository. The `organize_data.R` script contains some basic code that will load the data into R. However, the data are all in numeric format and have no missing values coded. You will need to code variables into proper factor variables (big hint [here](https://github.com/AaronGullickson/nones_beliefs_analysis/blob/master/organize_data.R)) and add missing values. The extract did not come with a codebook for the variables, but you can see the codes for each variable by searching for variables online through the [GSS explorer](https://gssdataexplorer.norc.org/projects/40124/variables/vfilter). You will need the following variables for the analysis:

- An ordinal variable measuring belief in god. This variable can be taken directly from the `GOD` variable in the extract but you need to code the numeric values into a factor variable and input missing values.
- a dichotomous variable indicating that a respondent has a current religious affiliation or not, drawn from the `RELIG` variable. 
- A dichotomous variable identical to the one above but drawn from the respondent's (retrospective) religious affiliation at age 16 which comes from the `RELIG16` variable.
- A variable for a respondent's age.
- A variable for respondent's sex. 
- You will also want to retain the weight variable named `WTSSALL`, the stratification identifier named `VSTRAT`, and the cluster identifier names `VPSU`. You will need to consider how to take account of the GSS survey design in your analysis. Some useful information (including example R code) can be found [here](https://gssdataexplorer.norc.org/pages/show?page=gss%2Fstandard_error).

## Step 2: Run the models

For all models you will need to consider how to handle issues such as missing values and sample design effects. 

### Independent Variables and Model Setup

On the right hand side of the equation all models should control for sex of the respondent, whether the respondent was religiously affiliated at age 16, the age of the respondent, and a squared term for the age of the respondent to allow for non-linearity. Its probably also a good idea to re-center age. 

You should then run a sequence of three nested models:

1. A model the predicts belief in god by affiliation/non-affiliation. This is the core measure of "congruence."
2. Add education as a control variable. This tells us how education affects belief in God generally and also how it might affect the strength of congruence. 
3. Add an interaction between education and affiliation/non-affiliation. This interaction will tell us the degree to which congruence between religious identity and belief increases or decreases with the level of education. 

### Dependent variable

The dependent variable for the models is belief in god, but I want you to consider three different ways of modeling this variable. 

1. Use a cumulative logit/ordered logit model with parallel effects. The command `svyolr` in the `survey` library will allow you to run this model while accounting for design effects. 
2. Use a cumulative logit/ordered logit model with non-parallel effects. You will not be able to run this within the `survey` package but you can run it for diagnostic purposes using the `VGAM` package. 
3. Collapse the five category ordinal variable measure into a binary variable of belief/non-belief in god. I will leave the decision about where to mark the cutpoint to you, but you should try to justify it based on the prior results. This is a straightforward logistic regression model that can be run using `glm` or `svyglm`. 

## Step 3: write up your results

Write up a brief report outlining what you did and what you found, using the supplied R Markdown file. Be sure to discuss any discrepancies in the findings depending on how you modeled the ordinal outcome.