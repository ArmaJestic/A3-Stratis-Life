// A_camera_fnc_map_open

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);

[_player, true] call A_camera_fnc_set_map_open;
openMap [true, true];

(call A_camera_fnc_map_control) mapCenterOnCamera false;

private["_pos"];
_pos = [_player] call A_camera_fnc_get_world_position;
mapAnimAdd [0, (ctrlMapScale (call A_camera_fnc_map_control)) , _pos];
mapAnimCommit;
