// A_lotto_menu_fnc_menu_create

#include "header.h"


ARGV(0,_player);
ARGV(1,_lotto_id);

if (!([_player] call A_player_fnc_human)) exitWith{};
if (UNDEFINED(_lotto_id)) exitWith {};
if (typeName _lotto_id != "SCALAR") exitWith {};

private["_list"];
_list = [] call A_lotto_menu_fnc_menu_setup;


private["_lotto"];
_lotto = [_lotto_id] call A_lotto_menu_fnc_lookup_id;

if (UNDEFINED(_lotto)) exitWith {};

private["_tickets"];
_tickets = _lotto select DLLG_LOTTO_DATA_INDEX_TICKETS;

{if (true) then {
	private["_ticket_id", "_ticket_data"];
	_ticket_id = _x;
	_ticket_data = [_ticket_id] call A_lotto_menu_fnc_ticket_lookup_id;
	
	private["_ticket_name"];
	_ticket_name = _ticket_data  select DLLG_LOTTO_TICKET_INDEX_NAME;
	
	private["_index"];
	_index = lbAdd [lotto_ticket_type_field_idc, format["%1", _ticket_name]];
	lbSetData [lotto_ticket_type_field_idc, _index, _ticket_id];
	
};} forEach _tickets;

lbSetCurSel[lotto_ticket_type_field_idc, 0];
buttonSetAction [lotto_buy_button_idc, format['[%1, lbData[lotto_ticket_type_field_idc, (lbCurSel lotto_ticket_type_field_idc)]] call A_lotto_menu_fnc_interact_lotto_play', _player]];

lbSetCurSel [1, 0];
