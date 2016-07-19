#include "Awesome\Functions\macro.h"

// Drugs Scripts
// drugs.sqf


_art = _this select 0;

if (_art == "init") then {
	INV_drogenusesperre = 0;
	INV_drogen_usesperre = FALSE;
	INV_DrogenCounter = 0;
};

if (_art == "use") then {
	_item   = _this select 1;
	_anzahl = _this select 2;
	if (INV_drogenusesperre == 1) exitWith {player groupChat localize "STRS_inv_item_druguse_toomany";};
	if (INV_drogen_usesperre) then {INV_drogenusesperre = 1;};
	INV_DrogenCounter =  INV_DrogenCounter + _anzahl;
	[player, _item, -(_anzahl)] call A_inventory_fnc_add_item;
	_endeZeit = time + 60 + (_anzahl * 10);
	
	private["_player", "_duration"];
	_player = player;
	_duration = 60 + (_anzahl * 10);

	if (_item == "lsd") then {
		[_player, _duration] call A_drug_fnc_lsd_effects;
	};

	if (_item == "Cocaine") then {
		[_player, _duration] call A_drug_fnc_cocaine_effects;
	};

	if (_item == "marijuana") then {
		[_player, _duration] call A_drug_fnc_marijuana_effects;
	};
	
	if (_item == "heroin") then {
		[_player, _duration] call A_drug_fnc_heroin_effects;
	};

	player groupChat localize "STRS_inv_item_druguse_ende";
	INV_drogenusesperre = 0;
	INV_DrogenCounter =  INV_DrogenCounter - _anzahl;
};


