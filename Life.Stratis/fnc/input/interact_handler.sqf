// A_input_fnc_interact_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


// checking if ctrl key is held (for vehicle interaction)
params["_ctrl"];

if (!A_inv_var_shortcuts) exitWith {false};
if (A_main_var_keyblock) exitWith {false};
if (dialog) exitWith {closeDialog 0; false};
if (arrested) exitWith{false};


private _player_inside = [player, (vehicle player)] call A_mounted_fnc_player_inside;

//INTERACTIONS WITH PLAYERS, AI, ATM
if ((vehicle player == player) && !_player_inside) then {
	private _handled = false;

	for "_i" from 1 to 3 do {
		private _range = _i;
		private _dirV = vectorDir vehicle player;
		private _pos = player modelToWorld [0,0,0];
		private _posFind = [(_pos select 0)+(_dirV select 0)*_range,(_pos select 1)+(_dirV select 1)*_range,(_pos select 2)+(_dirV select 2)*_range];
		
		private _men = nearestobjects [_posFind,["Man", "B_supplyCrate_F", "Box_NATO_Wps_F", "BarrelBase", "Barrels", "Box_NATO_WpsSpecial_F", "Box_East_Wps_F", "Box_East_WpsSpecial_F", "Box_East_Support_F", "Box_NATO_Support_F"], 1] - [player];
		private _atms = nearestObjects [_posFind, A_object_var_atm_classes, 2];
		private _civ = _men select 0;
		private _atm = _atms select 0;
		
		_handled = [player, _atm] call A_interaction_fnc_atm;
		if (_handled) exitWith {};
		
		_handled = [player, _civ] call A_interaction_fnc_human;
		if (_handled) exitWith {};
		
		_handled = [player, _civ] call A_interaction_fnc_ai;
		if (_handled) exitWith {};
	};

	if(_handled) exitWith {true};
};

//INTERACTIONS WITH VEHICLES
if (!_player_inside && !_ctrl) exitWith {
	private _vcl = objNull;
	for "_i" from 1 to 3 do {
		private _range = _i;
		private _dirV = vectorDir vehicle player;
		private _pos = player modelToWorld [0,0,0];
		private _posFind = [(_pos select 0)+(_dirV select 0)*_range,(_pos select 1)+(_dirV select 1)*_range,(_pos select 2)+(_dirV select 2)*_range];
		private _vcls = nearestobjects [_posFind,["LandVehicle", "Air", "ship"], 5];
		_vcl = _vcls select 0;
		if(!(isnull _vcl)) exitWith {};
	};

	if (isNull _vcl) exitwith {false};
	
	if((locked _vcl) == 2) exitWith {false};
	
	private _entered = [player, _vcl, false] call A_player_fnc_enter_vehicle;
	
	if (_entered) then {
		A_main_var_keyblock=true; 
		[1,[],{A_main_var_keyblock=false;}] call A_frame_fnc_wait;
	};
	_entered
};

// exit vehicle check
private _vcl  = vehicle player;
if(_vcl != player) exitWith {
	if((locked _vcl) == 2) exitWith {
		systemChat "The vehicle is locked. Disembark by pressing Control + E"; 
		false 
	};
	if(speed _vcl > 30) exitWith {
		systemChat "The vehicle is moving too fast"; 
		false 
	};
	[player, _vcl, false] call A_player_fnc_exit_vehicle;
	true
};

false