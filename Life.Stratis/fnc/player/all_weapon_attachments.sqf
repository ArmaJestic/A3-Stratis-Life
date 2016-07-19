// A_player_fnc_all_weapon_attachments

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {[]};

private["_items"];
_items = (primaryWeaponItems _player) + (secondaryWeaponItems _player) + (handgunItems _player) ;

if (undefined(_items)) exitWIth {[]};
if (typeName _items != "ARRAY") exitWith {[]};
([_items] call A_misc_fnc_toLowerArray)
