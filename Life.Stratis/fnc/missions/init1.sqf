// A_missions_fnc_init1

#include "..\..\includes\macro.h"


A_missions_var_workplacejob_deliverymsg = [
	"STRS_workplacemission_deliverymsg_1",
	"STRS_workplacemission_deliverymsg_2",
	"STRS_workplacemission_deliverymsg_3",
	"STRS_workplacemission_deliverymsg_4",
	"STRS_workplacemission_deliverymsg_5",
	"STRS_workplacemission_deliverymsg_6",
	"STRS_workplacemission_deliverymsg_7"
];

A_missions_var_deliveryjobmulti = 4;
A_missions_var_workplacejob_courier_maxmoney = 15000;
A_missions_var_deliverymintime = 100;

A_missions_var_workplacejob_deliveryflagarray = [
	workplacejob_deliveryflag1,
	workplacejob_deliveryflag2,
	workplacejob_deliveryflag3,
	workplacejob_deliveryflag4
];

A_missions_var_workplacejob_deliverynamearray = [
	"A_missions_fnc_delivery Point 1",
	"A_missions_fnc_delivery Point 2",
	"A_missions_fnc_delivery Point 3",
	"A_missions_fnc_delivery Point 4",
	"A_missions_fnc_delivery Point 5",
	"A_missions_fnc_delivery Point 6",
	"A_missions_fnc_delivery Point 7",
	"A_missions_fnc_delivery Point 8",
	"A_missions_fnc_delivery Point 9",
	"A_missions_fnc_delivery Point 10"
];

A_missions_var_workplacejob_taxi_zielarray = [
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

A_missions_var_workplacejob_taxi_sperrzeit = 0.01;
A_missions_var_workplacejob_taxi_multiplikator = 4;
A_missions_var_workplacejob_taxi_maxmoney = 35000;

A_missions_var_taximaxdistance = 5200;
A_missions_var_taximindistance = 3500;

A_missions_var_workplacejob_assassin_break = 10;
A_missions_var_workplacejob_assassion_failed = false;
