bysort countrycode year: assert _N == 1 

egen countnum = group(countrycode)

xtset countnum year

gen gdpgrowth = (gdppw - L.gdppw)/l.gdppw

gen earlygdpdr = gdpgrowth if earlyyr==1

gen lategdpgr = gdpgrowth if earlyyr==0

bysort countrycode : egen earlyavegr = mean(earlygdpdr)

bysort countrycode : egen lateavegr = mean(lategdpgr)

scatter lateavegr earlyavegr, mlabel(countrycode)

graph twoway (lfit lateavegr earlyavegr) (scatter lateavegr earlyavegr)
