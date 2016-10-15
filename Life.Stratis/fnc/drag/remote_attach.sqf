// A_drag_fnc_remote_attach

#include "header.h"


params["_object","_player"];

detach _object;
[_object, "last_holder", _player, true] call A_object_fnc_setVariable;

private _class = typeOf _object;
private _selection = "LeftHandMiddle1";
private _point = [_class, _selection] call  A_drag_fnc_attach_lookup_class_selection;
private _weapon = currentWeapon _player;

if (_weapon == "" && !(UNDEFINED(_point))) exitWith {
	private _heading = _point select INDEX_POINT_HEADING;
	private _offset = _point select INDEX_POINT_OFFSET;
	sleep 1;
	_object attachTo [_player, _offset, _selection];
	[_object, _heading] call A_object_fnc_set_heading;
};

//private _up = vectorUp _object;
private _offset = _player worldToModel (_object modelToWorld [0,0,0]);
private _dir = [(_player worldToModel ([(vectorDir _object), (getPos _object)] call A_vector_fnc_add)), _offset] call A_vector_fnc_subtract;
_dir = [_dir] call A_vector_fnc_normalize;

_up = [(_player worldToModel ([(vectorUp _object), (getPos _object)] call A_vector_fnc_add)), _offset] call A_vector_fnc_subtract;
_up = [_up] call A_vector_fnc_normalize;

sleep 1;
_object attachTo [_player, _offset];
_dir set [2, 0];
_object setVectorDirAndUp [_dir , (vectorUp _player)];