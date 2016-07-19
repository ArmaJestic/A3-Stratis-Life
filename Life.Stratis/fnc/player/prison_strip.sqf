// A_player_fnc_prison_strip

#include "../../includes/macro.h"


ARGV(0,_player);

if (undefined(_player)) exitWith {null};
if (_player != player) exitWith {null};
if (not([_player] call A_player_fnc_human)) exitWith {null};

//remove stolen cash, and illlal items
[_player] call A_inventory_fnc_remove_illegal;
if (stolencash > 0) then {
	[_player, stolencash] call A_money_fnc_lose_money;
	private["_message"];
	_message = format["%1-%2 was a bank robber, and has been charged $%3!", _player, (name _player), stolencash];
	format['server globalChat toString(%1);', toArray(_message)] call broadcast;
};
stolencash = 0;
