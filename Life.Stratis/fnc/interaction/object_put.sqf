// A_interaction_fnc_object_put

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"

 _this spawn {
//player groupChat format["A_interaction_fnc_object_put %1", _this];

[] call A_interaction_fnc_play_pickup_animation;

ARGV(0,_this);
ARGV(0,_player);
ARGV(1,_object);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_object)) exitWith {null};
if (typeName _object != "OBJECT") exitWith {null};

if (A_interaction_var_interact_object_put_active) exitWith {
	player groupChat format["WARNING: A_interaction_fnc_object_put already active"];
};
A_interaction_var_interact_object_put_active = true;

private["_item", "_amount", "_data"];
_item = [_object, "item"] call A_object_fnc_getVariable;
_amount = [_object, "amount"] call A_object_fnc_getVariable;
_amount = [_amount] call A_encoding_fnc_decode_number;
_data = [_object, "data", null] call A_object_fnc_getVariable;

private["_remaining"];
_remaining = [_player, _item, _amount, _data] call A_interaction_fnc_item_put_inventory;

if (undefined(_remaining)) exitWith {
	A_interaction_var_interact_object_put_active = false;
};

if (_remaining <= 0) exitWith {
	detach _object;
	deleteVehicle _object;
	A_interaction_var_interact_object_put_active = false;
};

_remaining = [_remaining] call A_encoding_fnc_encode_number;
[_object, "amount", _remaining, true] call A_object_fnc_setVariable;
A_interaction_var_interact_object_put_active = false;
};
