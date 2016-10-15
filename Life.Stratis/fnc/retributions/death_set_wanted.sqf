// A_retributions_fnc_death_set_wanted

#include "header.h"


private _dp = _this select 0;
private _reason = _this select 1;
private _bounty = _this select 2;

private _roadkill = _dp select INDEX_DP_ROADKILL;
private _killer_side = _dp select INDEX_DP_KILLER_SIDE;
private _victim_side = _dp select INDEX_DP_VICTIM_SIDE;
private _victim_name = _dp select INDEX_DP_VICTIM_NAME;
private _killer = _dp select INDEX_DP_KILLER;

if (_killer_side == "Cop") exitWith {null};

private _vehicle_str = if (_roadkill) then {", vehicle"} else {""};

private _wanted_str = format["(%1, %2-%3%4)", _reason, _victim_side, _victim_name, _vehicle_str];

[_killer, _wanted_str, _bounty] call A_player_fnc_update_warrants;