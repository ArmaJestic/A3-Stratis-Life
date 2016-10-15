// A_player_fnc_handle_damage

#include "header.h"


params["_unit","_select","_damage","_source","_projectile","_hitPartIndex"];

if ([player] call A_player_fnc_in_safe_zone) exitwith {0};

private["_distance","_exit","_nvcls","_reduce","_source_cop","_weapon"];
_distance = 0;
_exit = false;
_nvcls = nearestObjects [getpos _unit, ["LandVehicle"], 5];
_reduce = false;
_source_cop = ([_source] call A_player_fnc_blufor);
_weapon = currentWeapon _source;

if ((_weapon == "hgun_P07_snds_F") && {_source_cop}) then {
	_reduce = true;
	_distance = _source distance _unit;
	_veh = vehicle _unit;
	_inveh = ((_veh iskindof "Quadbike_01_base_F"));
	[_unit, _source, _distance, _select, _damage, _veh, _inveh] call A_stun_fnc_using_weapon;
};

if (_reduce) then {
	_damage = _damage * 0.25;
};
	
if (!(alive _unit)) then {
	// killed handles this... may not be needed
	// but can be used to track who has damaged others
	[_shooter, _unit] spawn A_retributions_fnc_victim;
};

_damage