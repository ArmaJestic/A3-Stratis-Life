// A_retributions_fnc_punished_logic

#include "header.h"


private ["_damages", "_fees", "_message", "_type_str"];

_type = _this select 0;
_euid = _this select 1;
_damages = _this select 2;
_killer_name = (name player);

[_euid] call A_retributions_fnc_remove_victim;
[] call A_retributions_fnc_fill_retributions;


_fees = [_damages] call A_retributions_fnc_calculate_fees;
_type_str = [_type] call A_retributions_fnc_kill_type_2_str;

_punish_money = _damages + _fees;
[player, _punish_money] call A_money_fnc_lose_money;

if (_type == "ktk") then {
	_message = format["%1 was set ablaze as punishment for %2", _killer_name, _type_str];
	format[' server globalChat "%1"; ', _message] call A_broadcast_fnc_broadcast;
	[] call A_retributions_fnc_setablaze_player;	
};

if (_fees > 0) then {
	_message = format["%1 paid additional $%2 in criminal fees, for %3", _killer_name, _fees, _type_str];
	format[' server globalChat "%1"; ', _message] call A_broadcast_fnc_broadcast;
};

