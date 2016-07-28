// A_player_fnc_rob_station

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_station);

if (undefined(_player)) exitWith {null};
if (undefined(_station)) exitWith {null};
if (typeName _station != "SCALAR") exitWith {null};

if (not([_player] call A_player_fnc_armed)) exitwith {
	player groupchat "You need a gun to rob the station!";
};

private["_money_variable_name", "_money_variable"];
_money_variable_name = format["station%1money", _station];
_money_variable = missionNamespace getVariable _money_variable_name;

[_player, "Robbed a gas station", A_main_var_wantedamountforrobbing] call A_player_fnc_update_warrants;
format ['server globalChat "Someone robbed gas station %1!";', _station] call A_broadcast_fnc_broadcast;

[_player, 'money', _money_variable] call A_inventory_fnc_add_item;
player sidechat format ["You stole $%1 from the gas station!", _money_variable];

_money_variable = 0;
missionNamespace setVariable [_money_variable_name, _money_variable];
publicVariable _money_variable_name;
