// A_lotto_menu_fnc_menu_create

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_lotto_id);

if (not([_player] call A_player_fnc_human)) exitWith{};
if (undefined(_lotto_id)) exitWith {};
if (typeName _lotto_id != "SCALAR") exitWith {};

private["_list"];
_list = [] call A_lotto_menu_fnc_menu_setup;


private["_lotto"];
_lotto = [_lotto_id] call A_lotto_menu_fnc_lookup_id;

if (undefined(_lotto)) exitWith {};

private["_tickets"];
_tickets = _lotto select A_lotto_menu_var_data_tickets;

{if (true) then {
	private["_ticket_id", "_ticket_data"];
	_ticket_id = _x;
	_ticket_data = [_ticket_id] call A_lotto_menu_fnc_ticket_lookup_id;
	
	private["_ticket_name"];
	_ticket_name = _ticket_data  select A_lotto_menu_var_ticket_name;
	
	private["_index"];
	_index = lbAdd [lotto_ticket_type_field_idc, format["%1", _ticket_name]];
	lbSetData [lotto_ticket_type_field_idc, _index, _ticket_id];
	
};} forEach _tickets;

lbSetCurSel[lotto_ticket_type_field_idc, 0];
buttonSetAction [lotto_buy_button_idc, format['[%1, lbData[lotto_ticket_type_field_idc, (lbCurSel lotto_ticket_type_field_idc)]] call A_lotto_menu_fnc_interact_lotto_play', _player]];

lbSetCurSel [1, 0];
