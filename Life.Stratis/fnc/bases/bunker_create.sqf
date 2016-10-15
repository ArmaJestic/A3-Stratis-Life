// A_bases_fnc_bunker_create

#include "header.h"


params[["_name",null,[""]],["_position",null,[[]],3]];
if (UNDEFINED(_name)) exitWith {};
if (UNDEFINED(_position)) exitWith {};


private _object = createVehicle ["Sign_Sphere100cm_F", _position, [], 0, "CAN_COLLIDE"];
_object setPos _position;
[_object, _object,[0,0,0], [0,0,0]] call A_object_fnc_fake_attach;
_object hideObject true;

[[_object, true], "A_object_fnc_hide", _object] call A_jip_fnc_register;

private _bunker_data = [];
_bunker_data set[BUNKER_INDEX_DATA_NAME, _name];

private _doors1 = [_bunker_data, _object, [0,0,0], [0,0,0]] call A_bases_fnc_bunker_create_entrance;
private _doors2 = [_bunker_data, _object, [0,0,15000], [0,0,0]] call A_bases_fnc_bunker_create_underground;

[_doors1, _doors2] call A_bases_fnc_bunker_match_doors;