// A_interaction_fnc_satellite_camera_keydown_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_interaction_fnc_satellite_camera_keydown_handler %1", _this];
ARGV(1,_key);

private["_offset"];
_offset = [0,0,0];
switch (_key) do {
	case DIK_W: { _offset = [0, 100,0];};
	case DIK_A: { _offset = [-100, 0, 0];};
	case DIK_D: { _offset = [100, 0, 0];};
	case DIK_S: { _offset = [0, -100, 0];};
	case DIK_F: { _offset = [0,0,0];};
};

[_offset] call A_interaction_fnc_satellite_camera_move;
