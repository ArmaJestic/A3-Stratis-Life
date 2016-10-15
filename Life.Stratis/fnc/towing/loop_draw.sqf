// A_towing_fnc_loop_draw

#include "header.h"


private["_player"];
_player = player;


private["_objects"];
_objects = nearestObjects [(getPos _player), ["Air","Ship", "Land"], 20];
{if (true) then {
	private["_vehicle"];
	_vehicle = _x;
	_towing_line = _vehicle getVariable ["towing_line", null];
	if (UNDEFINED(_towing_line)) exitWith {};
	
	private["_towing"];
	_towing = _towing_line getVariable ["towing", null];
	if (UNDEFINED(_towing)) exitWith {};
	if (_towing != _vehicle) exitWith {};
	
	private["_towed"];
	_towed = _towing_line getVariable ["towed", null];
	
	if (UNDEFINED(_towed)) exitWith {};
	if (_towed == _towing) exitWith {};
	
	private["_towed_data", "_towing_data"];
	_towed_data = _towing_line getVariable "towed_data";
	_towing_data = _towing_line getVariable "towing_data";
	
	private["_towing_hitch_offset", "_towed_hitch_offset"];
	_towing_hitch_offset = _towing_data select INDEX_TOWING_HITCH_OFFSET;
	_towed_hitch_offset = _towed_data select INDEX_TOWED_HITCH_OFFSET;
	
	_towing_hitch_offset = [_towing, "RightHand", _towing_hitch_offset] call A_towing_fnc_selection_offset;
	_towed_hitch_offset = [_towed, "RightHand", _towed_hitch_offset] call A_towing_fnc_selection_offset;
	
	
	drawLine3D [(_towing modelToWorld _towing_hitch_offset), (_towed modelToWorld _towed_hitch_offset), [1,0,0,1]];
	

};} forEach _objects;
