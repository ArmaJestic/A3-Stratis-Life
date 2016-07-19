// A_player_fnc_save_side_gear

#include "..\..\includes\macro.h"


player groupChat format["A_player_fnc_save_side_gear %1", _this];
ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};

side_gear_request_buffer = [_player];
if (isServer) then {
	["", side_gear_request_buffer] call A_player_fnc_side_gear_request_receive;
}
else {
	publicVariable "side_gear_request_buffer";
};
