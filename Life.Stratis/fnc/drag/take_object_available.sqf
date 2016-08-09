// A_drag_fnc_take_object_available

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player grouPChat format["A_drag_fnc_take_object_available %1", _this];
ARGV(0,_player);
ARGV(1,_object);
if (!([_player] call A_player_fnc_exists)) exitWith {false};
if (undefined(_object)) exitWith {false};

if ([_player] call A_drag_fnc_object_active) exitWith {false};
//player groupChat format["_object = %1", _object];
if (isNull _object) exitWith {false};

if ((_player distance _object) > 2) exitWith {false};

true
