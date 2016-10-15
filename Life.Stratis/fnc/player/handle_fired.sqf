// A_player_fnc_handle_fired

#include "header.h"


params["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile"];

if ([_unit] call A_player_fnc_in_safe_zone) exitwith {
	deleteVehicle _projectile;
};

if (_projectile isKindOf "PipeBombBase") then {
	[_projectile] call A_mine_fnc_explosive_wait_despawn;
};

if (_weapon  == "hgun_P07_snds_F") then {
	[_unit] call A_stun_fnc_gun_sound;		
};

// temp disabled
//_this spawn A_other_fnc_smoke;