#include "Awesome\Functions\macro.h"

disableSerialization;

private["_art", "_player"];
_player = player;

ARGV(3,_array);
_art   = _array select 0;
_moneh  = [player, 'money'] call A_inventory_fnc_get_item_amount;
_zusatzString = "";

if ((count _array)>1) then {
	_zusatzString = _array select 1;
};


if (_art == "wahlen") then {
	if (!(createDialog "wahldialog")) exitWith {hint "Dialog Error!";};
	
	_DFML = findDisplay -1;
	
	lbClear 1;
	lbClear (_DFML displayCtrl 1);
	
	private["_index"];
	_index = [1] call A_misc_fnc_DialogNotCopsList;
	(_DFML displayCtrl 1) lbSetCurSel _index;
};
