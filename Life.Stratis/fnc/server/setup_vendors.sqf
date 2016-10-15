// A_server_fnc_setup_vendors

#include "header.h"


if (!isServer) exitwith {};

//make a list of all the AI vendors, and attach them to an anchor on the map
diag_log format['setting up ai_vendors'];

ai_vendors = [university, storage, rathaus, bailflag, assassin, hostage, impoundbuy, civ_logicunit];

diag_log format['ai_vendors base: %1', ai_vendors];
diag_log format['looping A_inv_var_itemshops'];
{
	diag_log format['(%1)%2', _forEachIndex, _x];
	private _shop = _x select INV_INDEX_SHOP_OBJECT;
	private _crate = _x select INV_INDEX_SHOP_CRATE;
	if DEFINED(_shop) then {
		ai_vendors pushBack _shop;
		diag_log format['	pushed _shop'];
	};
	if DEFINED(_crate) then {
		ai_vendors pushBack _crate;
		diag_log format['	pushed _crate'];
	};
} forEach A_inv_var_itemshops;

diag_log format['looping all_factories'];
{
	diag_log format['(%1)%2', _forEachIndex, _x];
	private _ai = _x select 0;
	ai_vendors pushBack _ai;
	
	_ai = _x select 3;
	ai_vendors pushBack _ai;
	
	_ai = _x select 4;
	ai_vendors pushBack _ai;
} forEach all_factories;

diag_log format['append A_missions_var_workplacejob_deliveryflagarray: %1', A_missions_var_workplacejob_deliveryflagarray];
ai_vendors append A_missions_var_workplacejob_deliveryflagarray;

diag_log format['append A_bank_var_bankflagarray: %1', A_bank_var_bankflagarray];
ai_vendors append A_bank_var_bankflagarray;

diag_log format['append A_bank_var_drugsellarray: %1', A_bank_var_drugsellarray];
ai_vendors append A_bank_var_drugsellarray;

diag_log format['append A_bank_var_shopflagarray: %1', A_bank_var_shopflagarray];
ai_vendors append A_bank_var_shopflagarray;


diag_log format['looping A_license_var_licenses'];
{
	diag_log format['(%1)%2', _forEachIndex, _x];
	private _array = _x select LICENSE_INDEX_VENDORS;
	_array = _array apply {if ((typename _x)== "STRING") then {missionNamespace getVariable[_x,null]}else{_x}};
	ai_vendors append _array;
} forEach A_license_var_licenses;


diag_log format['looping ai_vendors'];
{
	diag_log format['(%1)%2-%3',_forEachIndex,_x,typename _x];
	private _dir = getDir _x;
	_x attachTo[ai_vendors_attach_anchor];
	_x setDir _dir;
} forEach ai_vendors;

diag_log format['adding array to server group'];	
{
	[_x] joinSilent (group server);
} forEach ai_vendors;