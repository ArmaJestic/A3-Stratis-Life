// A_inv_fnc_init_pre
// runs from A_init_fnc_pre

#include "header.h"


A_inv_var_farmitemarray = [
    [[["fishingwhale",400]],"Whale",2,1,["Ship"]],
    [[["fishingbass",400]],"bass",15,8,["Ship"]],
    [[["fishingtrout",200]],"trout",15,8,["Ship"]],
    [[["fishingwalleye",200]],"walleye",15,8,["Ship"]],
    [[["fishingperch",200]],"perch",15,8,["Ship"]],
    [[["cocafield",30]],"Unprocessed_cocaine",20,6,["Man"]],
    [[["marifield",30]],"Unprocessed_marijuana",20,6,["Man"]],
    [[["lsdfield",30]],"Unprocessed_lsd",20,6,["Man"]],
    [[["heroinfield",30]],"Unprocessed_heroin",20,6,["Man"]],
    [[["quarry1",150]],"sand",20,10,["truck"]],
    [[["quarry2",150]],"sand",20,10,["truck"]]
    //[[["quarry3",150]],"sand",20,10,["truck"]],
    //[[["farmarea1",70]],"getreide",20,10,["tractor"]],
    //[[["farmarea2",70]],"getreide",20,10,["tractor"]],
    //[[["farmarea3",70]],"getreide",20,10,["tractor"]]
];

A_inv_var_fishingarray = [
    [["bassarea",30], "bass",12],
    [["percharea",30], "perch",12],
    [["walleyearea",30], "walleye",12],
    [["troutarea",30], "trout",12]
];

A_inv_var_vehiclegaragen = [
	carpark1,
	carpark2,
	carpark3,
	carpark4
];

A_inv_var_inactive_vcl_maxtime = 30;

A_inv_var_shortcuts = true;

A_inv_var_vendors_array = [
	[pmclicenses, "PMC License Vendor"],
	[university, "Civilian License Vendor"],
	[storage, "Storage Agent"], 
	[bailflag, "Bail Clerk"],
	[impoundbuy, "Impond Lot Clerk"]
];

A_inv_var_vendors_list = [];