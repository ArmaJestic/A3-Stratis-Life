// A_inventory_fnc_get_weapon_type

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private ["_Fresult"];
_Fresult = -1;
{
	if (((_x select 2) select 0) == _this) then {
		_Fresult = ((_x select 4) select 0);
	};
}
forEach A_main_var_alllifemissionobjects;
_Fresult
