// A_bunker_fnc_create

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_name);
ARGV(1,_position);
if (undefined(_name)) exitWith {};
if (undefined(_position)) exitWith {};


private["_object"];
_object = createVehicle ["Sign_Sphere100cm_F", _position, [], 0, "CAN_COLLIDE"];
_object setPos _position;
[_object, _object,[0,0,0], [0,0,0]] call A_object_fnc_fake_attach;
_object hideObject true;

[[_object, true], "A_object_fnc_hide", true, true] call A_jip_fnc_register;

private["_bunker_data"];
_bunker_data = [];
_bunker_data set [A_bunker_var_data_name, _name];

private["_doors1", "_doors2"];
_doors1 = [_bunker_data, _object, [0,0,0], [0,0,0]] call A_bunker_fnc_create_entrance;
_doors2 = [_bunker_data, _object, [0,0,15000], [0,0,0]] call A_bunker_fnc_create_underground;

[_doors1, _doors2] call A_bunker_fnc_match_doors;
