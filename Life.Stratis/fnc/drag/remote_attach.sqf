// A_drag_fnc_remote_attach

#include "../../includes/constants.h"
#include "../../includes/macro.h"

 _this spawn {
player grouPChat format["A_drag_fnc_remote_attach %1", _this];
ARGV(0,_object);
ARGV(1,_player);

detach _object;
[_object, "last_holder", _player, true] call A_object_fnc_setVariable;


private["_class", "_selection", "_point", "_weapon"];
_class = typeOf _object;
_selection = "LeftHandMiddle1";
_point = [_class, _selection] call  A_drag_fnc_attach_lookup_class_selection;
_weapon = currentWeapon _player;



if (_weapon == "" && not(undefined(_point))) exitWith {
	private["_heading", "_offset"];
	_heading = _point select A_drag_var_attach_point_heading;
	_offset = _point select A_drag_var_attach_point_offset;
	sleep 1;
	_object attachTo [_player, _offset, _selection];
	[_object, _heading] call A_object_fnc_set_heading;
};

private["_offset", "_up", "_dir"];
//_up = vectorUp _object;
_offset = _player worldToModel (_object modelToWorld [0,0,0]);
_dir = [(_player worldToModel ([(vectorDir _object), (getPos _object)] call A_vector_fnc_add)), _offset] call A_vector_fnc_subtract;
_dir = [_dir] call A_vector_fnc_normalize;

_up = [(_player worldToModel ([(vectorUp _object), (getPos _object)] call A_vector_fnc_add)), _offset] call A_vector_fnc_subtract;
_up = [_up] call A_vector_fnc_normalize;

sleep 1;
_object attachTo [_player, _offset];
_dir set [2, 0];
_object setVectorDirAndUp [_dir , (vectorUp _player)];
};
