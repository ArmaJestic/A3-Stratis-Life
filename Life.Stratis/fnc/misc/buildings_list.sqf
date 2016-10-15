// A_misc_fnc_buildings_list

#include "..\..\includes\macro.h"

if (!(UNDEFINED(A_misc_var_all_buildings))) exitWith {A_misc_var_all_buildings};

private _pos = getPosATL player;
A_misc_var_all_buildings = [(_pos select 0), (_pos select 1)] nearObjects ["Building",1000000];
A_misc_var_all_buildings