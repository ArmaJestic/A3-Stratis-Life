#include "macro.h"
if (not(undefined(server_functions_defined))) exitWith {null};

server_get_array = {
	//player groupChat format["server_get_array %1", _this];
	ARGV(0,_variable_name);
	
	if (undefined(_variable_name)) exitWith {[]};

	private["_variable_value"];
	_variable_value = server getVariable _variable_name;
	_variable_value = if (undefined(_variable_value)) then { [] } else { _variable_value };
	_variable_value = if (typeName _variable_value != "ARRAY") then { [] } else {_variable_value };
	_variable_value
};

server_set_array = {
	//player groupChat format["server_set_array %1", _this];
	diag_log format['server_set_array: %1', _this];
	
	ARGV(0,_variable_name);
	ARGV(1,_variable_value);
	
	diag_log format['server_set_array: calling server_set_array_checked'];
	
	[_variable_name, _variable_value, true] call server_set_array_checked;
	
	diag_log format['server_set_array: complete'];
};

server_set_array_checked = {
	//player groupChat format["server_set_array_checked %1", _this];
	diag_log format['server_set_array_checked: %1', _this];
	
	ARGV(0,_variable_name);
	ARGV(1,_variable_value);
	ARGV(2,_check_change);
	
	diag_log format['server_set_array_checked: exit checks'];
	
	if (undefined(_variable_name)) exitWith {diag_log format['server_set_array_checked: exit1']; null};
    if (undefined(_variable_value)) exitWith {diag_log format['server_set_array_checked: exit2']; null};
	if (undefined(_check_change)) exitWith {diag_log format['server_set_array_checked: exit3']; null};
	
	if (typeName _variable_name != "STRING") exitWith {diag_log format['server_set_array_checked: exit4']; null};
	if (typeName _variable_value != "ARRAY") exitWith {diag_log format['server_set_array_checked: exit5']; null};
	if (typeName _check_change != "BOOL") exitWith {diag_log format['server_set_array_checked: exit6']; null};
	
	diag_log format['server_set_array_checked: exits passed'];
	
	private["_current_value"];
	
	if (_check_change) then {
		_current_value = [_variable_name] call server_get_array;	
		if (str(_current_value) == str(_variable_value)) exitWith {null};
	};
	
	server setVariable [_variable_name, _variable_value, true];
	
	diag_log format['server_set_array_checked: calling stats_server_save'];
	[_variable_name, _variable_value] call stats_server_save;
	
	diag_log format['server_set_array_checked: complete'];
};


server_setup_vendors = {
	if (not(isServer)) exitWith {null};
	//make a list of all the AI vendors, and attach them to an anchor on the map
	ai_vendors = [university, storage, rathaus, bailflag, assassin, hostage, impoundbuy, civ_logicunit];

	{
		private["_shop", "_crate"];
		_shop = _x select INV_ItemShops_Object;
		_crate = _x select INV_ItemShops_Crate;
		if (not(undefined(_shop))) then {
			ai_vendors set [count ai_vendors, _shop];
		};
		
		if (not(undefined(_crate))) then {
			ai_vendors set [count ai_vendors, _crate];
		};
	} forEach INV_ItemShops;


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
	} forEach workplacejob_deliveryflagarray;

	
	
	{
		private["_ai"];
		_ai = _x;
		ai_vendors set [count ai_vendors, _ai];
	} forEach bankflagarray;
	
	
		
	{
		private["_ai"];
		_ai = _x;
		ai_vendors set [count ai_vendors, _ai];
	} forEach drugsellarray;
		
	{
		private["_ai"];
		_ai = _x;
		ai_vendors set [count ai_vendors, _ai];
	} forEach shopflagarray;
		
	{
		private["_array"];
		_array = _x select 1;
		{
			ai_vendors set [count ai_vendors, _x];
		} forEach _array;
	} forEach INV_Licenses;
		
	{
		private["_dir"];
		_dir = getDir _x;
		_x attachTo [ai_vendors_attach_anchor];
		_x setDir _dir;
	} forEach ai_vendors;
		
	{
		[_x] joinSilent (group server);
	} forEach ai_vendors;

};



server_delete_group = {
	if (not(isServer)) exitWith {null};
	
	private["_group"];
	if (undefined(_group)) exitWith {null};
	
	//join a ranmdom unit into the group, and then make it leave 
	//(not sure why this is needed, in order to be able to delete the groups)
	[civ_logicunit] joinSilent _group;
	[civ_logicunit] joinSilent (group server);
	deleteGroup _group;
};

server_loop = {
	private["_server_loop_i", "_sleep"];
	_sleep = 10;
	_server_loop_i = 0;
	while {_server_loop_i < 5000} do {
		//check the AI vendors, and make sur ethey are in the server group
		{
			if ((group _x) != (group server)) then {
				[_x] joinSilent (group server);
			};
		} forEach ai_vendors;
			
		private["_groups"];
		_groups = allGroups;

		//look out for empty groups
		{
			private["_group", "_units", "_count"];
			_group = _x;
			_units = units _group;
			_count = count _units;
			if (_count <= 0) then {[_group] call server_delete_group;};	
		} forEach _groups;
		
		_server_loop_i = _server_loop_i + 1;
		sleep _sleep;
	};
	
	[] spawn server_loop;
};


//[] call server_setup_vendors;
//[] spawn server_loop;

//player groupChat format["server functions defined"];
server_functions_defined =  true;