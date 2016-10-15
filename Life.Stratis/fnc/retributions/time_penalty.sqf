// A_retributions_fnc_time_penalty

#include "header.h"


private["_dp"];
_dp = _this select 0;
private["_killer", "_killed_uid"];
_killer = _dp select INDEX_DP_KILLER;
_killer_uid = getPlayerUID _killer;
[_killer, "extradeadtime", 30] call A_player_fnc_update_scalar;
