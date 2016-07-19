// A_object_fnc_set_owner

#include "../../includes/macro.h"


private["_object", "_owner"];
_object = _this select 0;
_owner = _this select 1;

if (not(isServer)) exitWith {};
if (isNil "_object" || {typeName _object != "OBJECT" || {isNull _object}}) exitWith {};
if (isNil "_owner" || {typeName _owner != "OBJECT" || {isNull _owner}}) exitWith {};

_object setOwner (owner _owner);
