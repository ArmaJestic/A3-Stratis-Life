// A_server_fnc_setup_vendors

#include "header.h"


if (!isServer) exitwith {};

//make a list of all the AI vendors/related objects, attach them to an anchor on the map
ai_vendors = [university, storage, townhall, bailflag, assassin, hostage, impoundbuy, civ_logicunit];

{
	private _shop = _x select INV_INDEX_SHOP_OBJECT;
	private _crate = _x select INV_INDEX_SHOP_CRATE;
	if DEFINED(_shop) then {
		[ai_vendors,_shop] call A_arr_fnc_pushUnique;
	};
	if DEFINED(_crate) then {
		[ai_vendors,_crate] call A_arr_fnc_pushUnique;
	};
} forEach A_inv_var_itemshops;

{
	private _ai = _x select 0;
	[ai_vendors,_ai] call A_arr_fnc_pushUnique;
	
	_ai = _x select 3;
	[ai_vendors,_ai] call A_arr_fnc_pushUnique;
	
	_ai = _x select 4;
	[ai_vendors,_ai] call A_arr_fnc_pushUnique;
} forEach all_factories;

[ai_vendors,A_missions_var_workplacejob_deliveryflagarray] call A_arr_fnc_pushUnique;
[ai_vendors,A_bank_var_bankflagarray] call A_arr_fnc_pushUnique;
[ai_vendors,A_bank_var_drugsellarray] call A_arr_fnc_pushUnique;
[ai_vendors,A_bank_var_shopflagarray] call A_arr_fnc_pushUnique;


{
	private _array = _x select LICENSE_INDEX_VENDORS;
	_array = _array apply {if ((typename _x)== "STRING") then {missionNamespace getVariable[_x,null]}else{_x}};
	[ai_vendors,_array] call A_arr_fnc_pushUnique;
} forEach A_license_var_licenses;

{
	private _heading = _x getVariable["heading",null];
	private _dir = getDir _x;
	
	_x attachTo[ai_vendors_attach_anchor];
	
	// direction is relative to the attached item, so cant use setdir
	if (_heading isEqualTo null) then {
		[_x,[_dir,0,0]] call A_object_fnc_set_heading;
	}else{
		[_x,_heading] call A_object_fnc_set_heading;
	};
} forEach ai_vendors;

{
	[_x] joinSilent (group server);
} forEach ai_vendors;