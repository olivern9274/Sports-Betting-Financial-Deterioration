clear
cd "C:\Users\ong92\Desktop\Research Folder"
use finaldata.dta

* CALLAWAY & SANT'ANNA ESTIMATOR
ssc install csdid, replace
ssc install drdid, replace


* For Clustering
encode state, gen(states_cd)

csdid cc_delinq, ivar(state_id) time(year) gvar(legal_year) cluster(states_cd) wboot reps(999) rseed(12345) agg(simple) 

csdid cc_delinq auto_delinq unemp ricapita mort_delinq auto_bal mort_bal lnrgdp pop ln(cc_bal), ivar(state_id) time(year) gvar(legal_year) cluster(states_cd) wboot reps(999) rseed(12345) agg(simple) 

csdid cc_delinq auto_delinq unemp ricapita mort_delinq auto_bal mort_bal lnrgdp pop, ivar(state_id) time(year) gvar(legal_year) cluster(states_cd) wboot reps(999) rseed(12345) agg(simple) 
//// GENERATES ATT (TABLE 5)
estat event 
//// STORES THE EVENT AGGREGATE VALUES FOR EVENT STUDY PLOT (TABLE 4)
csdid_plot, title("Event Study Plot") ytitle("Average Treatment Effect on Treated (ATT)") style(rarea) 
//// PLOTS THE VALUES FROM TABLE 4
graph export ccevent_study.pdf, replace

csdid auto_delinq, ivar(state_id) time(year) gvar(legal_year) cluster(states_cd) wboot reps(999) rseed(12345) agg(simple) 

csdid auto_delinq cc_delinq unemp ricapita mort_delinq auto_bal mort_bal lnrgdp pop, ivar(state_id) time(year) gvar(legal_year) cluster(states_cd) wboot reps(999) rseed(12345) agg(simple) 
//// GENERATES ATT (TABLE 5)
estat event 
//// DID NOT TURN INTO TABLE, BUT THE TRENDS STILL HOLD VISUALLY, AND THROUGH THE DATA
csdid_plot, title("Event Study Plot") ytitle("Average Treatment Effect on Treated (ATT)") style(rarea) 
//// PLOTS THE VALUES
graph export autoevent_study.pdf, replace

csdid unemp, ivar(state_id) time(year) gvar(legal_year) cluster(states_cd) wboot reps(999) rseed(12345) agg(simple) 

csdid unemp auto_delinq cc_delinq ricapita mort_delinq auto_bal mort_bal lnrgdp pop, ivar(state_id) time(year) gvar(legal_year) cluster(states_cd) wboot reps(999) rseed(12345) agg(simple) 
//// GENERATES ATT (TABLE 5)
estat event 
//// DID NOT TURN INTO TABLE, BUT THE TRENDS STILL HOLD VISUALLY, AND THROUGH THE DATA
csdid_plot, title("Event Study Plot") ytitle("Average Treatment Effect on Treated (ATT)") style(rarea) 
//// PLOTS THE VALUES
graph export unempevent_study.pdf, replace


* Testing for Multicollinearity
reg cc_delinq mort_delinq auto_delinq auto_bal mort_bal ricapita lnrgdp unemp pop 
//// Table 6 Values
vif

pwcorr cc_delinq mort_delinq auto_delinq auto_bal ricapita lnrgdp unemp pop, sig



