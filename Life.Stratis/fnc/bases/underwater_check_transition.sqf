// A_bases_fnc_underwater_check_transition
// supposed to dictate if a player is entering/leaving a base
// needs reworking

#include "header.h"


private _player = (vehicle player);
private _is_passenger = ((_player != player) && (driver(_player) != player));

//_pz = (_player modelToWorld (_player selectionPosition "neck")) select 2;
private _pz = (positionCameraToWorld[0,0,0] select 2);
//private _tz = ((topmark_floating modelToWorld [0,0,0]) select 2) + 2;
//_bz = ((bottommark_floating modelToWorld [0,0,0]) select 2) + 2;
private _bz = -2;

if ((!A_time_var_loop_exit) && {(_player distance topmark_floating) < 20} && {!A_bases_var_underwater_transition1_active}) exitwith {
	A_bases_var_underwater_transition1_active = true;
	// night if (_pz > _bz), if player is swimming towards base
	// day if (_pz < _bz), if player is swimming away from base
	cutText["","BLACK OUT",0.5];
	private _code = [A_bases_fnc_underbase_setday,A_bases_fnc_underbase_setnight] select (_pz > _bz);
	[1,_code,{
		params[["_code",{},[{}]]];
		call _code;
		cutText["","BLACK IN",3];
		A_bases_var_underwater_transition1_active = false;
	}] call A_frame_fnc_wait;
}; 


if (!A_bases_var_underwater_transition2_active) then {
	private _ds = _player distance bottommark_submerged;
	private _df = _player distance bottommark_floating;

	if (_pz < _bz) then {
		// check if player is swimming away
		// logical error w/ _df, attempted fix
		if (_df < 30) exitwith {
			A_bases_var_underwater_transition2_active = true;
			cutText["", "BLACK OUT", 1];
			
			[1,[_player,_is_passenger],{
				params["_player","_is_passenger"];
				private _pos = (bottommark_floating worldToModel (_player modelToWorld [0,0,0]));
				private _dir = getDir _player;
				if !(_is_passenger) then {
					_player attachTo [bottommark_submerged, _pos];
					detach _player;
				};
				[1,_player,{
					params["_player"];
					_player setDir _dir;
					cutText["","BLACK IN",3];
					A_bases_var_underwater_transition2_active = false;
				}] call A_frame_fnc_wait;
			}] call A_frame_fnc_wait;
		};
		//check if player is swimming toward
		if (_ds < 20) exitwith {
			A_bases_var_underwater_transition2_active = true;
			cutText["","BLACK OUT",1];
			
			[1,[_player,_is_passenger],{
				params["_player","_is_passenger"];
				private _pos = (topmark_submerged worldToModel (_player modelToWorld[0,0,0]));
				private _dir = getDir _player;
				if !(_is_passenger) then {
					_player attachTo [topmark_floating, _pos];
					detach _player;
				};
				[1,_player,{
					params["_player"];
					_player setDir _dir;
					cutText["","BLACK IN",3];
					A_bases_var_underwater_transition2_active = false;
				}] call A_frame_fnc_wait;
			}] call A_frame_fnc_wait;
		};
	};
};

