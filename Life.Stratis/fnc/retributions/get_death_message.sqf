// A_retributions_fnc_get_death_message

#include "..\..\includes\macro.h"


private["_dp"];
_dp = _this select 0;

private["_killer", "_suicide", "_victim_armed", "_victim_criminal", "_roadkill", "_victim_side", "_killer_side", "_victim_name", "_killer_name", "_teamkill", "_justified"];
_killer = _dp select A_retributions_var_dp_killer;
_suicide = _dp select A_retributions_var_dp_is_suicide;
_victim_armed = _dp select A_retributions_var_dp_is_victim_armed;
_victim_criminal = _dp select A_retributions_var_dp_is_victim_criminal;
_roadkill = _dp select A_retributions_var_dp_is_roadkill;
_victim_side = _dp select A_retributions_var_dp_victim_side;
_killer_side = _dp select A_retributions_var_dp_killer_side;
_victim_name = _dp select A_retributions_var_dp_victim_name;
_killer_name = _dp select A_retributions_var_dp_killer_name;
_teamkill = _dp select A_retributions_var_dp_is_teamkill;
_justified = _dp select A_retributions_var_dp_justified;


if (respawnButtonPressed) exitWith {
	format["%1 commited suicide, by clicking on respawn", _victim_name];
};

if (_suicide) exitWith { 
	format["%1 committed suicide", _victim_name];	
};

//Death messages
private ["_message", "_armed_str", "_vehicle_str", "_criminal_str"];

_armed_str = "Unarmed";
if (_victim_armed) then { _armed_str = "Armed";};

_criminal_str = "";
if (_victim_criminal) then { _criminal_str = "-Criminal";};

_vehicle_str = "";
if (_roadkill) then { _vehicle_str = " with a vehicle"; };

if (_victim_side == "Civilian") exitWith {
	format["%1 killed %2 (%3%6 %4)%5", _killer_name, _victim_name, _armed_str, _victim_side, _vehicle_str, _criminal_str];
};

if (_teamkill) exitWith {
	format["%1 team-killed %2 (%3%6 %4)%5", _killer_name, _victim_name, _armed_str, _victim_side, _vehicle_str, _criminal_str];
};

_message = format["%1 murdered %2 (%3%6 %4)%5", _killer_name, _victim_name, _armed_str, _victim_side, _vehicle_str, _criminal_str];
_message
