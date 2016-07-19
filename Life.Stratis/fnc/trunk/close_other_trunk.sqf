// A_trunk_fnc_close_other_trunk

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_vehicle);

//sleep some time on purpose to give enough time for variable to propagate
sleep 1;

if (undefined(_player)) exitWith {null};
if (undefined(_vehicle)) exitWith {null};
if (_player == player) exitWith {null};

_cvehicle = [player, "vehicle_trunk_used"] call A_object_fnc_getVariable;
if (undefined(_cvehicle)) exitWith {null};

if (format["%1", _vehicle]  == format["%1", _cvehicle]) then {
	closeDialog 0;
	call A_trunk_fnc_close;
};
