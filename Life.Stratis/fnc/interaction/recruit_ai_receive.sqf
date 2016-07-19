// A_interaction_fnc_recruit_ai_receive

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


if (not(isServer)) exitWith {null};

player groupChat format["A_interaction_fnc_recruit_ai_receive %1", _this];

ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {null};

private["_class"];
_class = [([_player] call A_player_fnc_side)] call A_interaction_fnc_side_ai_class;

private["_unit"];
_unit = (group _player) createUnit [_class, position _player, [], 0, "FORM"];
[_unit] joinSilent (group _player);

private["_unit_name"];
_unit_name = format["%1_Troop_%2_%3", str(_player), (count (units (group _player))), round(time)];


//[[_unit,_unit_name], "A_interaction_fnc_ai_init_handler_persistent", true,  true] spawn BIS_fnc_MP;
[[_unit,_unit_name], "A_interaction_fnc_ai_init_handler_persistent", true, true, _unit] spawn A_jip_fnc_register;
waitUntil {not(isNil _unit_name)};

_unit = missionNamespace getVariable [_unit_name, null];
_backup = call compile (format["%1", _varName]);

private["_side_ai_weapons", "_side_ai_magazines"];

_side_ai_weapons = [([_player] call A_player_fnc_side)] call A_interaction_fnc_side_ai_weapons;
_side_ai_magazines = [([_player] call A_player_fnc_side)] call A_interaction_fnc_side_ai_magazines;

[_unit] call A_player_fnc_reset_gear;
{ _unit addWeapon _x } forEach _side_ai_weapons;
{ _unit addMagazine _x } forEach _side_ai_magazines;

reload _unit;
_unit addMPEventHandler ["MPKilled", { _this call A_player_fnc_handle_mpkilled }];
format['[%1, %2] call A_interaction_fnc_recruit_ai_complete;', _player, _unit] call broadcast;
