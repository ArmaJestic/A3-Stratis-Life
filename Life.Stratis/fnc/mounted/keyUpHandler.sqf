// A_mounted_fnc_keyUpHandler

#include "header.h"


//player groupChat format["A_mounted_fnc_keyUpHandler %1", _this];
ARGV(1,_data);
ARGV(0,_this);

ARGV(0,_display);
ARGV(1,_key);
ARGV(2,_shift);
ARGV(3,_control);
ARGV(4,_alt);

private["_player", "_vehicle", "_slot_id"];

_player = _data select 0;
_vehicle = _data select 1;
_slot_id = _data select 2;
_blocked_keys = _data select 3;

_data = [_player, _vehicle, _slot_id];
	
if (_key in _blocked_keys) exitWith {
	true
};

if (_key in A_mounted_var_diallowed_keys) exitWith {
	true
};

false
