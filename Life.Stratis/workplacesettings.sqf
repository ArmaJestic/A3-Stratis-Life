#include "Awesome\Functions\macro.h"

//==================================DELIVERY MISSION=========================================

workplacejob_deliverymsg         =

[

"STRS_workplacemission_deliverymsg_1",
"STRS_workplacemission_deliverymsg_2",
"STRS_workplacemission_deliverymsg_3",
"STRS_workplacemission_deliverymsg_4",
"STRS_workplacemission_deliverymsg_5",
"STRS_workplacemission_deliverymsg_6",
"STRS_workplacemission_deliverymsg_7"

];

deliveryjobmulti                 = 4;
workplacejob_courier_maxmoney    = 15000;
deliverymintime			 = 100;

workplacejob_deliveryflagarray   =

[

workplacejob_deliveryflag1,
workplacejob_deliveryflag2,
workplacejob_deliveryflag3,
workplacejob_deliveryflag4
];

workplacejob_deliverynamearray   =

[

"Delivery Point 1",
"Delivery Point 2",
"Delivery Point 3",
"Delivery Point 4",
"Delivery Point 5",
"Delivery Point 6",
"Delivery Point 7",
"Delivery Point 8",
"Delivery Point 9",
"Delivery Point 10"

];

//========================================TAXI MISSION============================================

workplacejob_taxi_zielarray	 =

[

getmarkerpos "taximarker1",
getmarkerpos "taximarker2",
getmarkerpos "taximarker3",
getmarkerpos "taximarker4",
getmarkerpos "taximarker5",
getmarkerpos "taximarker6",
getmarkerpos "taximarker7",
getmarkerpos "taximarker8",
getmarkerpos "taximarker9",
getmarkerpos "taximarker10"

];

workplacejob_taxi_sperrzeit	 = 0.01;
workplacejob_taxi_multiplikator  = 4;
workplacejob_taxi_maxmoney       = 35000;
taximaxdistance			 = 5200;
taximindistance			 = 3500;

//========================================ASSASSINATION============================================

workplacejob_assassin_break   = 10;
workplacejob_assassion_failed = false;