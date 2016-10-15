// A_player_fnc_all_weapon_attachments

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {[]};

private["_items"];
_items = (primaryWeaponItems _player) + (secondaryWeaponItems _player) + (handgunItems _player) ;

if (UNDEFINED(_items)) exitWIth {[]};
if (typeName _items != "ARRAY") exitWith {[]};
([_items] call A_misc_fnc_toLowerArray)
