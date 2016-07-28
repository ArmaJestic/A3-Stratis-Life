// A_retributions_fnc_death_set_wanted

#include "..\..\includes\macro.h"


private["_dp", "_reason", "_bounty"];
_dp = _this select 0;
_reason = _this select 1;
_bounty = _this select 2;

private["_roadkill", "_killer_side", "_victim_side", "_victim_name", "_killer"];
_roadkill = _dp select A_retributions_var_dp_is_roadkill;
_killer_side = _dp select A_retributions_var_dp_killer_side;
_victim_side = _dp select A_retributions_var_dp_victim_side;
_victim_name = _dp select A_retributions_var_dp_victim_name;
_killer = _dp select A_retributions_var_dp_killer;

if (_killer_side == "Cop") exitWith {null};

private["_vehicle_str"];
_vehicle_str = if (_roadkill) then { ", vehicle" } else {""};

private["_wanted_str"];
_wanted_str = format["(%1, %2-%3%4)", _reason, _victim_side, _victim_name, _vehicle_str];
//player groupChat format["Setting %1 wanted for %2", _killer, _wanted_str];
[_killer, _wanted_str, _bounty] call A_player_fnc_update_warrants;
