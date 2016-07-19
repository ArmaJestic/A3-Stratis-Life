// A_interaction_fnc_toggle_restrains

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_victim);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (not([_victim] call A_player_fnc_human)) exitWith {null};
if (not(alive _victim)) exitWith {null};

private["_inVehicle", "_victim_name"];
_inVehicle = (vehicle _victim != _victim);
_victim_name = (name _victim);

if (_inVehicle) exitWith {
	player groupChat format["%1-%2 is in a vehicle!", _victim, _victim_name];
};

private["_message"];
if ([_victim, "restrained"] call A_player_fnc_get_bool) then {
	[_victim, "restrained", false] call A_player_fnc_set_bool;
	_message = format["%1-%2 was unrestrained by %3", _victim, _victim_name, (name _player)];
	format['server globalChat toString(%1);', toArray(_message)] call broadcast;
}
else {
	if (not([_victim] call A_player_fnc_vulnerable)) exitWith {
		player groupChat format["%1-%2 cannot be restrained, he is not subdued.", _victim, _victim_name];
	};
	
	[_victim, "restrained", true] call A_player_fnc_set_bool;
	_message = format["%1-%2 was restrained by %3", _victim, _victim_name, (name _player)];
	format['server globalChat toString(%1);', toArray(_message)] call broadcast;
};
