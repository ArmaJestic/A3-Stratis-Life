// A_player_fnc_save_side_gear_setup

#include "..\..\includes\macro.h"


if (!(isServer)) exitWith {null};
//player groupChat format["A_player_fnc_save_side_gear_setup %1", _this];
side_gear_request_buffer =  " ";
publicVariableServer "side_gear_request_buffer";
"side_gear_request_buffer" addPublicVariableEventHandler { _this call A_player_fnc_side_gear_request_receive;};
