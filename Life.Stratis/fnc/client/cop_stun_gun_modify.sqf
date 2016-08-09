// A_client_fnc_cop_stun_gun_modify

#include "..\..\includes\macro.h"


if (!isblu) exitWith {null};
if((player ammo (currentWeapon player)) <= 0) exitWith {null};
if (!(alive player)) exitWith {null};

if ((((currentWeapon player) == "M9" || (currentWeapon player) == "M9SD")) && ((currentMagazine player) == ("15Rnd_9x19_M9SD"))) then {	
	_magazines = magazines player;
	_magazines_count = {_x == "15Rnd_9x19_M9SD"} count (_magazines);
	_ammo = player ammo (currentWeapon player);
			
	if (_ammo > A_main_var_stunshotsmax) then {
		{
			if (_x == "15Rnd_9x19_M9SD") then {
				player removeMagazine _x;
			};
		} forEach _magazines;
					
		for [{_c=0}, {_c < (_magazines_count)}, {_c=_c+1}] do {
			player addMagazine ["15Rnd_9x19_M9SD", A_main_var_stunshotsmax];
		};
	};
};	
