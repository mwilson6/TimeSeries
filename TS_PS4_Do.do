use "/Users/economics/Desktop/TS_PS_4_Stata_Data.dta"

set obs 729

list date in 1/5
format %tm date
list date in 1/5
tsset date

tsline ffr if tin(1960m1, 2017m9)
tsline spread if tin(1960m1, 2017m9)
tsline return if tin(1960m1, 2017m9)
tsline empg if tin(1960m1, 2017m9)
tsline ipg if tin(1960m1, 2017m9)
tsline inflation if tin(1960m1, 2017m9)

sum ffr return empg ipg inflation spread, detail

set matsize 729
var ffr spread return empg ipg inflation if tin(1960m1, 2017m9), lags(1/12)
varsoc

constraint define 1 [ffr]L1.return=0
constraint define 2 [ffr]L2.return=0
constraint define 3 [ffr]L1.empg=0
constraint define 4 [ffr]L2.empg=0
constraint define 5 [ffr]L1.ipg=0
constraint define 6 [ffr]L2.ipg=0
constraint define 7 [ffr]L1.inflation=0
constraint define 8 [ffr]L2.inflation=0
constraint define 9 [spread]L1.ffr=0
constraint define 10 [spread]L2.ffr=0
constraint define 11[spread]L1.ipg=0
constraint define 12 [spread]L2.ipg=0
constraint define 13 [spread]L1.inflation=0
constraint define 14 [spread]L2.inflation=0
constraint define 15 [return]L1.ffr=0
constraint define 16 [return]L2.ffr=0
constraint define 17 [return]L1.empg=0
constraint define 18 [return]L2.empg=0
constraint define 19 [return]L1.ipg=0
constraint define 20 [return]L2.ipg=0
constraint define 21 [return]L1.inflation=0
constraint define 22 [return]L2.inflation=0
constraint define 23 [empg]L1.return=0
constraint define 24 [empg]L2.return=0
constraint define 25 [empg]L1.ipg=0
constraint define 26 [empg]L2.ipg=0
constraint define 27 [empg]L1.inflation=0
constraint define 28 [empg]L2.inflation=0
constraint define 29 [ipg]L1.inflation=0
constraint define 30 [ipg]L2.inflation=0
constraint define 31 [inflation]L1.empg=0
constraint define 32 [inflation]L2.empg=0
constraint define 33 [inflation]L1.ipg=0
constraint define 34 [inflation]L2.ipg=0

var ffr spread return empg ipg inflation if tin(1960m1, 2017m9), lags(1/2)
estimates store m2

vargranger

var ffr spread return empg ipg inflation if tin(1960m1,2017m9), lags(1/2) constraint(1/34)
estimates store m1

lrtest m1 m2

fcast compute f_, step(12)

*clear 

*use "/Users/economics/Desktop/TS_PS_4_Data_part_d.dta"

*line empgforecast date
















