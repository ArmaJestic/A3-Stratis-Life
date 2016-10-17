// A_interaction_fnc_main_menu

#include "header.h"


params["_player"];
if (!([_player] call A_player_fnc_human)) exitWith {null};

if (!(createDialog "WeaponModifications")) exitWith {
	player groupChat format["ERROR: cannot create weapon modifications menu"];	
};

private _camera = [_player] call A_player_fnc_camera_create;
private _target = _player;
private _origin = _player selectionPosition "righthand";

private _relative = _origin;
_relative = [(_origin select 0) - 1, (_origin select 1) + 1, (_origin select 2) + 0.5];

private _heading = [145,-20,0];
private _vectors = [_heading] call A_camera_fnc_heading2vectors;
_camera attachTo [_target, _relative];
_camera setVectorDirAndUp _vectors;

[player] call A_weapon_fnc_modifications_dialog_setup;