// A_stun_fnc_using_weapon

#include "..\..\includes\macro.h"


player groupChat format["A_stun_fnc_using_weapon %1", _this];
ARGV(0,_unit);
ARGV(1,_shooter);
ARGV(2,_distance);
ARGV(3,_selection);
ARGV(4,_damage);
ARGV(5,_veh);
ARGV(6,_inveh);

private["_safe_distance"];
_safe_distance = 100;

if (_unit distance getMarkerpos "respawn_west" < _safe_distance) exitWith {};
if (_unit distance getMarkerpos "respawn_east" < _safe_distance) exitWith {};
if (_unit distance getMarkerpos "respawn_guerrila" < _safe_distance) exitWith {};
if (_unit distance getMarkerpos "respawn_civilian" < _safe_distance) exitWith {};

private["_armor"];
_armor = [_unit, "stun_armor"] call A_object_fnc_getVariable;

private["_pass"];
_pass = [];
_pass = [_unit, _shooter, _selection, _damage, _armor, _veh, _inveh, _distance];

if (_selection == "") exitWith {};

if (_distance <= 5) then {
	_pass spawn A_stun_fnc_shot_close;
} else { if ((_distance <= 15) && (_distance > 5)) then {
	_pass spawn A_stun_fnc_shot_far;			
};};
