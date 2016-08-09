// A_retributions_fnc_remove_licenses

#include "..\..\includes\macro.h"


private["_dp"];
_dp = _this select 0;

private["_killer_side", "_roadkill", "_killer"];
_killer_side = _dp select A_retributions_var_dp_killer_side;
_roadkill = _dp select A_retributions_var_dp_is_roadkill;
_killer = _dp select A_retributions_var_dp_killer;

if (_killer_side == "Cop") exitWith {null};

if (_roadkill) then {
	format["[%1] call A_retributions_fnc_remove_vehicle_licenses;", _killer] call A_broadcast_fnc_broadcast;
}else{
	format["[%1] call A_retributions_fnc_remove_weapon_licenses;", _killer] call A_broadcast_fnc_broadcast;
};
