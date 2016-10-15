// A_retributions_fnc_remove_licenses

#include "header.h"


private["_dp"];
_dp = _this select 0;

private["_killer_side", "_roadkill", "_killer"];
_killer_side = _dp select INDEX_DP_KILLER_SIDE;
_roadkill = _dp select INDEX_DP_ROADKILL;
_killer = _dp select INDEX_DP_KILLER;

if (_killer_side == "Cop") exitWith {null};

if (_roadkill) then {
	format["[%1] call A_retributions_fnc_remove_vehicle_licenses;", _killer] call A_broadcast_fnc_broadcast;
}else{
	format["[%1] call A_retributions_fnc_remove_weapon_licenses;", _killer] call A_broadcast_fnc_broadcast;
};
