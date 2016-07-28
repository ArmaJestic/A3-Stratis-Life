// A_effects_fnc_m_effect_wp

#include "..\..\includes\macro.h"


private ["_decal_dir", "_pos_projectile"];

_pos_projectile = _this select 0;

_decal_dir = random 90;

createVehicle [M_smoke, (_pos_projectile), [], 0, "NONE"];

sleep 3;

//format['%1 createVehicle %2', M_smoke, _pos_projectile] call A_broadcast_fnc_broadcast;
//format['%1 createVehicle %2', M_smoke, [(_pos_projectile select 0) + 5*cos (_decal_dir+0),(_pos_projectile select 1) + 5*sin (_decal_dir+0),0]] call A_broadcast_fnc_broadcast;
//format['%1 createVehicle %2', M_smoke, [(_pos_projectile select 0) + 5*cos (_decal_dir+90),(_pos_projectile select 1) + 5*sin (_decal_dir+90),0]] call A_broadcast_fnc_broadcast;
//format['%1 createVehicle %2', M_smoke, [(_pos_projectile select 0) + 5*cos (_decal_dir+180),(_pos_projectile select 1) + 5*sin (_decal_dir+180),0]] call A_broadcast_fnc_broadcast;
//format['%1 createVehicle %2', M_smoke, [(_pos_projectile select 0) + 5*cos (_decal_dir+270),(_pos_projectile select 1) + 5*sin (_decal_dir+270),0]] call A_broadcast_fnc_broadcast;

createVehicle [M_smoke,
[
	(_pos_projectile select 0) + 5*cos (_decal_dir+0),
	(_pos_projectile select 1) + 5*sin (_decal_dir+0),
	0
]
, [], 0, "NONE"];

createVehicle [M_smoke, 
[
	(_pos_projectile select 0) + 5*cos (_decal_dir+90),
	(_pos_projectile select 1) + 5*sin (_decal_dir+90),
	0
]
, [], 0, "NONE"];

createVehicle [M_smoke, 
[
	(_pos_projectile select 0) + 5*cos (_decal_dir+180),
	(_pos_projectile select 1) + 5*sin (_decal_dir+180),
	0
]
, [], 0, "NONE"];

createVehicle [M_smoke, 
[
	(_pos_projectile select 0) + 5*cos (_decal_dir+270),
	(_pos_projectile select 1) + 5*sin (_decal_dir+270),
	0
]
, [], 0, "NONE"];
