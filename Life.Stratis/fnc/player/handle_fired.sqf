// A_player_fnc_handle_fired

#include "..\..\includes\macro.h"


//player groupChat format["A_player_fnc_handle_fired %1", _this];
ARGV(0,_unit);
ARGV(1,_weapon);
ARGV(2,_muzzle);
ARGV(3,_mode);
ARGV(4,_ammo);
ARGV(5,_magazine);
ARGV(6,_projectile);

if (_unit distance (getmarkerpos "respawn_west") < 100) exitwith {
	deletevehicle _projectile;
	if (A_main_var_firestrikes == 0) exitwith {
		[player] call A_player_fnc_reset_gear;
		A_main_var_firestrikes = 3;
	};
	A_main_var_firestrikes = A_main_var_firestrikes - 1;
	format['hint "WARNING %1: DO NOT FIRE INSIDE THE COPBASE! %2/%3 chances left.";', name _unit, A_main_var_firestrikes, A_main_var_totalstrikes] call A_broadcast_fnc_broadcast;
};

if (((_unit distance (getmarkerpos "respawn_civilian")) < 130) ) exitwith {
	deleteVehicle _projectile;
	if (A_main_var_firestrikes == 0) exitwith {
		[player] call A_player_fnc_reset_gear;
		A_main_var_firestrikes = 3;
	};
	
	A_main_var_firestrikes = A_main_var_firestrikes - 1;
	format['hint "WARNING %1: DO NOT FIRE INSIDE THE CIVILIAN SPAWN! %2/%3 chances left.";', name _unit, A_main_var_firestrikes, A_main_var_totalstrikes] call A_broadcast_fnc_broadcast;
};

if ((_unit distance (getmarkerpos "respawn_east")) < 100) exitwith {
	deletevehicle _projectile;
};

if ((_unit distance (getmarkerpos "respawn_guerrila")) < 100 ) exitwith {
	deletevehicle _projectile;
};

if (_projectile isKindOf "PipeBombBase") then {
	[_projectile] call A_mine_fnc_explosive_wait_despawn;
};

if (_weapon  == "hgun_P07_snds_F") then {
	[_unit] call A_stun_fnc_gun_sound;		
};

//[_this, _projectile] execVM "Awesome\Scripts\A_other_fnc_smoke.sqf";
