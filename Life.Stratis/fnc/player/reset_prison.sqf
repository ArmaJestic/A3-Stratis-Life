// A_player_fnc_reset_prison

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {null};

if (([_player, "restrained"] call A_player_fnc_get_bool) && not(isblu)) then {
	private["_message"];
	_message = format["%1-%2 aborted while restrained, he has been sent to prison", _player, (name _player)];
	format['server globalChat toString(%1);', toArray(_message)] call broadcast;
	
	[_player, 15] call A_player_fnc_prison_time;
	[_player, 100] call A_player_fnc_prison_bail;
	[_player] call A_player_fnc_prison_convict;
}
else { if (([_player] call A_player_fnc_get_arrest) && not(isblu))then {
	private["_message"];
	_message = format["%1-%2 has been sent to prison to complete his previous sentence", _player, (name _player)];
	format['server globalChat toString(%1);', toArray(_message)] call broadcast;
	[_player] call A_player_fnc_prison_convict;
}
else {if ([_player, "roeprison"] call A_player_fnc_get_bool) then {
	[_player] call A_player_fnc_prison_roe;
};};};
