// A_retributions_fnc_punish_player

#include "header.h"


private _selection = [] call A_retributions_fnc_get_retribution_selection;
if (UNDEFINED(_selection)) exitWith { player groupChat "You have not selected a player to punish";};
_selection params["_type","_p_data"];
if !(_type == "ktk" || _type == "kdm") exitWith { player groupChat "You can only punish team-killer or death-matchers";};

private _victim_name = (name player);
private _killer_name = toString (_p_data select INDEX_KS_NAME);
private _killer_fletter = (toArray _killer_name) select 0;
private _killer_uid = _p_data select INDEX_KS_UID;
private _killer_money = _p_data select INDEX_KS_MONEY;
private _euid = _p_data select INDEX_KS_EUID;
private _damages = _killer_money;
private _type_str = [_type] call A_retributions_fnc_kill_type_2_str;

[player, _damages] call A_bank_fnc_transaction;
private _message = format["%1 collected $%2 in damages from %3, for %4", _victim_name, _damages, _killer_name, _type_str];
format[' server globalChat "%1"; ', _message] call A_broadcast_fnc_broadcast;

[_euid] call A_retributions_fnc_remove_killer;
[] call A_retributions_fnc_fill_retributions;

format['
	private _pname = name player;
	private _puid = getPlayerUID player;
	private _pfletter = (toArray _pname) select 0;
	private _killer_name = (name player);
	private _killer_fletter = %1;
	private _killer_uid = "%2";
	private _euid = "%3";
	private _damages = %4;
	private _type = "%5";
	if (_killer_uid == _puid && _killer_fletter == _pfletter) then {
		[_type, _euid, _damages] call A_retributions_fnc_punished_logic;
	};
', _killer_fletter, _killer_uid, _euid, _damages, _type] call A_broadcast_fnc_broadcast;