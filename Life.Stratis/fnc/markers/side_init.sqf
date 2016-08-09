// A_markers_fnc_side_init

#include "..\..\includes\macro.h"


//create local markers for all cops (even if not in game), and hide them
private["_i", "_local_markers"];
_local_markers = [];
_i = 0;
while { _i < (count playerstringarray) } do {
	private["_player_variable_name", "_player_variable"];
	_player_variable_name = playerstringarray select _i;

	private["_local_marker", "_local_marker_text", "_local_marker_name", "_local_marker_location"];
	_local_marker_name = _player_variable_name;
	_local_marker_location = [0, 0];
	_local_marker_text = _player_variable_name;
	_local_marker = [_local_marker_name, _local_marker_location, _local_marker_text] call A_markers_fnc_local_side_create;
	if (!(_local_marker == "")) then {
		_local_marker setMarkerAlphaLocal 0;
		_local_markers = _local_markers + [_local_marker];
	};
	_i = _i + 1;
};
_local_markers
