// A_interaction_fnc_pump_barrel_hit

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["interact_barrel_hit %1", _this];
ARGV(0,_player);
ARGV(1,_object);
ARGV(2,_barrel);
sleep 0.4;

private["_amount"];
_amount = [_barrel, "amount", 0] call A_object_fnc_getVariable;

if (_amount <= 0) exitWith {
	player groupChat format["There is no crude oil to scoop from this pump barrel"];
};

if (A_interaction_var_interact_pump_barrel_hits >= A_interaction_var_A_interaction_var_interact_pump_barrel_hits_max) exitWith {
	player groupChat format["You have %1/%2 crude oil in the bucket", A_interaction_var_interact_pump_barrel_hits, A_interaction_var_A_interaction_var_interact_pump_barrel_hits_max];
};


private["_sound", "_slosh_sounds"];
_slosh_sounds = [
	"sounds\slosh1.ogg",
	"sounds\slosh2.ogg",
	"sounds\slosh3.ogg"
];
_sound = MISSION_ROOT + (_slosh_sounds select (floor random (count(_slosh_sounds))));
playSound3d [_sound, _player, true];

A_interaction_var_A_interaction_var_interact_pump_barrel_hits = A_interaction_var_A_interaction_var_interact_pump_barrel_hits + 1;
[_barrel, (_amount - 1)] call A_oil_derrick_fnc_barrel_update;
player groupChat format["You have %1/%2 crude oil in the bucket", A_interaction_var_interact_pump_barrel_hits, A_interaction_var_A_interaction_var_interact_pump_barrel_hits_max];
