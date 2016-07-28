// A_player_fnc_handle_damage

#include "..\..\includes\macro.h"


//player groupChat format["A_player_fnc_handle_damage %1", _this];
ARGV(0,_unit);
ARGV(1,_select);
ARGV(2,_damage);
ARGV(3,_source);
ARGV(4,_projectile);


private["_distance"];
_distance = 0;

/*
if( ((_unit distance getmarkerpos "respawn_west" < 100))  || 
	((_unit distance getmarkerpos "respawn_east" < 100)) || 
	((_unit distance getmarkerpos "respawn_guerrila" < 100)) || 
	(_unit distance getmarkerpos "respawn_civilian" < 100)
	) exitWith {null};
*/

private["_exit"];
_exit = false;

private["_nvcls"];
_nvcls = nearestObjects [getpos _unit, ["LandVehicle"], 5];

private["_reduce"];
_reduce = false;

private["_source_cop", "_weapon"];
_source_cop = ([_source] call A_player_fnc_blufor);
_weapon = currentWeapon _source;

if (toLower(_weapon) == toLower("hgun_P07_snds_F") && _source_cop) then {
	_reduce = true;
	_distance = _source distance _unit;
	_veh = vehicle _unit;
	_inveh = ((_veh iskindof "Quadbike_01_base_F"));
	[_unit, _source, _distance, _select, _damage, _veh, _inveh] call A_stun_fnc_using_weapon;
};

if (_reduce) then {
	_damage = _damage * 0.25;
};
	
if (not(alive _unit)) then {
	[_shooter, _unit] spawn A_retributions_fnc_victim;
};

_damage
