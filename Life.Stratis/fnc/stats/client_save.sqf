// A_stats_fnc_client_save

//Method intended to be run on client-side, for saving CLIENT specific variables

#include "../../includes/macro.h"

private["_variable", "_value"];
	
_variable = _this select 0;
_value = _this select 1;
	
[player, _variable, _value] call A_stats_fnc_player_save;
true
