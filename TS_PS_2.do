use "/Users/economics/Desktop/TS_PS_2_Data.dta"

sort observation_date

set obs 235
gen date = tq(1959q1)+_n-1
list date in 1/5
format %tq date
list date in 1/5
tsset date
gen dgdp = GDPC1 - L.GDPC1

gen dpayems = PAYEMS - L.PAYEMS
gen dunempr = UNRATE - L.UNRATE
gen dcpi = CPIAUCSL - L.CPIAUCSL
gen dfedrate = FEDFUNDS - L.FEDFUNDS
gen dbondy = BAA10YM - L.BAA10YM
gen dipi = INDPRO - L.INDPRO
gen dexchrate = DEXJPUS - L.DEXJPUS

**do this for all vars w/trend
dfuller GDPC1, trend regress lags(4),
dfuller PAYEMS, trend regress lags(4),
**do this for all vars w/no trend
dfuller vars, regress lags(4),

**repeat for following:
dfuller dgdp, regress lags(4),
dfuller dpayems, regress lags(4),
dfuller dffr, regress lags(4),
dfuller dipi, regress lags(4),
