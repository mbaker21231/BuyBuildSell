/* Simulating buyers and sellers */
clear all
set obs 100000

scalar P = 1.5
scalar GC = 1
scalar DF = P - GC

gen pi = rnormal(1,1)
gen ei = rnormal(.2,1)
gen rs = pi - ei - GC
gen rb = pi - P

/* Those who wish to own */

gen maxrets = (rs > rb) * rs + (rb > rs) * rb

gen pot_owner = maxrets > 0
gen buyer     = rb > rs

twoway (scatter ei pi if pot_owner & buyer, msize(vtiny) mcolor(red) xline(`=P')) ///
       (scatter ei pi if pot_owner & buyer==0, yline(`=DF') msize(vtiny) mcolor(blue))

	   /* Blue is squatters, while Red ois buyers /*
