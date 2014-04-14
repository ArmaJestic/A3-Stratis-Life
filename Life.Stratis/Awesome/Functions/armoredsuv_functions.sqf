#include "macro.h"

if (!(undefined(armoredsuv_functions))) exitWith {null};

armored_suv_close_minigun = {
	ARGV(0,_vehicle);
	_vehicle animate["HideGun_01",1];
	_vehicle animate["HideGun_02",1];
	_vehicle animate["HideGun_03",1];
	_vehicle animate["HideGun_04",1];
	_vehicle animate["CloseCover1",1];
	_vehicle animate["CloseCover2",1];
	[_vehicle, "minigun_open", false, true] call object_setVariable;
};

armored_suv_open_minigun = {
	ARGV(0,_vehicle);
	_vehicle animate["HideGun_01",0];
	_vehicle animate["HideGun_02",0];
	_vehicle animate["HideGun_03",0];
	_vehicle animate["HideGun_04",0];
	_vehicle animate["CloseCover1",0];
	_vehicle animate["CloseCover2",0];
	[_vehicle, "minigun_open", true, true] call object_setVariable;
};

armored_suv_is_minigun_open = {
	ARGV(0,_vehicle);
	_is_minigun_open = [_vehicle, "minigun_open"] call object_getVariable;
	if (undefined(_is_minigun_open)) exitWith { false };
	if (typeName _is_minigun_open != "BOOL") exitWith { false };
	_is_minigun_open
};

armored_suv_add_actions = {
	ARGV(0,_vehicle);
	
	private ["_has_suv_actions"];
	
	_has_suv_actions =  [_vehicle, "has_suv_actions"] call object_getVariable;
	if (undefined(_has_suv_actions)) then { _has_suv_actions = false;}; 
	if (_has_suv_actions) exitWith {null};
	
	player groupChat format["Adding SUV Actions"];
	_vehicle addaction ["Open Minigun","noscript.sqf",'[_this select 0] call armored_suv_open_minigun;',1,false,true,"","([player, _target] call vehicle_owner) && !([_target] call armored_suv_is_minigun_open)"];
	_vehicle addaction ["Close Minigun","noscript.sqf",'[_this select 0] call armored_suv_close_minigun;',1,false,true,"","([player, _target] call vehicle_owner) && ([_target] call armored_suv_is_minigun_open)"];
	
	_has_suv_actions = true;
	[_vehicle, "has_suv_actions", _has_suv_actions] call object_setVariable;
};

armoredsuv_functions = true;
