// A_economy_menu_fnc_modify_tax

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_economy_menu_fnc_modify_tax %1", _this];
ARGV(0,_player);
ARGV(1,_tax_id);
ARGV(2,_tax_value);

{
	private["_tax_data", "_ctax_id"];
	_tax_data = _x;
	_ctax_id = _tax_data select A_economy_menu_var_tax_type;
	if (_ctax_id == _tax_id) then {
		_tax_data set [A_economy_menu_var_tax_value, _tax_value];
	};
} forEach economy_tax_data;

publicVariable "economy_tax_data";

[[_player], "A_economy_menu_fnc_modify_tax_announce", true] call BIS_fnc_MP;
