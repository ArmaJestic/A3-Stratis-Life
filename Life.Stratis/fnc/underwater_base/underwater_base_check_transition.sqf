// A_underwater_base_fnc_underwater_base_check_transition

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private["_player", "_is_passenger"];
_player = (vehicle player);
_is_passenger = ((_player != player) && (driver(_player) != player));
private["_pz", "_tz"];
//_pz = (_player modelToWorld (_player selectionPosition "neck")) select 2;
_pz = (positionCameraToWorld [0,0,0] select 2);
_tz = ((topmark_floating modelToWorld [0,0,0]) select 2) + 2;
_bz = ((bottommark_floating modelToWorld [0,0,0]) select 2) + 2;
_bz = -2;

//check if player is swimming toward base
if (_pz > _bz && {!(time_loop_exit) && {((_player distance topmark_floating) < 20) && {!(A_underwater_base_var_transition1_active)}}}) then {
	[_player] spawn {
		if (A_underwater_base_var_transition1_active) exitWith {};
		A_underwater_base_var_transition1_active = true;
		//player groupChat format["Switching to night"];
		titleText ["", "BLACK OUT", 0.5];
		sleep 1;
		ARGV(0,_player);
		call A_underwater_base_fnc_under_base_set_night;
		titleText ["", "BLACK IN", 3];
		A_underwater_base_var_transition1_active = false;
	};
};

//check if player is swimming away from base
if (_pz < _bz && {(time_loop_exit) && {((_player distance topmark_floating) < 20) &&  {!(A_underwater_base_var_transition1_active)}}}) then {
	[_player] spawn {
		if (A_underwater_base_var_transition1_active) exitWith {};
		A_underwater_base_var_transition1_active = true;
		sleep 1;
		//player groupChat format["Switching to day"];
		titleText ["", "BLACK OUT",  0.5];
		sleep 1;
		ARGV(0,_player);
		call A_underwater_base_fnc_under_base_set_day;
		titleText ["", "BLACK IN", 3];
		A_underwater_base_var_transition1_active = false;
	};
};


private["_d1", "_d2"];
_ds = _player distance bottommark_submerged;
_df = _player distance bottommark_floating;

//hintSilent format["ds: %1\ndf: %2", _ds, _df];
//chec if player is siwmming  away
if (_df > 25 && {_df < 30 && {_pz < _bz}}) then {
	[_player,_is_passenger] spawn {
		if (A_underwater_base_var_transition2_active) exitWith {};
		A_underwater_base_var_transition2_active = true;
		//player groupChat format["Exiting base!"];
		titleText ["", "BLACK OUT", 1];
		sleep 1;
		
		ARGV(0,_player);
		ARGV(1,_is_passenger);
		private["_pos", "_dir"];
		_pos = (bottommark_floating worldToModel (_player modelToWorld [0,0,0]));
		_dir = getDir _player;
		player groupChat format["_is_passenger = %1", _is_passenger];
		if (!(_is_passenger)) then {
			_player attachTo [bottommark_submerged, _pos];
			detach _player;
		};
		sleep 1;
		_player setDir _dir;
		titleText ["", "BLACK IN", 3];
		A_underwater_base_var_transition2_active = false;
	};
};

//check if player is swimming toward
if (_ds < 20 && {_pz < _bz}) then {
	[_player,_is_passenger] spawn {
		if (A_underwater_base_var_transition2_active) exitWith {};
		A_underwater_base_var_transition2_active = true;
		//player groupChat format["Entering base!"];
		titleText ["", "BLACK OUT", 1];
		sleep 1;
		
		ARGV(0,_player);
		ARGV(1,_is_passenger);
		private["_pos", "_dir"];
		_pos = (topmark_submerged worldToModel (_player modelToWorld [0,0,0]));
		_dir = getDir _player;
		player groupChat format["_is_passenger = %1", _is_passenger];
		if (!(_is_passenger)) then {
			_player attachTo [topmark_floating, _pos];
			detach _player;
		};
		sleep 1;
		_player setDir _dir;
		titleText ["", "BLACK IN", 3];
		A_underwater_base_var_transition2_active = false;
	};
};
