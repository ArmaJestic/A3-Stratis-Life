// A_markers_fnc_side_loop_draw

#include "..\..\includes\macro.h"


if (!(visibleMap)) exitWith {null};
//player groupChat format["marking %1", _this];
ARGV(0,_local_marker);
if (UNDEFINED(_local_marker)) exitWith {null};

private["_player_variable_name", "_player_variable"];
_player_variable_name = _local_marker;
_player_variable = missionNamespace getVariable [_player_variable_name, null];


if (!([player, "sidemarkers"] call A_player_fnc_get_bool) || 
	!([player] call A_player_fnc_human) || 
	([player] call A_player_fnc_civilian) ||
	!([_player_variable] call A_player_fnc_human) ||
	([_player_variable] call A_player_fnc_civilian)) exitWith {
	_local_marker setMarkerAlphaLocal 0;
};

private["_has_admin_camera", "_under"];
_has_admin_camera = [_player_variable, "has_admin_camera"] call A_object_fnc_getVariable;
_has_admin_camera = if (UNDEFINED(_has_admin_camera)) then { false } else {_has_admin_camera};
_has_admin_camera = if (typeName _has_admin_camera != "BOOL") then {false} else {_has_admin_camera};
_under = [_player_variable] call A_bases_fnc_underbase_player;

if (_has_admin_camera || _under) exitWith {
	_local_marker setMarkerAlphaLocal 0;
};

//both the marked-player, and the player belong to the same side
if (([player] call A_player_fnc_side) != ([_player_variable] call A_player_fnc_side)) exitWith {
	_local_marker setMarkerAlphaLocal 0;
};

//player groupChat format["_player_variable = %1", _player_variable];
private["_location"];
_location = getPos _player_variable;
_local_marker setMarkerAlphaLocal 1;
_local_marker setMarkerPosLocal [(_location select 0), (_location select 1)];
_local_marker setMarkerTextLocal (format["%1-%2", _player_variable, (name _player_variable)]);
