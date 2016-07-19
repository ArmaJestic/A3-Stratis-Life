// A_shop_menu_fnc_get_current_shop_id

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private["_shop_id", "_shopDialog"];

_shopDialog = findDisplay shop_dialog_idd;
if (isNull _shopDialog) exitWith {null};

_shop_id = [player, "current_shop_id"] call A_object_fnc_getVariable;
if (undefined(_shop_id)) exitWith {null};
if (typeName _shop_id != "SCALAR") exitWith {null};
_shop_id
