// A_mounted_fnc_add_actions

#include "../../includes/macro.h"
#include "../../includes/dikcodes.h"


//player groupChat format["A_mounted_fnc_add_actions %1", _this];
ARGV(0,_vehicle);
//player groupChat format["Adding actions!"];
if (undefined(_vehicle)) exitWith {null};

private["_class"];
_class =  typeOf _vehicle;

private["_entry"];
_entry = [_class] call A_mounted_fnc_lookup_class;
if (undefined(_entry)) exitWith {null};


private ["_has_mounted_actions"];
private["_actions_variable"];
_actions_variable = format["has_mounted_actions_%1", (getPlayerUID player)]; 

_has_mounted_actions = [_vehicle, _actions_variable] call A_object_fnc_getVariable;
if (undefined(_has_mounted_actions)) then { _has_mounted_actions = false;}; 
if (_has_mounted_actions) exitWith {null};

private["_display_name"];
_display_name =  getText (configFile >> "CfgVehicles" >> _class >> "displayName");
//player groupChat format["_display_name = %1", _display_name];

private["_slots"];

_slots = _entry select A_mounted_var_slots;

{
	private["_slot_id", "_slot_name", "_slot", "_requires_weapon"];
	_slot = _x;
	_slot_id = _slot select A_mounted_var_slot_id;
	_slot_name = _slot select A_mounted_var_slot_text;
	_requires_weapon = _slot select A_mounted_var_slot_requires_weapon;
	//player groupChat format["_slot_id = %1, _slot_name = %2", _slot_id, _slot_name];
	_vehicle addAction [format['<t color="#dddd00">Get in %1%2</t>', _display_name, _slot_name], "noscript.sqf", format['[_this select 1, _this select 0, "%1"] call A_mounted_fnc_board_slot;', _slot_id], 1, false, true,"", format['private["_show"]; _show = [_this, _target, "%1", %2] call A_mounted_fnc_show_action; _show', _slot_id, _requires_weapon]];
} foreach _slots;


_has_mounted_actions = true;
[_vehicle, _actions_variable, _has_mounted_actions] call A_object_fnc_setVariable;
