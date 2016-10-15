// A_interaction_fnc_gang_area_capture

#include "header.h"


ARGV(0,_player);
ARGV(1,_gang_area);
if (!([_player] call A_player_fnc_human)) exitWith {null};
if (UNDEFINED(_gang_area)) exitWith {null};
if (typeName _gang_area != "OBJECT") exitWith {null};

[_player] call A_interaction_fnc_play_gang_animation;
	
if ([_gang_area] call A_gang_fnc_flag_at_max) exitWith {null};
[_gang_area, 0.5] call A_gang_fnc_flag_set_offset;
if (!([_gang_area] call A_gang_fnc_flag_at_max)) exitWith {null};

private["_gang", "_player_uid"];
_player_uid = [_player] call A_gang_fnc_player_uid;
_gang = [_player_uid] call A_gang_fnc_lookup_player_uid;
if (UNDEFINED(_gang)) exitWith {null};

private["_gang_id", "_gang_name"];
_gang_id = _gang select GANG_INDEX_ID;
_gang_name = _gang select GANG_INDEX_NAME;
[_gang_area, _gang_id] call A_gang_fnc_area_set_control;
	
private["_message"];
_message = format["%1 has been captured by %2!", _gang_area, _gang_name];
format['hint toString(%1);', toArray(_message)] call A_broadcast_fnc_broadcast;
