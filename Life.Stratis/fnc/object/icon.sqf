// A_object_fnc_icon

#include "..\..\includes\macro.h"


//player groupChat format["A_object_fnc_icon %1", _this];
ARGV(0,_item)
ARGV(1,_class);
ARGV(2,_type);

if (toLower(_type) == "item") exitWith {
	//player groupChat format["_item = %1, _type = %2", _item, _type];
	private["_icon"];
	_icon = ([_item] call A_object_fnc_item_icon);
	//player groupChat format["_icon = %1", _icon];
	_icon
};

private["_picture"];
_picture = ([_class] call A_misc_fnc_generic_picture_path);	
_picture
