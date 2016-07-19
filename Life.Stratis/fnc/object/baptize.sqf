// A_object_fnc_baptize

#include "..\..\includes\macro.h"


private["_object", "_persistent"];
_object = _this select 0;
if (isNil "_object" || {typeName _object != "OBJECT" || { isNull _object}}) exitWith {};

private["_player"];
_player =  player;

_persistent = false;
if ((count _this) > 1) then {
	_persistent = _this select 1;
};

private["_item"];
_item =  _object getVariable ["item", ""];
if (_item != "") exitWith {};

private["_class"];
_class = typeOf _object;
private["_info"];
_infos = ITEM_DATA(_class);
if (count(_infos) == 0) exitWith {};

player grouPChat format["Baptizing %1", _object];
private["_object_name"];
_object_name = format["%1_%2_%3_%4", _class, (getPlayerUID _player), round(time), round(random(time))];

if (_persistent) then {
	[[_object, _object_name], "A_object_fnc_name_init_handler", true, true, _object] call A_jip_fnc_register;
	waitUntil {not(isNil _object_name)};
}
else {
	[_object, _object_name] call A_object_fnc_name_init_handler;
};

[_object, _class, 1] call A_object_fnc_item_set_data;
