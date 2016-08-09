// A_towing_fnc_line_item_use

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_item);
ARGV(2,_amount);

if (!([_player] call A_player_fnc_exists)) exitWith {};
if (undefined(_item)) exitWith {};
if (undefined(_amount)) exitWith {};
if (typeName _item != "STRING") exitWith {};
if (typeName _amount != "SCALAR") exitWith {};

if (_amount == 0) exitWith {};

if (_amount >  1) exitWith {
	player groupChat format["%1-%2, you cannot use multiple towing lines", _player, (name _player)];
};

[_player, _item, -1] call A_inventory_fnc_add_item;

//cleanup the previous towing line 
private["_towing_line"];
_towing_line = _player getVariable ["towing_line", null];
if (!(undefined(_towing_line))) then {
	[_towing_line] call A_towing_fnc_line_clear_endpoints;
};

//create a new towing line
[_player] call A_towing_fnc_line_create;
player groupChat format["%1-%2, the towing line is now active. You can attach it to vehicles", _player, (name _player)];
