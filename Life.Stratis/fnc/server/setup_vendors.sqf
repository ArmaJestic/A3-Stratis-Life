// A_server_fnc_setup_vendors

#include "..\..\includes\macro.h"


if (not(isServer)) exitWith {null};
//make a list of all the AI vendors, and attach them to an anchor on the map
ai_vendors = [university, storage, rathaus, bailflag, assassin, A_missions_fnc_hostage, impoundbuy, civ_logicunit];

{
	private["_shop", "_crate"];
	_shop = _x select A_inv_var_itemshops_object;
	_crate = _x select A_inv_var_itemshops_crate;
	if (not(undefined(_shop))) then {
		ai_vendors set [count ai_vendors, _shop];
	};
	
	if (not(undefined(_crate))) then {
		ai_vendors set [count ai_vendors, _crate];
	};
} forEach A_inv_var_itemshops;


{
	private["_ai"];
	_ai = _x select 0;
	ai_vendors set [count ai_vendors, _ai];
	_ai = _x select 3;
	ai_vendors set [count ai_vendors, _ai];
	_ai = _x select 4;
	ai_vendors set [count ai_vendors, _ai];
} forEach all_factories;

{
	private["_ai"];
	_ai = _x;
	ai_vendors set [count ai_vendors, _ai];
} forEach A_missions_var_workplacejob_deliveryflagarray;



{
	private["_ai"];
	_ai = _x;
	ai_vendors set [count ai_vendors, _ai];
} forEach A_bank_var_bankflagarray;


	
{
	private["_ai"];
	_ai = _x;
	ai_vendors set [count ai_vendors, _ai];
} forEach A_bank_var_drugsellarray;
	
{
	private["_ai"];
	_ai = _x;
	ai_vendors set [count ai_vendors, _ai];
} forEach A_bank_var_shopflagarray;
	
{
	private["_array"];
	_array = _x select 1;
	{
		ai_vendors set [count ai_vendors, _x];
	} forEach _array;
} forEach A_license_var_INV_Licenses;
	
{
	private["_dir"];
	_dir = getDir _x;
	_x attachTo [ai_vendors_attach_anchor];
	_x setDir _dir;
} forEach ai_vendors;
	
{
	[_x] joinSilent (group server);
} forEach ai_vendors;
