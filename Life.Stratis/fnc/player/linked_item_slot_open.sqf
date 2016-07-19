// A_player_fnc_linked_item_slot_open

#include "../../includes/macro.h"


//player groupChat format["A_player_fnc_linked_item_slot_open %1", _this];
ARGV(0,_player);
ARGV(1,_item_id);

if (not([_player] call A_player_fnc_exists)) exitWith{false};
if (not([_item_id] call A_config_fnc_class_item)) exitWith {false};

private["_assigned_items"];
_assigned_items = [(assignedItems _player)] call A_misc_fnc_toLowerArray;

not(toLower(_item_id) in _assigned_items)
