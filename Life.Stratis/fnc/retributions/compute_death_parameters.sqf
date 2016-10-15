// A_retributions_fnc_compute_death_parameters

#include "header.h"


private["_killer", "_near_driver", "_killer_name", "_victim_name", "_roadkill", "_is_driver_near", "_suicide"];
_killer = _this select 0;
_near_driver =  [] call A_retributions_fnc_get_near_vehicle_driver;

_killer_name = (name _killer);
_victim_name = (name player);

_roadkill = false;
_is_driver_near = !(UNDEFINED(_near_driver));
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
_result set [INDEX_DP_KILLER, _killer];
_result set [INDEX_DP_VICTIM, player];
_result set [INDEX_DP_VICTIM_SIDE, _victim_side];
_result set [INDEX_DP_KILLER_SIDE, _killer_side];
_result set [INDEX_DP_VICTIM_ARMED,  _victim_armed];
_result set [INDEX_DP_VICTIM_BOUNTY, _victim_bounty];
_result set [INDEX_DP_VICTIM_CRIMINAL, _victim_criminal];
_result set [INDEX_DP_TEAMKILL, _teamkill];
_result set [INDEX_DP_JUSTIFIED, _justified];
_result set [INDEX_DP_SUICIDE, _suicide];
_result set [INDEX_DP_VICTIM_NAME, _victim_name];
_result set [INDEX_DP_KILLER_NAME, _killer_name];
_result set [INDEX_DP_ROADKILL, _roadkill];
_result set [INDEX_DP_ENEMIES, _enemies];
_result set [INDEX_DP_KILLER_UID, _killer_uid];
_result set [INDEX_DP_VICTIM_UID, _victim_uid];

//player groupChat format["RES: %1", _result];

_result
