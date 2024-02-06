clear
cls
set more off
*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* Net oil exporting countries
*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* Importing Excel file
import excel "\\vspsrv1\home$\crojasqu\PersonalData\Downloads\DataSetX.xlsx", sheet("Sheet1") firstrow
replace MONTH = mofd(MONTH)
format MONTH %tm
* Making some replacements in some variables
replace FRR = 100*ln(FRR)
replace WTI = 100*ln(WTI)
* Setting the panel dataset
tsset NUM MONTH
* Generate LHS variables for the LPs
forvalues h = 0/18 {
	gen CDS5Y`h' = f`h'.CDS5Y 	 
}
* Estimation 1: baseline model (all countries)
eststo clear
cap drop b_ls u_ls d_ls
gen b_ls=0
gen u_ls=0
gen d_ls=0
quiet forvalues h = 0/18 {
	 xtreg CDS5Y`h' SHOCK l(1/12).CDS5Y l(1/12).SHOCK l(1/12).WTI l(1/12).VIX, fe vce(robust) 
replace b_ls = _b[SHOCK]                      if _n == `h'+1
replace u_ls = _b[SHOCK] + 1.645* _se[SHOCK]  if _n == `h'+1
replace d_ls = _b[SHOCK] - 1.645* _se[SHOCK]  if _n == `h'+1
eststo
}
* Estimation 2: Non-OPEC countries
eststo clear
cap drop b2_ls u2_ls d2_ls
gen b2_ls=0
gen u2_ls=0
gen d2_ls=0
quiet forvalues h = 0/18 {
	 xtreg CDS5Y`h' SHOCK l(1/12).CDS5Y l(1/12).SHOCK l(1/12).WTI l(1/12).VIX if OPEC==0, fe vce(robust) 
replace b2_ls = _b[SHOCK]                      if _n == `h'+1
replace u2_ls = _b[SHOCK] + 1.645* _se[SHOCK]  if _n == `h'+1
replace d2_ls = _b[SHOCK] - 1.645* _se[SHOCK]  if _n == `h'+1
eststo
}
* Estimation 3: Middle-income countries
eststo clear
cap drop b3_ls u3_ls d3_ls
gen b3_ls=0
gen u3_ls=0
gen d3_ls=0
quiet forvalues h = 0/18 {
	 xtreg CDS5Y`h' SHOCK l(1/12).CDS5Y l(1/12).SHOCK l(1/12).WTI l(1/12).VIX if MI==1, fe vce(robust) 
replace b3_ls = _b[SHOCK]                      if _n == `h'+1
replace u3_ls = _b[SHOCK] + 1.645* _se[SHOCK]  if _n == `h'+1
replace d3_ls = _b[SHOCK] - 1.645* _se[SHOCK]  if _n == `h'+1
eststo
}
* Estimation 4: LPIV (news supply shock)
eststo clear
cap drop b4_ls u4_ls d4_ls
gen b4_ls=0
gen u4_ls=0
gen d4_ls=0
quiet forvalues h = 0/18 {
	 xtivreg CDS5Y`h' l(1/12).CDS5Y l(1/12).SHOCK l(1/12).WTI l(1/12).VIX (WTI = SHOCK), fe vce(robust) 
replace b4_ls = _b[WTI]                    if _n == `h'+1
replace u4_ls = _b[WTI] + 1.645* _se[WTI]  if _n == `h'+1
replace d4_ls = _b[WTI] - 1.645* _se[WTI]  if _n == `h'+1
eststo
}
* Generate LHS variables for the LPs
forvalues h = 0/36 {
	gen FRR`h' = f`h'.FRR 	 
}
* Estimation 5: baseline model (all countries)
eststo clear
cap drop b5_ls u5_ls d5_ls
gen b5_ls=0
gen u5_ls=0
gen d5_ls=0
quiet forvalues h = 0/36 {
	 xtreg FRR`h' SHOCK l(1/12).FRR l(1/12).SHOCK l(1/12).WTI l(1/12).VIX, fe vce(robust) 
replace b5_ls = _b[SHOCK]                      if _n == `h'+1
replace u5_ls = _b[SHOCK] + 1.645* _se[SHOCK]  if _n == `h'+1
replace d5_ls = _b[SHOCK] - 1.645* _se[SHOCK]  if _n == `h'+1
eststo
}
* Estimation 6: Non-OPEC countries
eststo clear
cap drop b6_ls u6_ls d6_ls
gen b6_ls=0
gen u6_ls=0
gen d6_ls=0
quiet forvalues h = 0/36 {
	 xtreg FRR`h' SHOCK l(1/12).FRR l(1/12).SHOCK l(1/12).WTI l(1/12).VIX if OPEC==0, fe vce(robust) 
replace b2_ls = _b[SHOCK]                      if _n == `h'+1
replace u2_ls = _b[SHOCK] + 1.645* _se[SHOCK]  if _n == `h'+1
replace d2_ls = _b[SHOCK] - 1.645* _se[SHOCK]  if _n == `h'+1
eststo
}
* Estimation 7: Middle-income countries
eststo clear
cap drop b7_ls u7_ls d7_ls
gen b7_ls=0
gen u7_ls=0
gen d7_ls=0
quiet forvalues h = 0/36 {
	 xtreg FRR`h' SHOCK l(1/12).FRR l(1/12).SHOCK l(1/12).WTI l(1/12).VIX if MI==1, fe vce(robust) 
replace b7_ls = _b[SHOCK]                      if _n == `h'+1
replace u7_ls = _b[SHOCK] + 1.645* _se[SHOCK]  if _n == `h'+1
replace d7_ls = _b[SHOCK] - 1.645* _se[SHOCK]  if _n == `h'+1
eststo
}
* Estimation 8: LPIV (news supply shock)
eststo clear
cap drop b8_ls u8_ls d8_ls
gen b8_ls=0
gen u8_ls=0
gen d8_ls=0
quiet forvalues h = 0/36 {
	 xtivreg FRR`h' l(1/12).FRR l(1/12).SHOCK l(1/12).WTI l(1/12).VIX (WTI = SHOCK), fe vce(robust) 
replace b8_ls = _b[WTI]                    if _n == `h'+1
replace u8_ls = _b[WTI] + 1.645* _se[WTI]  if _n == `h'+1
replace d8_ls = _b[WTI] - 1.645* _se[WTI]  if _n == `h'+1
eststo
}
*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
export excel b_ls u_ls d_ls b2_ls u2_ls d2_ls b3_ls u3_ls d3_ls b4_ls u4_ls d4_ls b5_ls u5_ls d5_ls b6_ls u6_ls d6_ls b7_ls u7_ls d7_ls b8_ls u8_ls d8_ls  using "C:\Users\crojasqu\OneDrive - Istituto Universitario Europeo\PhD Thesis\Ch2\ResultsX_LEVEL.xlsx", firstrow(variables) replace
*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
clear
cls
*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* Net oil importing countries
*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* Importing Excel file
import excel "\\vspsrv1\home$\crojasqu\PersonalData\Downloads\DataSetM.xlsx", sheet("Sheet1") firstrow
replace MONTH = mofd(MONTH)
format MONTH %tm
* Making some replacements in some variables
replace FRR = 100*ln(FRR)
replace WTI = 100*ln(WTI)
* Setting the panel dataset
tsset NUM MONTH
* Generate LHS variables for the LPs
forvalues h = 0/18 {
	gen CDS5Y`h' = f`h'.CDS5Y 	 
}
* Estimation 1: baseline model (all countries)
eststo clear
cap drop b_ls u_ls d_ls
gen b_ls=0
gen u_ls=0
gen d_ls=0
quiet forvalues h = 0/18 {
	 xtreg CDS5Y`h' SHOCK l(1/12).CDS5Y l(1/12).SHOCK l(1/12).WTI l(1/12).VIX, fe vce(robust) 
replace b_ls = _b[SHOCK]                      if _n == `h'+1
replace u_ls = _b[SHOCK] + 1.645* _se[SHOCK]  if _n == `h'+1
replace d_ls = _b[SHOCK] - 1.645* _se[SHOCK]  if _n == `h'+1
eststo
}
* Estimation 3: Middle-income countries
eststo clear
cap drop b3_ls u3_ls d3_ls
gen b3_ls=0
gen u3_ls=0
gen d3_ls=0
quiet forvalues h = 0/18 {
	 xtreg CDS5Y`h' SHOCK l(1/12).CDS5Y l(1/12).SHOCK l(1/12).WTI l(1/12).VIX if MI==1, fe vce(robust) 
replace b3_ls = _b[SHOCK]                      if _n == `h'+1
replace u3_ls = _b[SHOCK] + 1.645* _se[SHOCK]  if _n == `h'+1
replace d3_ls = _b[SHOCK] - 1.645* _se[SHOCK]  if _n == `h'+1
eststo
}
* Estimation 4: LPIV (news supply shock)
eststo clear
cap drop b4_ls u4_ls d4_ls
gen b4_ls=0
gen u4_ls=0
gen d4_ls=0
quiet forvalues h = 0/18 {
	 xtivreg CDS5Y`h' l(1/12).CDS5Y l(1/12).SHOCK l(1/12).WTI l(1/12).VIX (WTI = SHOCK), fe vce(robust) 
replace b4_ls = _b[WTI]                    if _n == `h'+1
replace u4_ls = _b[WTI] + 1.645* _se[WTI]  if _n == `h'+1
replace d4_ls = _b[WTI] - 1.645* _se[WTI]  if _n == `h'+1
eststo
}
* Generate LHS variables for the LPs
forvalues h = 0/36 {
	gen FRR`h' = f`h'.FRR 	 
}
* Estimation 5: baseline model (all countries)
eststo clear
cap drop b5_ls u5_ls d5_ls
gen b5_ls=0
gen u5_ls=0
gen d5_ls=0
quiet forvalues h = 0/36 {
	 xtreg FRR`h' SHOCK l(1/12).FRR l(1/12).SHOCK l(1/12).WTI l(1/12).VIX, fe vce(robust) 
replace b5_ls = _b[SHOCK]                      if _n == `h'+1
replace u5_ls = _b[SHOCK] + 1.645* _se[SHOCK]  if _n == `h'+1
replace d5_ls = _b[SHOCK] - 1.645* _se[SHOCK]  if _n == `h'+1
eststo
}
* Estimation 7: Middle-income countries
eststo clear
cap drop b7_ls u7_ls d7_ls
gen b7_ls=0
gen u7_ls=0
gen d7_ls=0
quiet forvalues h = 0/36 {
	 xtreg FRR`h' SHOCK l(1/12).FRR l(1/12).SHOCK l(1/12).WTI l(1/12).VIX if MI==1, fe vce(robust) 
replace b7_ls = _b[SHOCK]                      if _n == `h'+1
replace u7_ls = _b[SHOCK] + 1.645* _se[SHOCK]  if _n == `h'+1
replace d7_ls = _b[SHOCK] - 1.645* _se[SHOCK]  if _n == `h'+1
eststo
}
* Estimation 8: LPIV (news supply shock)
eststo clear
cap drop b8_ls u8_ls d8_ls
gen b8_ls=0
gen u8_ls=0
gen d8_ls=0
quiet forvalues h = 0/36 {
	 xtivreg FRR`h' l(1/12).FRR l(1/12).SHOCK l(1/12).WTI l(1/12).VIX (WTI = SHOCK), fe vce(robust) 
replace b8_ls = _b[WTI]                    if _n == `h'+1
replace u8_ls = _b[WTI] + 1.645* _se[WTI]  if _n == `h'+1
replace d8_ls = _b[WTI] - 1.645* _se[WTI]  if _n == `h'+1
eststo
}
*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
export excel b_ls u_ls d_ls b3_ls u3_ls d3_ls b4_ls u4_ls d4_ls b5_ls u5_ls d5_ls b7_ls u7_ls d7_ls b8_ls u8_ls d8_ls using "C:\Users\crojasqu\OneDrive - Istituto Universitario Europeo\PhD Thesis\Ch2\ResultsM_LEVEL.xlsx", firstrow(variables) replace
*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------