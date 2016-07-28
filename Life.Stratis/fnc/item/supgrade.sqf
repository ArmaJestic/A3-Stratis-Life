// A_item_fnc_supgrade

#include "..\..\includes\macro.h"


private["_action", "_item"];
_action = _this select 0;
_item = _this select 1;
//if (_action != "use") exitWith {};
[player, (vehicle player), _item] call A_interaction_fnc_vehicle_item_speed_upgrade;
