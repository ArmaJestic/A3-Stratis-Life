// A_factory_fnc_validate_dequeue_item

#include "header.h"


ctrlEnable[factory_dequeue_button_idc, false];

if (UNDEFINED(A_factory_var_selected)) exitWith {[]};
private["_factory"];
_factory = A_factory_var_selected;

	
private["_player", "_item", "_index"];	
_player = player;
_index = (lbCurSel factory_dequeue_list_idc);
if (_index < 0 ) exitWith {
	(["You have not selected any item to cancel", ""])
};

_item = (lbData [factory_dequeue_list_idc, _index]);

private["_message1", "_message2", "_dequeue_allowed"];
_message1 = "";
_message2 = "";
_dequeue_allowed = true;

if (_index == 0) then {
	private["_eta_name", "_eta", "_min", "_prod", "_prod_name"];
	_min = 5;
	_eta_name = format["%1eta", _item];
	_eta = missionNamespace getVariable _eta_name;
	
	_prod_name = format["%1prod", _item];
	_prod = missionNamespace getVariable _prod_name;
	if (_eta < _min && _prod > 0) then {
		_message1 = format["Cancel not allowed if production time is less than %1 seconds", _min];
		_dequeue_allowed = false;
	};
};

ctrlEnable[factory_dequeue_button_idc, _dequeue_allowed];
([_message1, _message2])
