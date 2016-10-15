// A_stun_fnc_using_weapon

#include "..\..\includes\macro.h"


params["_unit","_shooter","_distance","_selection","_damage","_veh","_inveh"];

if ([_unit] call A_player_fnc_in_safe_zone) exitwith {};

private["_armor"];
_armor = [_unit, "A_item_fnc_stun_armor"] call A_object_fnc_getVariable;

private["_pass"];
_pass = [];
_pass = [_unit, _shooter, _selection, _damage, _armor, _veh, _inveh, _distance];

if (_selection == "") exitWith {};

if (_distance <= 5) then {
	_pass spawn A_stun_fnc_shot_close;
}else{
	if ((_distance <= 15) && (_distance > 5)) then {
		_pass spawn A_stun_fnc_shot_far;			
	};
};
