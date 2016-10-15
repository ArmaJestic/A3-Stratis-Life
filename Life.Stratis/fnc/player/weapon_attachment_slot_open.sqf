// A_player_fnc_weapon_attachment_slot_open

#include "header.h"


ARGV(0,_player);
ARGV(1,_item_id);

if (!([_player] call A_player_fnc_exists)) exitWith {_empty_result};
if (UNDEFINED(_item_id)) exitWith {_empty_result};
if (typeName _item_id != "STRING") exitWith {_empty_result};


private["_weapons", "_i", "_empty_compatible_weapon"];
_empty_compatible_weapon = "";
_weapons = [_player] call A_player_fnc_weapons;
_weapons = _weapons - [""];

_i = 0;
while { _i < count(_weapons) } do {
	if (true) then {
		private["_weapon_id"];
		_weapon_id = _weapons select _i;
		
		private["_compatible_attachments", "_attachments"];
		_attachments = [_player, _weapon_id] call A_player_fnc_weapon_attachments;
		_compatible_attachments = [_weapon_id] call A_weapon_fnc_compatible_attachments;
		
		private["_j"];
		_j = 0;
		while { _j < count(_attachments) } do {
			private["_id", "_list"];
			_id  = _attachments select _j;
			//player groupChat format["_compatible_attachments = %1", _compatible_attachments];
			_list = _compatible_attachments select _j;
			
			if (_id == "" && toLower(_item_id) in _list) exitWith {
				_empty_compatible_weapon = _weapon_id;
			};
			_j = _j + 1;
		};
		if (_empty_compatible_weapon != "") exitWith {null};
	};
	_i = _i + 1;
};

(_empty_compatible_weapon)
