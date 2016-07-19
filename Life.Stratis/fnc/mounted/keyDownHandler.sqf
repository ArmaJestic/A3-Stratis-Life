// A_mounted_fnc_keyDownHandler

#include "../../includes/macro.h"
#include "../../includes/dikcodes.h"


//player groupChat format["_this = %1", _this];
ARGV(1,_data);
ARGV(0,_this);

ARGV(0,_display);
ARGV(1,_key);
ARGV(2,_shift);
ARGV(3,_control);
ARGV(4,_alt);

private["_player", "_vehicle", "_slot_id", "_same_key", "_same_key_time_difference", "_default_stance"];

_player = _data select 0;
_vehicle = _data select 1;
_slot_id = _data select 2;
_blocked_keys = _data select 3;
_default_stance = _data select 4;

_data = [_player, _vehicle, _slot_id];
	
if (_key in _blocked_keys) exitWith {
	true
};

if (_key == DIK_E && _control) then {
	if (speed _vehicle > 30) exitWith {
		player groupChat format["%1-%2, you cannot exit the vehicle. It's moving too fast", _player, (name _player)];
	};
	_data call A_mounted_fnc_unboard_slot;
};

if (_key in (actionKeys "ReloadMagazine")) then {
	reload _player;
};

if (_key in A_mounted_var_passthrough_keys) exitWith {
	false;
};

if (_key in A_mounted_var_diallowed_keys) exitWith {
	true
};

false
