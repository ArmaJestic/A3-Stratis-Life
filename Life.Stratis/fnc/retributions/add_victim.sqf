// A_retributions_fnc_add_victim

#include "header.h"


private ["_victims"];
_victim = _this select 0;
_type = _this select 1;
_euid = _this select 2;
_lost_money = _this select 3;

_victim_name = name _victim;
_victim_uid = getPlayerUID _victim;

_victim_data = [];
_victim_data set [INDEX_VS_NAME, toArray _victim_name];
_victim_data set [INDEX_VS_UID, _victim_uid];
_victim_data set [INDEX_VS_EUID, _lost_money];
_victim_data set [INDEX_VS_TYPE, _type];
_victim_data set [INDEX_VS_EUID, _euid];
	
_victims = [player, "victims"] call A_object_fnc_getVariable;
if (UNDEFINED(_victims)) then { _victims = []; };
if (typeName _victims != "ARRAY") then { _victims = []; };

_victims = _victims + [_victim_data];

//player groupChat format["Adding-A_retributions_fnc_victim: %1", _victim_data];
//player groupChat format["All-A_retributions_fnc_victim: %1", _victims];

[player, "victims", _victims, true] call A_object_fnc_setVariable;
