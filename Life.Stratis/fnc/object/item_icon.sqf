// A_object_fnc_item_icon

#include "..\..\includes\macro.h"

 
ARGV(0,_item);

if (UNDEFINED(_item)) exitWith {};
if (typeName _item != "STRING") exitWith {};

private["_data"];
_data = ITEM_DATA(_item);
if (count(_data) == 0) exitWith {""};

private["_icon"];
_icon = ITEM_DATA_ICON(_data);

if (UNDEFINED(_icon) || {_icon == ""}) exitWith{
	private["_class"];
	_class = ITEM_DATA_CLASS(_data);
	_icon = [_class] call A_misc_fnc_generic_icon_path;
	(_icon call BIS_fnc_textureVehicleIcon)
};
	
_icon
