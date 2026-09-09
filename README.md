# Sports Betting & Financial Deterioration
This project aims to establish the causal relationship betwen the introduction of sports betting legalization and a deterioration in household financial outcomes.

# Overview
After the overturning of the Professional and Amateur Sports Protection Act (PASPA) in 2018, sports betting became legalized in 39 states. Coinciding with this new development has been the rise of online gambling. There being decreased friction in access to gambling services means that households have more of an opportunity to engage with potentially financially detrimental behavior. We study how the implementation of online sports betting has affected consumer’s financial health. We utilize household credit card delinquency rates as a proxy for the purposes of this paper as it measures an inability to pay off short term debt. Our data is primarily pulled from the New York Federal Reserve’s Consumer Credit Panel which collects data on a 5% sample of filings from Equifax. The main finding of our paper is that states that have legalized online sports betting saw a ~2% increase in credit card delinquencies compared to states that do not. This coincides with an increase in unemployment rates, and auto loan delinquencies as well. As consumers become more open to risk taking, they take on greater burdens on their finances. These results demonstrate that broad legalization of sports has harmed household financial health by reducing their ability to pay down debt.

# Data
## Source: 
[The New York Federal Reserve's Center for Microeconomic Data](https://www.newyorkfed.org/microeconomics/databank.html)
## Time Period:
2012-2024
## Sample Size:
559 observations across 43 states. 
## Key Variables:
**Financial Indicators:**
*cc_delinq* - the percentage of credit card debt 90+ days delinquent.

*auto_delinq* - the percentage of auto loan debt 90+ days delinquent.

*mort_delinq* - the percentage of mortgage debt 90+ days delinquent.

*stud_delinq* - the percentage of student loan debt 90+ days delinquent.

*cc_bal* - the total balance of credit card debt.

*auto_bal* - the total balance of auto loan debt.

*mort_bal* - the total balance of mortgage debt.

*stud_bal* - the total balance of student loan debt.

**Economic Indicators:**
*rgdp*
*pop*
*unemp*
*ricapita*
*labor_force*
