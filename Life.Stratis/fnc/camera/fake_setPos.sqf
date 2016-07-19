// A_camera_fnc_fake_setPos

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_camera_fnc_fake_setPos %1", _this];
ARGV(0,_object);
ARGV(1,_position);
ARGV(2,_heading);

[_object, camera_setPos_reference,  (camera_setPos_reference worldToModel _position), _heading, true] call A_object_fnc_fake_attach;
if ([_object, "attached", false] call A_object_fnc_getVariable) exitWith {};
if (OBJECT_CHEMLIGHT(_object)) exitWith {};

//player groupchat format["detaching!"];
//detach _object;
