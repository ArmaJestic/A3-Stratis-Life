// A_lotto_menu_fnc_ticket_lookup_id

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_ticket_id);
if (undefined(_ticket_id)) exitWith {null};
if (typeName _ticket_id != "STRING") exitWith {null};

private["_ticket_data"];
_ticket_data = null;

{
	private["_cticked_id", "_cticket_data"];
	_cticket_data = _x;
	_cticket_id = _cticket_data select A_lotto_menu_var_ticket_id;
	
	if (_cticket_id == _ticket_id) then {
		_ticket_data = _cticket_data;
	};
	
} forEach A_lotto_menu_var_ticket_data;

_ticket_data
