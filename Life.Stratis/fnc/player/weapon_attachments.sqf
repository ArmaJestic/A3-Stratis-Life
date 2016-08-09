// A_player_fnc_weapon_attachments

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_weapon_id);

private["_empty_result"];

_empty_result = ["","",""];

if (!([_player] call A_player_fnc_exists)) exitWith {_empty_result};
if (undefined(_weapon_id)) exitWith {_empty_result};
if (typeName _weapon_id != "STRING") exitWith {_empty_result};

private["_weapon_type"];
_weapon_type = [_player, _weapon_id] call A_player_fnc_determine_weapon_type;

private["_items"];
_items = _empty_result;
if (_weapon_type == A_player_var_primary_weapon) then {
	_items = (primaryWeaponItems _player);
}else{ if (_weapon_type == A_player_var_secondary_weapon) then {
	_items = (secondaryWeaponItems _player);
}else{ if (_weapon_type == A_player_var_handgun_weapon) then {
	_items = (handgunItems _player);
};};};

private["_i"];
_i = 0;
while { _i < count(_items) } do {
	_items set [_i, toLower(_items select _i)];
	_i = _i + 1;
};

(_items)
