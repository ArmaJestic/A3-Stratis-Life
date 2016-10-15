// A_economy_menu_fnc_modify_tax

#include "header.h"


params["_player","_tax_id","_tax_value"];

{
	private _tax_data = _x;
	private _ctax_id = _tax_data select DLG_ECON_TAX_INDEX_TYPE;
	if (_ctax_id == _tax_id) then {
		_tax_data set[DLG_ECON_TAX_INDEX_VALUE, _tax_value];
	};
} forEach economy_tax_data;
publicVariable "economy_tax_data";

[[_player], "A_economy_menu_fnc_modify_tax_announce", true] call BIS_fnc_MP;