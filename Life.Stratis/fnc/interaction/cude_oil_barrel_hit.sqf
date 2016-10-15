// A_interaction_fnc_cude_oil_barrel_hit

#include "header.h"


params["_player","_object","_barrel"];
sleep 0.4;

if (A_interaction_var_pump_barrel_hits <= 0) exitWith {
	player groupChat format["You do not have any crude oil in the bucket to pour into the barrel"];
};

if (([_barrel, "item", ""] call A_object_fnc_getVariable) == "emptybarrel") then {
	//convert the empty barrel into an oil barrel
	[_barrel, "crudeoil", 0] call A_object_fnc_item_set_data;
};

private _amount = [([_barrel, "amount", 0] call A_object_fnc_getVariable)] call A_encoding_fnc_decode_number;
if (_amount  >= A_interaction_var_crude_oil_barrel_hit_max) exitWith {
	player groupChat format["This crude oil barrel is already at maximum capacity."];
};

private _slosh_sounds = [
	"sounds\splash1.ogg",
	"sounds\splash2.ogg",
	"sounds\splash3.ogg"
];
private _sound = MISSION_ROOT+(_slosh_sounds select (floor random (count(_slosh_sounds))));
playSound3d [_sound, _player, true];

player groupChat format["You have poured %1 crude oil onto this barrel", A_interaction_var_pump_barrel_hits];
[_barrel, (_amount + A_interaction_var_pump_barrel_hits)] call A_object_fnc_item_update_amount;
A_interaction_var_pump_barrel_hits = 0;
