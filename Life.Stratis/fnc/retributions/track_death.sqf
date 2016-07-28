// A_retributions_fnc_track_death

#include "..\..\includes\macro.h"


private["_dp"];
_dp = _this select 0;

private["_victim", "_killer", "_suidice", "_victim_criminal", "_victim_armed", "_victim_side", "_killer_side", "_teamkill", "_enemies"];
_victim = player;
_killer = _dp select A_retributions_var_dp_killer;
_suicide = _dp select A_retributions_var_dp_is_suicide;
_victim_criminal = _dp select A_retributions_var_dp_is_victim_criminal;
_victim_armed = _dp select A_retributions_var_dp_is_victim_armed;
_victim_side = _dp select A_retributions_var_dp_victim_side;
_killer_side = _dp select A_retributions_var_dp_killer_side;

_teamkill = _dp select A_retributions_var_dp_is_teamkill;
_enemies = _dp select A_retributions_var_dp_enemies;

[_dp] call A_retributions_fnc_update_killer_stats;

private["_bounty"];
_bounty = 30000;

suicided = _suicide;
if (_suicide) exitWith { 
	//no punishment here for suicide
};

if (_killer_side == "Cop") then {
	[_victim] call A_player_fnc_reset_warrants;
};

private["_armed_str"];
_armed_str = if (_victim_armed) then { ", armed" } else {", unarmed"};

private["_criminal_str"];
_criminal_str = if (_victim_criminal) then { ", criminal" } else {", innocent"};

private["_qualifier"];
_qualifier = format["%1%2", _armed_str, _criminal_str];


if ((_victim_side == "Civilian") and not(_victim_armed or _victim_criminal)) exitWith {
	[_dp] call A_retributions_fnc_time_penalty;
	[_dp] call A_retributions_fnc_remove_licenses;
	[_dp, format["aggravated-crime%1", _qualifier], _bounty] call A_retributions_fnc_death_set_wanted; 
};

if (_teamkill) exitWith {
	[_dp] call A_retributions_fnc_tk_penalty;
	[_dp] call A_retributions_fnc_time_penalty;
	[_dp] call A_retributions_fnc_remove_licenses;
};

if (_victim_criminal and (_killer_side == "Cop")) then {
	[_dp] call A_retributions_fnc_collect_criminal_reward;
};


if (_enemies) then {
	[_dp] call A_retributions_fnc_collect_faction_reward;
}
else { if (_killer_side == "Civilian" and _victim_side == "Civilian" and not(_victim_criminal) && _victim_armed) then {
	[_dp] call A_retributions_fnc_time_penalty;
	[_dp] call A_retributions_fnc_remove_licenses;
	[_dp, format["homicide%1", _qualifier], _bounty] call A_retributions_fnc_death_set_wanted; 
}
else { if (_killer_side == "Civilian" and _victim_side == "Civilian" and _victim_criminal && not(_victim_armed)) then {
	[_dp] call A_retributions_fnc_time_penalty;
	[_dp, format["homicide%1", _qualifier], _bounty] call A_retributions_fnc_death_set_wanted; 
}
else { if (_killer_side == "Civilian" and _victim_side == "Civilian" and _victim_criminal && _victim_armed) then {
	[_dp, format["homicide%1", _qualifier], _bounty] call A_retributions_fnc_death_set_wanted; 
}
else { if (_killer_side == "Civilian" and (_victim_side == "Opfor" or _victim_side == "Insurgent")) then {
	[_dp, format["vigilante-crime%1", _qualifier], 0] call A_retributions_fnc_death_set_wanted; 
}
else { if (_killer_side == "Civilian" and (_victim_side == "Cop")) then {
	[_dp] call A_retributions_fnc_time_penalty;
	[_dp] call A_retributions_fnc_remove_licenses;
	[_dp, format["federal-crime%1", _qualifier], _bounty] call A_retributions_fnc_death_set_wanted; 
}
else { if ((_killer_side == "Opfor" || _killer_side == "Insurgent") and _victim_side == "Civilian") then {
	[_dp] call A_retributions_fnc_time_penalty;
	[_dp] call A_retributions_fnc_remove_licenses;
	[_dp, format["war-crime%1", _qualifier], _bounty] call A_retributions_fnc_death_set_wanted; 
}
else { if (_killer_side == "Cop" and _victim_side == "Civilian") then {
	[_dp] call A_retributions_fnc_time_penalty;
};};};};};};};};
