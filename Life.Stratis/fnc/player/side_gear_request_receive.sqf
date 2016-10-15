// A_player_fnc_side_gear_request_receive

#include "header.h"


params["_variable","_request"];

if (UNDEFINED(_request)) exitWith {};
if (typeName _request != "ARRAY") exitWith {};

_request params[["_player",objNull,[objNull]],["_gear",null]];

if (!([_player] call A_player_fnc_exists)) exitWith {};
if (UNDEFINED(_gear)) then {
	_gear = [_player] call A_player_fnc_get_gear;
	if (UNDEFINED(_gear)) exitWith {};
};

private _side = ([_player] call A_player_fnc_side);
_side = toLower(str(_side));

// separate
_gear params["_primary","_secondary","_handgun","_uniform","_vest","_backpack","_helmet","_goggles","_binocs","_assigned"];
{
	[_player, format["%1_arr_%2",(_x select 0), _side], (_x select 1)] call A_player_fnc_set_array;
} forEach [
	["primary",_primary],
	["secondary", _secondary],
	["handgun", _handgun],
	["uniform", _uniform],
	["vest", _vest],
	["backpack", _backpack],
	["binocs", _binocs],
	["assigned", _assigned]
];
{
	[_player, format["%1_str_%2",(_x select 0), _side], (_x select 1)] call A_player_fnc_set_string;
} forEach [
	["helmet", _helmet],
	["goggles", _goggles]
];