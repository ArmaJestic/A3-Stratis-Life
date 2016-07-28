// A_retributions_fnc_add_killer

#include "..\..\includes\macro.h"


private ["_killers"];
_killer = _this select 0;
_type = _this select 1;
_lost_money = [] call A_retributions_fnc_determine_retribution;
_killer_name = name _killer;
_killer_uid = getPlayerUID _killer;
_victim_uid = getPlayerUID player;
_euid = format["%1_%2_%3", _victim_uid, time, _type];

_killer_data = [];
_killer_data set [A_retributions_var_ks_name, toArray _killer_name];
_killer_data set [A_retributions_var_ks_uid, _killer_uid];
_killer_data set [A_retributions_var_ks_money, _lost_money];
_killer_data set [A_retributions_var_ks_type, _type];
_killer_data set [A_retributions_var_ks_euid, _euid ];

_killer_fletter =  (toArray _killer_name) select 0;
_killers = [player, "killers"] call A_object_fnc_getVariable;

if (undefined(_killers)) then { _killers = []; };
if (typeName _killers != "ARRAY") then { _killers = []; };

_killers = _killers + [_killer_data];

//player groupChat format["Adding-Killer: %1", _killer_data];
//player groupChat format["All-Killers: %1", _killers];

[player, "killers", _killers, true] call A_object_fnc_setVariable;

format[
'
	_puid = getPlayerUID player;
	_pfletter =  (toArray (name player)) select 0;
	
	_victim = %1;
	_killer_uid = "%2";
	_killer_fletter = %3;
	_type = "%4";
	_euid = "%5";
	_lost_money = %6;
	
	if (_puid == _killer_uid && _pfletter == _killer_fletter ) then
	{
		[_victim, _type, _euid, _lost_money] call A_retributions_fnc_add_victim;
	};
', player, _killer_uid, _killer_fletter, _type, _euid, _lost_money] call A_broadcast_fnc_broadcast;
