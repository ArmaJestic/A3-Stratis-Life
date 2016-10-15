// A_main_fnc_init
// majority of these inits will be moved to cfg entries (especially the masterarray)

#include "header.h"


if (isServer) then {
	[0] call A_shop_menu_fnc_set_fuel_consumed; 
}else{
	["stunned", false] call A_stats_fnc_init_variable;
	["arrested", false] call A_stats_fnc_init_variable;
	["deadtimes", 0] call A_stats_fnc_init_variable;
	["copskilled", 0] call A_stats_fnc_init_variable;
	["civskilled", 0] call A_stats_fnc_init_variable;
	["arrestsmade", 0] call A_stats_fnc_init_variable;
	["BuildingsOwnerArray", []] call A_stats_fnc_init_variable;
	
	if (isblu) then {
		RadioTextMsg_1 = "Put your fucking hands up!";
		RadioTextMsg_2 = "Pull over and stay in your vehicle!";
		RadioTextMsg_3 = "Drop your weapon and put your hands on your head!";
		RadioTextMsg_4 = "Your free to go, have a nice day";
	} else {
		RadioTextMsg_1 = "Put your fucking hands up now!";
		RadioTextMsg_2 = "Step away from the vehicle!";
		RadioTextMsg_3 = "Do it now or your dead!";
		RadioTextMsg_4 = "Dont shoot i give up!";
	};
	
	if(isciv) then {
		BuyAbleBuildingsArray = [
			["wp1", "Workplace 1", workplace_getjobflag_1, 100000, 500, "wp", "WpAblage_1"],
			["wp2", "Workplace 2", workplace_getjobflag_2, 200000, 1000, "wp", "WpAblage_2"],
			["wp3", "Workplace 3", workplace_getjobflag_3, 350000, 1500, "wp", "WpAblage_3"]
		];
	};
};