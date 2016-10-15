// A_retributions_fnc_compensate_player

#include "header.h"


_selection = [] call A_retributions_fnc_get_retribution_selection;
if (UNDEFINED(_selection)) exitWith { player groupChat "You have not selected a player to compensate";};
_type = _selection select 0;
_p_data = _selection select 1;
if ( !(_type == "vtk" || _type == "vdm")) exitWith { player groupChat "You can only compensate team-kill or death-match victims";};

_killer_name = (name player);
_victim_name = toString (_p_data select INDEX_VS_NAME);
_victim_fletter = (toArray _victim_name) select 0;
_victim_uid = _p_data select INDEX_VS_UID;
_lost_money = _p_data select INDEX_VS_EUID;
_euid = _p_data select INDEX_VS_EUID;

private ["_message", "_damages", "_fees", "_type_str"];

_damages = _lost_money;
_fees = [_damages] call A_retributions_fnc_calculate_fees;
_type_str = [_type] call A_retributions_fnc_kill_type_2_str;

_message = format["%1 paid $%2 in damages to %3 for %4", _killer_name, _damages, _victim_name, _type_str];
format[' server globalChat "%1"; ', _message] call A_broadcast_fnc_broadcast;

if (_fees > 0) then {
	_message = format["%1 paid additional $%2 in criminal fees, for %3", _killer_name, _fees, _type_str];
	format['server globalChat "%1"; ', _message] call A_broadcast_fnc_broadcast;
};

_compensation_money = _damages + _fees;
[player, _compensation_money] call A_money_fnc_lose_money;

[_euid] call A_retributions_fnc_remove_victim;
[] call A_retributions_fnc_fill_retributions;

format[
'
	_pname = name player;
	_puid = getPlayerUID player;
	_pfletter = (toArray _pname) select 0;
	
	_victim_name = "%1";
	_victim_fletter = %2;
	_victim_uid = "%3";
	_euid = "%4";
	_damages = %5;
	
	if (_victim_uid == _puid && _victim_fletter == _pfletter) then {
		[_euid] call A_retributions_fnc_remove_killer;
		[] call A_retributions_fnc_fill_retributions;
		[_damages] call A_bank_fnc_transaction;
	};
', _victim_name, _victim_fletter, _victim_uid, _euid, _damages] call A_broadcast_fnc_broadcast;
