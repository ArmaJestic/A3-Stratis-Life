// A_camera_fnc_update_map

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_key);
ARGV(2,_shift);

if (!(_key in (actionKeys "ShowMap"))) exitWith {null};

if (!([_player] call A_camera_fnc_get_map_open)) then {
	[_player] call A_camera_fnc_map_open;
}else{
	[_player] call A_camera_fnc_map_close;
};
