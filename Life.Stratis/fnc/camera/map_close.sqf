// A_camera_fnc_map_close

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


ARGV(0,_player);

[_player, false] call A_camera_fnc_set_map_open;
openMap [false, false];

private["_pos"];
_pos = [_player] call A_camera_fnc_get_world_position;
mapAnimAdd [0, (ctrlMapScale (call A_camera_fnc_map_control)) , _pos];
mapAnimCommit;
