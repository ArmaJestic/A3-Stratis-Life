#include "includes\macro.h"

_initFileNames = [];

{

_filename = _x call A_inventory_fnc_get_item_file;
_item     = _x call A_inventory_fnc_get_item_script_name;

if ((_filename != "") and (!(_filename in _initFileNames))) then

	{

	_initFileNames = _initFileNames + [_filename];
	["init", _item] execVM format["%1", _filename];

	};

} forEach INV_AllItemsArray;
