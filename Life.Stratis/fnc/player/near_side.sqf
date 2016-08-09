// A_player_fnc_near_side

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_side);
ARGV(2,_distance);

if (!([_player] call A_player_fnc_human)) exitWith {0};

if (undefined(_side)) exitWith {0};
if (typeName _side != "SIDE") exitWith {0};
if (undefined(_distance)) exitWith {0};
if (typeName _distance != "SCALAR") exitWith {0};


private["_near_vehicles"];
_near_vehicles = nearestobjects[(getpos _player), ["LandVehicle", "Air"], _distance];

private["_near_players"];
_near_players = nearestobjects[(getpos _player), ["Man"], _distance];

//add the vehicle crew members to the list of player nears
{
	private["_vehicle", "_crew"];
	_vehicle = _x;
	_crew =  crew _vehicle;
	if (count(_crew) > 0) then {
		_near_players = _near_players + _crew;
	};
} forEach _near_vehicles;

//check the players that are near
private["_near_side_players"];
_near_side_players = [];
{
	private["_cplayer", "_cside"];
	_cplayer = _x;
	_cside = ([_cplayer] call A_player_fnc_side); 
	if (([_cplayer] call A_player_fnc_human) && _cside == _side) then {
		if (!(_cplayer == _player)) then {
			_near_side_players = _near_side_players + [_cplayer];
		};
	};
} 
forEach (_near_players);

_near_side_players
