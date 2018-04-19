use "/Users/economics/Downloads/HW_1_Q2_2010.dta"

merge 1:1 country using "BL2013_MF1599_v2.0_2010_y.o.s.dta"

import excel "/Users/economics/Documents/HW_1_Q2_2010_partb.xls", sheet("Sheet1") firstrow

gen TFP = (cgdpo/(emp*hcap))*(cgdpo/ck)^0.5

gen TFPnorm = TFP/13336.23

gen cgdpopw = cgdpo/emp

gen cgdpopwnorm = cgdpopw/108056.6

scatter TFPnorm cgdpopwnorm, mlabel(countrycode)


gen F_i = cgdpopwnorm/TFPnorm

gen lA_i = log(TFPnorm)

gen lF_i = log(F_i)

gen ly_i = log(cgdpopwnorm)

sum ly_i
corr lA_i lF_i, cov
