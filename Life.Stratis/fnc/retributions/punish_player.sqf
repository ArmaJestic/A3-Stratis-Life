// A_retributions_fnc_punish_player

#include "..\..\includes\macro.h"


_selection = [] call A_retributions_fnc_get_retribution_selection;
if (undefined(_selection)) exitWith { player groupChat "You have not selected a player to punish";};
_type = _selection select 0;
_p_data = _selection select 1;
if ( !(_type == "ktk" || _type == "kdm")) exitWith { player groupChat "You can only punish team-killer or death-matchers";};

_victim_name = (name player);
_killer_name = toString (_p_data select A_retributions_var_ks_name);
_killer_fletter = (toArray _killer_name) select 0;
_killer_uid = _p_data select A_retributions_var_ks_uid;
_killer_money = _p_data select A_retributions_var_ks_money;
_euid = _p_data select A_retributions_var_ks_euid;

private ["_message", "_damages", "_fees"];

_damages = _killer_money;
_type_str = [_type] call A_retributions_fnc_kill_type_2_str;

[player, _damages] call A_bank_fnc_transaction;
_message = format["%1 collected $%2 in damages from %3, for %4", _victim_name, _damages, _killer_name, _type_str];
format[' server globalChat "%1"; ', _message] call A_broadcast_fnc_broadcast;

[_euid] call A_retributions_fnc_remove_killer;
[] call A_retributions_fnc_fill_retributions;

format[
'
	_pname = name player;
	_puid = getPlayerUID player;
	_pfletter = (toArray _pname) select 0;

	private ["_damages", "_fees"];
	
	_killer_name = (name player);
	_killer_fletter = %1;
	_killer_uid = "%2";
	_euid = "%3";
	_damages = %4;
	_type = "%5";
	
	if (_killer_uid == _puid && _killer_fletter == _pfletter) then {
		[_type, _euid, _damages] call A_retributions_fnc_punished_logic;
	};
', _killer_fletter, _killer_uid, _euid, _damages, _type] call A_broadcast_fnc_broadcast;
