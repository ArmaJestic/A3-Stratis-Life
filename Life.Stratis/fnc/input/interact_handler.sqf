// A_input_fnc_interact_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


private["_ctrl"];
_ctrl = _this select 0;

if (!INV_shortcuts) exitWith {false};
if (A_main_var_keyblock) exitWith {false};
if (dialog ) exitWith {closeDialog 0; false};
if (arrested) exitWith{ false };

private ["_civ", "_handled", "_i"];

//INTERACTIONS WITH PLAYERS, AI, ATM
for [{_i=1}, {_i < 3}, {_i=_i+1}] do {
	if(vehicle player != player) exitWith {false};
	_range = _i;
	_dirV = vectorDir vehicle player;
	_pos = player modelToWorld [0,0,0];
	_posFind = [(_pos select 0)+(_dirV select 0)*_range,(_pos select 1)+(_dirV select 1)*_range,(_pos select 2)+(_dirV select 2)*_range];
	
	_men = nearestobjects [_posFind,["Man", "B_supplyCrate_F", "Box_NATO_Wps_F", "BarrelBase", "Barrels", "Box_NATO_WpsSpecial_F", "Box_East_Wps_F", "Box_East_WpsSpecial_F", "Box_East_Support_F", "Box_NATO_Support_F"], 1] - [player];
	_atms = nearestObjects [_posFind, A_object_var_atm_classes, 2];
	_civ = _men select 0;
	_atm = _atms select 0;

	_handled = [player, _atm] call A_interaction_fnc_atm;
	if (_handled) exitWith {null};
	
	_handled = [player, _civ] call A_interaction_fnc_human;
	if (_handled) exitWith {null};
	
	_handled = [player, _civ] call A_interaction_fnc_ai;
	if (_handled) exitWith {null};
};

if(_handled) exitWith { true };

//INTERACTIONS WITH VEHICLES
private["_player_inside"];
_player_inside = [player, (vehicle player)] call A_mounted_fnc_player_inside;
//player groupChat format["_player_inside = %1", _player_inside];
if (not(_player_inside) && not(_ctrl)) exitWith {
	private ["_vcl"];
	for [{_i=1}, {_i < 3}, {_i=_i+1}] do {
		_range = _i;
		_dirV = vectorDir vehicle player;
		_pos = player modelToWorld [0,0,0];
		_posFind = [(_pos select 0)+(_dirV select 0)*_range,(_pos select 1)+(_dirV select 1)*_range,(_pos select 2)+(_dirV select 2)*_range];
		_vcls    = nearestobjects [_posFind,["LandVehicle", "Air", "ship"], 5];
		_vcl     = _vcls select 0;
		if(not(isnull _vcl)) exitWith {_i = 4};
	};

	if((locked _vcl) == 2) exitWith { false };
	
	private["_entered"];
	_entered = [player, _vcl, false] call A_player_fnc_enter_vehicle;
	
	if (_entered) exitWith {
		 [] spawn {
			A_main_var_keyblock=true; 
			sleep 1;
			A_main_var_keyblock=false;
		};
		true
	};
	false
};

_vcl  = vehicle player;

if(_vcl != player) exitWith {
	if((locked _vcl) == 2) exitWith {
		player groupchat "The vehicle is locked. Disembark by pressing Control + E"; 
		false 
	};
	if(speed _vcl > 30) exitWith {
		player groupchat "The vehicle is moving too fast"; 
		false 
	};
	[player, _vcl, false] call A_player_fnc_exit_vehicle;
	true
};

true
