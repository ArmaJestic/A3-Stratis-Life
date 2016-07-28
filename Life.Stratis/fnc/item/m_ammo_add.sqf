// A_item_fnc_m_ammo_add

#include "..\..\includes\macro.h"


private ["_veh", "_mag"];
_veh = _this select 0;
_mag = _this select 1;

if (_veh isKindOf "M252") then {
	switch _mag do {
		case "HE":
		{
			_veh addMagazine "8Rnd_81mmHE_M252";
		};
		case "WP":
		{
			_veh addMagazine "8Rnd_81mmWP_M252";
		};
		case "IL":
		{
			_veh addMagazine "8Rnd_81mmILLUM_M252";
		};
	};
};

if (_veh isKindOf "2b14_82mm") then {
	switch _mag do {
		case "HE":
		{
			_veh addMagazine "8Rnd_82mmHE_2B14";
		};
		case "WP":
		{
			_veh addMagazine "8Rnd_82mmWP_2B14";
		};
		case "IL":
		{
			_veh addMagazine "8Rnd_82mmILLUM_2B14";
		};
	};	
};
