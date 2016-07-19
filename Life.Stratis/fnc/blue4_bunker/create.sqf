// A_blue4_bunker_fnc_create

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_name);
ARGV(1,_offset);
if (undefined(_name)) exitWith {};
if (undefined(_offset)) exitWith {};


private["_bunker_data"];
_bunker_data = [];
_bunker_data set [A_bunker_var_data_name, _name];

private["_doors1", "_doors2"];
_doors1 = [_bunker_data] call A_blue4_bunker_fnc_create_entrance;
_doors2 = [_bunker_data, _offset, [-120,0,0]] call A_blue4_bunker_fnc_create_underground;
[_doors1, _doors2] call A_bunker_fnc_match_doors;
