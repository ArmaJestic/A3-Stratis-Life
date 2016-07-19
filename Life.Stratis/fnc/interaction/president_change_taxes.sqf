// A_interaction_fnc_president_change_taxes

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


itemtax = _this select 0;
vehicletax = _this select 1;
magazinetax = _this select 2;
weapontax  = _this select 3;
bank_tax = _this select 4;	
publicVariable   "itemtax";
publicVariable   "vehicletax";
publicVariable   "magazinetax";
publicVariable   "weapontax";
publicVariable   "bank_tax";
// Redefinition of array uses fewer chars than using array set 
"economy_tax_data = [ [""Item"", ""Item"", itemtax], [""Vehicle"", ""Vehicle"",vehicletax], [""Magazine"",""Magazine"",vehicletax], [""Weapon"",""Weapon"",weapontax]];
hint ""The President has changed the tax rates!"";" call broadcast;
