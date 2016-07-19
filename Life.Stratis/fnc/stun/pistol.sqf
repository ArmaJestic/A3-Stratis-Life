// A_stun_fnc_pistol

#include "..\..\includes\macro.h"

 _this spawn {
ARGV(0,_unit);
ARGV(1,_man);

if (A_stun_var_stunning) exitWith {null};
A_stun_var_stunning = true;

format['%1 switchmove "AwopPercMstpSgthWnonDnon_end";',_unit] call broadcast;
sleep 0.3;
if (undefined(_man) || 
	{typeName _man != "OBJECT" || 
	{not(alive _man) || 
	{((_man distance _unit) > 3) || 
	{not([_unit, _man] call A_pos_fnc_is_facing)}}}}) exitWith {A_stun_var_stunning = false};

_dir = [_unit, _man] call A_pos_fnc_is_frontback;

if (_dir == "front") then {
	[_unit, _man] call A_stun_fnc_pistol_front;
};
if (_dir == "back") then {
	[_unit, _man] call A_stun_fnc_pistol_back;
};

A_stun_var_stunning = false;
};
