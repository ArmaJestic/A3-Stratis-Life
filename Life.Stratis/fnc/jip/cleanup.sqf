// A_jip_fnc_cleanup

#include "../../includes/macro.h"
#include "../../includes/constants.h"

{
	private["_entry", "_entry_object"];
	_entry = _x;
	_entry_object = _entry select jip_entry_object;
	if ((typeName _entry_object == "OBJECT") && {isNull _entry_object}) then {
		jip_registry set [_forEachIndex, objNull];
	};

	if ((typename _entry_object == "SCALAR") && {_entry_object > serverTime}) then {
		jip_registry set [_forEachIndex, objNull];
	};
	
} forEach jip_registry;
jip_registry = jip_registry - [objNull];
