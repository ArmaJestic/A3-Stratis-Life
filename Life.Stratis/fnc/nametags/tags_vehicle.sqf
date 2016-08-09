// A_nametags_fnc_tags_vehicle

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_target);
if (undefined(_target)) exitWith {false};

(
	!(_target isKindOf "Man") && {
		_target isKindOf "Car" ||
		_target isKindOf "Tank" ||
		_target isKindOf "Motorcycle" ||
		_target isKindOf "Air" ||
		_target isKindOf "Ship_F" ||
		_target isKindOf "LocalBasicWeaponsBox"
	}
)
