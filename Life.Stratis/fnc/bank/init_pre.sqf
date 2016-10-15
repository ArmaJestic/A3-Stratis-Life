// A_bank_fnc_init_pre
// alot of thse need to be moved to defines

#include "header.h"


A_bank_var_local_usebankpossible = true;

A_bank_var_rblock = 0;
A_bank_var_stolencash = 0;

A_bank_var_robable = true;

A_bank_var_shopflagarray = [shop1,shop2,shop3,shop4];
A_bank_var_bankflagarray = [mainbank,atm1,atm2,atm3,atm4,atmpf,pmcatm,insatm,opfatm_floating,cp1atm,cp2atm,blue4atm];
A_bank_var_carshoparray = [carshop1,carshop2,carshop3];
A_bank_var_drugsellarray = [mdrugsell,cdrugsell,ldrugsell,hdrugsell];

diag_log format['issue checking, fuelshop1: %1(%2),%3', fuelshop1,isNull fuelshop1,getPosATL fuelshop1];
private _issue = ((getPosATL fuelshop1) nearestObject "Land_FuelStation_Feed_F");

A_bank_var_gasstationarray = [
	fuelshop1,
	_issue
];