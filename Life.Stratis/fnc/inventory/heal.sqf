// A_inventory_fnc_heal

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private["_player"];
_player = _this;
if(not([_player] call A_player_fnc_exists)) exitWith {false};

private["_sleep"];
_sleep = 5;

if(_player == player) exitWith {
	//self healing
	format ["%1 switchmove ""AinvPknlMstpSlayWrflDnon_medic"";", player] call A_broadcast_fnc_broadcast;
	player groupChat format["%1-%2, wait %3 seconds until you are healed", _player, (name _player), _sleep];
	sleep _sleep;
	player setdamage 0;
	player groupChat format format["%1-%2, you are healed again", _player, (name _player)];
	true
};

format ["%1 switchmove ""AinvPknlMstpSlayWrflDnon_medic"";", _this] call A_broadcast_fnc_broadcast;
player groupChat "Healing civ...";
sleep _sleep;
_player setdamage 0;

true
