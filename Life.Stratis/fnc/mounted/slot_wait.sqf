// A_mounted_fnc_slot_wait

#include "header.h"


_this spawn {
	ARGV(0,_player);
	ARGV(1,_vehicle);
	ARGV(2,_slot_id);
	
	//player groupChat format["Waiting for death"];
	waitUntil { !(alive _player) || !([_player, "inMountedSlot"] call A_object_fnc_getVariable)};

	[_player, "inMountedSlot", false, true] call A_object_fnc_setVariable;
	[_player, "mountedVehicle", nil, true] call A_object_fnc_setVariable;
	
	private["_occupant"];
	_occupant = [_vehicle, _slot_id] call A_mounted_fnc_get_slot_occupant;
	if (_occupant == _player) then {
		[_vehicle, _slot_id, null] call A_mounted_fnc_set_slot_occupant;
	};
	
	[] call A_mounted_fnc_remove_keyDown;
	[] call A_mounted_fnc_remove_keyUp;
	[] call A_mounted_fnc_remove_mouseMoving;
	
	if (alive _player) then {
		private["_class", "_slot_entry"];
		_class = typeOf _vehicle;
		_slot_entry = [_class, _slot_id] call A_mounted_fnc_lookup_class_slot;
		if (!(UNDEFINED(_slot_entry))) then {
			private["_exit"];
			_exit = (_slot_entry select INDEX_SLOT_EXIT) select INDEX_EXIT_DATA;
			[_player, _vehicle, _exit] call A_mounted_fnc_attach;
		};
		
		[_player] spawn { ARGV(0,_player); detach _player;};
		
		cutText["","BLACK OUT",0.1];
		cutText["","BLACK IN",2];
	}else{
		detach _player;
		hideBody _player;
	};
};
