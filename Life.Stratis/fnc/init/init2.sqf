// A_init_fnc_init2

#include "..\..\includes\macro.h"

if (isServer) then {
	[0] call A_shop_menu_fnc_set_fuel_consumed; 
	onPlayerConnected { [_id, _name, _uid] call A_connection_fnc_player_connected_handler };
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

if(A_param_var_debug)then{A_main_var_drugstockinc = 6; A_main_var_druguserate = 20};


{
    private["_info"];
    _info = _x;
    if ((_info call A_inventory_fnc_get_item_droppable)) then {
        private["_class"];
        _class = _info call A_inventory_fnc_get_item_class;
        A_main_var_inv_droppableitems set [count(A_main_var_inv_droppableitems), _class];
    };
} foReach A_main_var_inv_allitemsarray;


{
	A_main_var_alllifemissionobjects pushBack _x;
} forEach A_main_var_inv_allweaponobjects;
{
    A_main_var_alllifemissionobjects pushBack _x;
} forEach A_main_var_inv_allmagazineobjects;
{
    A_main_var_alllifemissionobjects pushBack _x;
} forEach A_main_var_inv_allvehiclesarray;
{
    A_main_var_alllifemissionobjects pushBack _x;
} forEach A_main_var_backpackarray;
{
    A_main_var_alllifemissionobjects pushBack _x;
} forEach A_main_var_fortificationsarray;
{
    A_main_var_alllifemissionobjects pushBack _x;
} forEach A_main_var_inv_allitemsarray;


private["_array", "_Nname", "_name"];
_array = [];

_Nname = "A_MS_";
{
	_array = _x;
	_name = _array select 0;
	missionNamespace setVariable [format["%1%2", _Nname, _name], _array];
} forEach A_main_var_alllifemissionobjects;