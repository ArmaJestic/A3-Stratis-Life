// A_retributions_fnc_tk_jail_cop

#include "..\..\includes\macro.h"


private["_killer", "_victim"];
_killer = _this select 0;
_victim = _this select 1;

if (undefined(_killer)) exitWith {null};
if (undefined(_killer)) exitWith {null};

if (_killer != player) exitWith {null};
if (!([_killer] call A_player_fnc_blufor)) exitWith {null};

if (!((_victim distance copbase1) < 400 || (_killer distance copbase1) < 400 || copskilled > 5)) exitWith {null};
[_killer, "roeprisontime", A_main_var_copinprisontime] call A_player_fnc_set_scalar;
[_killer] call A_player_fnc_prison_roe;
