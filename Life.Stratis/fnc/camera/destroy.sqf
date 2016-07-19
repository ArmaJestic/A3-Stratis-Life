// A_camera_fnc_destroy

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


camera_unit globalChat format["A_camera_fnc_destroy %1", _this];
ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {};

private["_camera"];
_camera = [_player, "camera"] call A_object_fnc_getVariable;
if (undefined(_camera)) exitWith {};

[_player, "camera", null] call A_object_fnc_setVariable;
[_player] call A_camera_fnc_map_close;

_camera cameraEffect ["terminate","back"];
camera_unit globalChat format["destroying camera! %1", _camera];
camDestroy _camera;
