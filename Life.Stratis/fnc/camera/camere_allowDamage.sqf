// A_camera_fnc_camere_allowDamage

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_object);
ARGV(1,_state);

if (isNil "_object" || {typeName _object != "OBJECT" || {isNull _object}}) exitWith {};
if (isNil "_state" || {typeName _state != "BOOL"}) exitWith {};
_object allowDamage _state;
