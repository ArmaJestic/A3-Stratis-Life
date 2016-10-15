// A_mounted_fnc_board_slot

#include "header.h"


ARGV(0,_player);
ARGV(1,_vehicle);
ARGV(2,_slot_id);

private["_class", "_slot_entry"];

_class = typeOf _vehicle;

_slot_entry = [_class, _slot_id] call A_mounted_fnc_lookup_class_slot;
if (UNDEFINED(_slot_entry)) exitWith {null};

private["_offset", "_heading", "_blocked_actions", "_blocked_keys", "_default_action"];
_offset = ((_slot_entry select INDEX_SLOT_OFFSET) select INDEX_OFFSET_DATA);
_heading = ((_slot_entry select INDEX_SLOT_HEADING) select INDEX_HEADING_DATA);
_blocked_actions = (_slot_entry select INDEX_SLOT_BLOCKED_ACTIONS);
_blocked_keys = [_blocked_actions] call A_mounted_fnc_keysForActions;
_default_action = _slot_entry select INDEX_SLOT_DEFAULT_ACTION;
_direction_min = _slot_entry select INDEX_SLOT_DIRECTION_MIN;
_direction_max = _slot_entry select INDEX_SLOT_DIRECTION_MAX;
_pitch_min = _slot_entry select INDEX_SLOT_PITCH_MIN;
_pitch_max = _slot_entry select INDEX_SLOT_PITCH_MAX;


player groupChat format["_blocked_keys = %1", _blocked_keys];
[_player, _vehicle, _offset] call A_mounted_fnc_attach;
[_player, _heading] call A_mounted_fnc_set_heading;


[_player, _default_action] call A_mounted_fnc_set_stance;

_player groupChat format["You have boarded a mounted slot in this vehicle. Use Control + E to exit"];

[_player, "inMountedSlot", true, true] call A_object_fnc_setVariable;
[_player, "mountedVehicle", _vehicle, true] call A_object_fnc_setVariable;
[_vehicle, _slot_id, _player] call A_mounted_fnc_set_slot_occupant;

cutText["","BLACK OUT",0.1];
[_player, _vehicle, _slot_id, _blocked_keys, _default_action] call A_mounted_fnc_setup_keyDown;
[_player, _vehicle, _slot_id, _blocked_keys, _default_action] call A_mounted_fnc_setup_keyUp;
[_player, _vehicle, _slot_id, _direction_min, _direction_max, _pitch_min, _pitch_max] call A_mounted_fnc_setup_mouseMoving;
[_player, _vehicle, _slot_id] call A_mounted_fnc_slot_wait;
cutText["","BLACK IN",2];