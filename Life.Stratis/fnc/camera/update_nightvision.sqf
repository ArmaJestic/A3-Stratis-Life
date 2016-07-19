// A_camera_fnc_update_nightvision

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_key);

if (not(_key in actionKeys "NightVision")) exitWith {null};

private["_nightvision"];
_nightvision = [_player] call A_camera_fnc_get_nightvision;
_nightvision = ((_nightvision + 1) % 10);
//player groupChat format["_nightvision = %1", _nightvision];
switch (_nightvision) do {
	case 0: {
		camera_unit groupChat format["Setting camera default mode"];
		camUseNVG false;
		false SetCamUseTi 0;
	};
	case 1: {
		camera_unit groupChat format["Setting camera NV "];
		camUseNVG true;
		false SetCamUseTi 0;
	};
	case 2: {
		camera_unit groupChat format["Setting camera thermal white-hot"];
		camUseNVG false;
		true SetCamUseTi 0;
	};
	case 3: {
		camera_unit groupChat format["Setting camera thermal black-hot"];
		camUseNVG false;
		true SetCamUseTi 1;
	};
	case 4: {
		camera_unit groupChat format["Setting camera thermal light-green-hot"];
		camUseNVG false;
		true SetCamUseTi 2;
	};
	case 5: {
		camera_unit groupChat format["Setting camera thermal dark-green-hot"];
		camUseNVG false;
		true SetCamUseTi 3;
	};
	case 6: {
		camera_unit groupChat format["Setting camera light-orange-hot "];
		camUseNVG false;
		true SetCamUseTi 4;
	};
	case 7: {
		camera_unit groupChat format["Setting camera dark-orange-hot "];
		camUseNVG false;
		true SetCamUseTi 5;
	};
	case 8: {
		camera_unit groupChat format["Setting camera orange body-heat "];
		camUseNVG false;
		true SetCamUseTi 6;
	};
	case 9: {
		camera_unit groupChat format["Setting camera colored body-heat "];
		camUseNVG false;
		true SetCamUseTi 7;
	};
};

[_player, _nightvision] call A_camera_fnc_set_nightvision;
