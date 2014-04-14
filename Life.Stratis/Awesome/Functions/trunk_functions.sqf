#include "macro.h"
if (!(undefined(trunk_functions))) exitWith {null};

trunk_get_uuid = {
	_name = (name player);
	_uid = (getPlayerUID player);
	_result = format["%1_%2", _name, _uid];
	_result
};

trunk_close = {
	
	_vehicle = [player, "vehicle_trunk_used"] call object_getVariable;
	if (undefined(_vehicle)) exitWith {null};
	
	//player groupchat format["Closing trunk for %1", _vehicle];
	_vehicle = [player, "vehicle_trunk_used"] call object_getVariable;
	[_vehicle, "trunk_user_uuid", "0", true] call object_setVariable;
	[_vehicle, "trunk_user_name", "Unknown", true] call object_setVariable;
	[player, "vehicle_trunk_used", null] call object_setVariable; 
};

trunk_open = {

	call trunk_close;
	
	ARGV(0,_vehicle);
	[_vehicle, "trunk_user_uuid", (call trunk_get_uuid), true] call object_setVariable;
	[_vehicle, "trunk_user_name", (name player), true] call object_setVariable;
	[player, "vehicle_trunk_used", _vehicle] call object_setVariable; 
	
	//player groupchat format["Opening trunk for %1", _vehicle];
	
	//for redundancy, close the on all other player vehicles
	format['[%1, %2] spawn close_other_trunk;', player, _vehicle] call broadcast;
};

close_other_trunk = {
	ARGV(0,_player);
	ARGV(1,_vehicle);
	
	//sleep some time on purpose to give enough time for variable to propagate
	sleep 1;
	
	if (undefined(_player)) exitWith {null};
	if (undefined(_vehicle)) exitWith {null};
	if (_player == player) exitWith {null};
	
	_cvehicle = [player, "vehicle_trunk_used"] call object_getVariable;
	if (undefined(_cvehicle)) exitWith {null};
	
	if (format["%1", _vehicle]  == format["%1", _cvehicle]) then {
		closeDialog 0;
		call trunk_close;
	};
};


trunk_in_use = {
	ARGV(0,_vehicle);
	
	private["_uuid", "_cuuid"];
	_uuid = call trunk_get_uuid;
	_cuuid = [_vehicle, "trunk_user_uuid"] call object_getVariable;
	
	if (undefined(_cuuid)) exitWith { /* player groupChat format["_cuuid is nil"]; */ false };
	if (typeName _cuuid != "STRING") exitWith { /* player groupChat format["_cuuid not STRIING"]; */ false };
	if (_cuuid == "0") exitWith { /* player groupChat format["_cuuid = %1", _cuuid]; */ false };
	
	/* player groupchat format["_cuuid = %1", _cuuid]; */
	
	_in_use = (_cuuid != _uuid);
	_in_use
};

trunk_user =  {
	ARGV(0,_vehicle);
	
	private["_cname"];
	_cname = [_vehicle, "trunk_user_name"] call object_getVariable;
	
	if (undefined(_cname)) exitWith { "Unknown-A" };
	if (typeName _cname != "STRING") exitWith { "Unknown-B" };
	_cname
};


trunk_functions = true;
