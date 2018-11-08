For this project, we will be looking at 2012-2016 [General Social Survey](http://gss.norc.org/) (GSS) data on religious affiliation and beliefs. Specifically, we will be exploring whether the degree of congruence between affiliation and belief increases with a person's level of education.

Sociologists of religion have long been aware that there is only a moderate correlation at best between religious identity and religious beliefs and practices. Related to this point, the number of Americans who have no religious affiliation has grown substantially  from around 7% in the early 1990s to roughly 20-25% of the population today. Yet, many of these unaffiliated individuals (the "nones") still express belief in god and the afterlife and many also engage in religious activities like prayer of attendance at religious services. The degree to which non-affiliation predicts non-belief can be thought of as the congruence between religious identify and belief. We might hypothesize that increasing levels of education would increase this congruence by revealing an underlying cognitive dissonance between identity and beliefs (and thus causing individuals to shift one or the other). We will explore this hypothesis with the GSS data from 2012 to 2016. Specifically, we will look at the relationship between non-affiliation and belief in god. 

## Step 1: organize the data

I have used the handy [GSS Data Explorer](https://gssdataexplorer.norc.org/) to create a [small extract](https://gssdataexplorer.norc.org/projects/40124/extracts/37696?token=Edfdt_VMavs1vVuyALRy) of GSS data. 
This data extract is located in the `input` directory of this repository. The `organize_data.R` script contains some basic code that will load the data into R. However, the data are all in numeric format and have no missing values coded. You will need to code variables into proper factor variables (big hint [here](https://github.com/AaronGullickson/nones_beliefs_analysis/blob/master/organize_data.R)) and add missing values. The extract did not come with a codebook for the variables, but you can see the codes for each variable by searching for variables online through the [GSS explorer](https://gssdataexplorer.norc.org/projects/40124/variables/vfilter). You will need the following variables for the analysis:

- An ordinal variable measuring belief in god. This variable can be taken directly from the `GOD` variable in the extract but I want you to collapse the categories somewhat for the analysis due to small numbers for some cases:
    - "Don't believe" and "No way to find out" should be collapsed into a single category of "Non-believer". 
    - "Some higher power" should be treated as a separate category of "Higher power".
    - "Believe sometimes" and "Believe, but doubts" should be collapsed into a category of "Believer".
    - "Know god exists" should be treated as a separate category of "Strong believer".
- a dichotomous variable indicating that a respondent has a current religious affiliation or not, drawn from the `RELIG` variable. 
- A dichotomous variable identical to the one above but drawn from the respondent's (retrospective) religious affiliation at age 16 which comes from the `RELIG16` variable.
- A variable for a respondent's age.
- A variable for respondent's sex. 
- You will also want to retain the weight variable named `WTSSALL`, the stratification identifier named `VSTRAT`, and the cluster identifier names `VPSU`. You will need to consider how to take account of the GSS survey design in your analysis. Some useful information (including example R code) can be found [here](https://gssdataexplorer.norc.org/pages/show?page=gss%2Fstandard_error).

## Step 2: Run the models

For all models you will need to consider how to handle issues such as missing values and sample design effects. 

### Independent variables and model setup

You should include the following independent variables in all models:

1. Controls for for sex of the respondent, whether the respondent was religiously affiliated at age 16, the age of the respondent, and a squared term for the age of the respondent to allow for non-linearity. Its probably also a good idea to re-center age.
1. The dummy variable indicating affiliation/non-affiliation. This is the core measure of "congruence."
2. Years of education. Because of the interaction below this tells us the effect of education on belief in god for the unaffiliated.  
3. An interaction between education and affiliation/non-affiliation. This interaction will tell us the degree to which congruence between religious identity and belief increases or decreases with the level of education. 

### Dependent variable

The dependent variable for the models is belief in god, but I want you to consider two different ways of modeling this variable. 

1. Use a cumulative logit/ordered logit model with parallel effects. The command `svyolr` in the `survey` library will allow you to run this model while accounting for design effects. Neither `texreg` nor `stargazer` can output this kind of model by default, but I have written you a function called `convert_olr_model` that you can run your models through to get them to output nicely. For example, `texreg(convert_olr_model(model1))` where `model1` is the model output from svyolr. 
2. Use a cumulative logit/ordered logit model with non-parallel effects in order to explore whether the assummption of parallel effects in (1) was justified. The functions in the `VGAM` library cannot account for survey design effects nor can they output results, so I would try "simulating" a cumulative logit model by estimating four different logistic regression models with different binary cutpoints using `svyglm`.  The `tegreg` package can output this kind of model by default.

## Step 3: write up your results

Write up a brief report outlining what you did and what you found, using the supplied R Markdown file. Be sure to discuss any discrepancies in the findings depending on how you modeled the ordinal outcome. How do the results vary depending on the choice to force parallel effects vs. non-parallel effects? How do the results vary depending on which cut-point you choose in the non-parallel models?
