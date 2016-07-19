// A_markers_fnc_loop_draw

#include "..\..\includes\macro.h"


if (not([player] call A_camera_fnc_get_map_open)) exitWith {null};
//player groupChat format["marking %1", _this];
ARGV(0,_local_marker);
if (undefined(_local_marker)) exitWith {null};

private["_player_variable_name", "_player_variable"];
_player_variable_name = _local_marker;
_player_variable = missionNamespace getVariable _player_variable_name;

if (not([_player_variable] call A_player_fnc_exists)) exitWith {
	_local_marker setMarkerAlphaLocal 0;
};

private["_location"];
_location = getPos _player_variable;
_local_marker setMarkerAlphaLocal 1;
_local_marker setMarkerPosLocal [(_location select 0), (_location select 1)];
_local_marker setMarkerTextLocal (format["%1-%2", _player_variable, (name _player_variable)]);
