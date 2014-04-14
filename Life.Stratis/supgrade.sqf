#include "Awesome\Functions\macro.h"

private["_action", "_item"];
_action = _this select 0;
_item = _this select 1;
//if (_action != "use") exitWith {};
[player, (vehicle player), _item] call vehicle_item_speed_upgrade;