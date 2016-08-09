// A_retributions_fnc_compute_death_parameters

#include "..\..\includes\macro.h"


private["_killer", "_near_driver", "_killer_name", "_victim_name", "_roadkill", "_is_driver_near", "_suicide"];
_killer = _this select 0;
_near_driver =  [] call A_retributions_fnc_get_near_vehicle_driver;

_killer_name = (name _killer);
_victim_name = (name player);

_roadkill = false;
_is_driver_near = !(undefined(_near_driver));
_suicide = (_killer_name == _victim_name);

	
if (_suicide && _is_driver_near ) then {
	_killer = _near_driver;
	_killer_name = (name _near_driver);
	_roadkill = true;
	_suicide = false;
};

private["_victim_armed", "_victim_side", "_killer_side", "_victim_bounty", "_victim_criminal", "_teamkill", "_justified", "_enemies", "_killer_uid", "_victim_uid"];
_victim_armed = [player] call A_player_fnc_armed;
_victim_side = [player] call A_stats_fnc_get_faction;
_killer_side = [_killer] call A_stats_fnc_get_faction;
_victim_bounty = [player] call A_player_fnc_get_bounty;
_victim_criminal =  (_victim_bounty > 0);
_teamkill = (_victim_side == _killer_side) && (_victim_side != "Civilian");
_justified = (_victim_armed || _victim_criminal);
_enemies = ((_killer_side != _victim_side) && !((_victim_side == "Civilian") || (_killer_side == "Civilian")));
_killer_uid = getPlayerUID _killer;
_victim_uid = getPlayerUID player;

private["_result"];
_result = [];
_result set [A_retributions_var_dp_killer, _killer];
_result set [A_retributions_var_dp_victim, player];
_result set [A_retributions_var_dp_victim_side, _victim_side];
_result set [A_retributions_var_dp_killer_side, _killer_side];
_result set [A_retributions_var_dp_is_victim_armed,  _victim_armed];
_result set [A_retributions_var_dp_victim_bounty, _victim_bounty];
_result set [A_retributions_var_dp_is_victim_criminal, _victim_criminal];
_result set [A_retributions_var_dp_is_teamkill, _teamkill];
_result set [A_retributions_var_dp_justified, _justified];
_result set [A_retributions_var_dp_is_suicide, _suicide];
_result set [A_retributions_var_dp_victim_name, _victim_name];
_result set [A_retributions_var_dp_killer_name, _killer_name];
_result set [A_retributions_var_dp_is_roadkill, _roadkill];
_result set [A_retributions_var_dp_enemies, _enemies];
_result set [A_retributions_var_dp_killer_uid, _killer_uid];
_result set [A_retributions_var_dp_victim_uid, _victim_uid];

//player groupChat format["RES: %1", _result];

_result
