// A_nametags_fnc_onEachFrame

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


call A_camera_fnc_draw_helpers;
call A_nametags_fnc_water_edge_check_effects;
call A_nametags_fnc_loading_check_stance;
call A_bases_fnc_bunker_check_animation;
call A_bases_fnc_underwater_check_transition;
call A_bases_fnc_underbase_check_effects;

if (!A_inv_var_shortcuts) exitWith {
	drawicon3d_text_field ctrlShow false;
};

[player, ([player] call A_player_fnc_side)] call A_nametags_fnc_3d_tags_draw;
if (!([player] call A_nametags_fnc_tags_draw)) then {
	drawicon3d_text_field ctrlShow false;
};

[] call A_vehicle_fnc_tuning_handler;
[] call A_camera_fnc_loop;


private _cTarget = cursorTarget;
if !(isNull _cTarget) exitWith {A_nametags_var_cursortarget__ = _cTarget;};

private _cTargets = nearestObjects [(player modelToWorld (player selectionPosition "RightHand")), ["Man", "Car", "Air", "Ship", "Land_CargoBox_V1_F", "ReammoBox_F", "Items_base_F", "Cargo_base_F"], 25];
if (count(_cTargets) > 0) exitWith {
	A_nametags_var_heldtarget__ = [player, "held_target", objNull] call A_object_fnc_getVariable;
	A_nametags_var_firsttarget__ = (_cTargets select 1);
	A_nametags_var_secondtarget__ = if (count(_cTargets) > 2) then {(_cTargets select 2)} else {objNull};
	
	if (!(isNull A_nametags_var_heldtarget__) && {A_nametags_var_firsttarget__ == A_nametags_var_heldtarget__}) then {
		A_nametags_var_cursortarget__ = A_nametags_var_secondtarget__;
	}else{
		A_nametags_var_cursortarget__ = A_nametags_var_firsttarget__;
	};
};

A_nametags_var_cursortarget__ = objNull;