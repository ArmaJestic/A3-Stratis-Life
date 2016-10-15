// A_bases_fnc_bunker_blf_create

#include "header.h"


params["_name","_offset"];
if (UNDEFINED(_name)) exitWith {};
if (UNDEFINED(_offset)) exitWith {};

private _bunker_data = [];
_bunker_data set [BUNKER_INDEX_DATA_NAME, _name];

private _doors1 = [_bunker_data] call A_bases_fnc_bunker_blf_create_entrance;
private _doors2 = [_bunker_data, _offset, [-120,0,0]] call A_bases_fnc_bunker_blf_create_underground;
[_doors1, _doors2] call A_bases_fnc_bunker_match_doors;