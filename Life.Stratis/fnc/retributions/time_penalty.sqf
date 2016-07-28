// A_retributions_fnc_time_penalty

#include "..\..\includes\macro.h"


private["_dp"];
_dp = _this select 0;
private["_killer", "_killed_uid"];
_killer = _dp select A_retributions_var_dp_killer;
_killer_uid = getPlayerUID _killer;
[_killer, "extradeadtime", 30] call A_player_fnc_update_scalar;
