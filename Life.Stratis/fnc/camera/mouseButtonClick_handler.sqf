// A_camera_fnc_mouseButtonClick_handler

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_camera_fnc_mouseButtonClick_handler %1", _this];
ARGV(0,_this);

private["_player"];
_player = camera_unit;

if (!([_player] call A_camera_fnc_get_map_open)) exitWith {false};

ARGV(0,_display);
ARGV(1,_button);
ARGV(2,_x);
ARGV(3,_y);
ARGV(5,_control);

if (!(_button == 0)) exitWith {null};

private["_target"];
_target = [_player, "A_camera_fnc_target"] call A_object_fnc_getVariable;
if (!(undefined(_target))) exitWith {
	player groupChat format["Cannot teleport while camera is attached to a target"];
	false
};

private["_world_pos"];
_world_pos = _display posScreenToWorld [_x,_y];

private["_pos"];
_pos = [_player] call A_camera_fnc_get_position;
_world_pos set [2, (_pos select 2)];

[_player, _world_pos] call A_camera_fnc_set_position;
mapAnimAdd [0, (ctrlMapScale _display), _world_pos];
mapAnimCommit;

[_player] call A_camera_fnc_map_close;

true
