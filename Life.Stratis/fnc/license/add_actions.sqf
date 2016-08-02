// A_license_fnc_add_actions

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_license_fnc_add_actions %1", _this];
if (count A_license_var_actions > 0) exitWith {null};
ARGV(0,_player);
ARGV(1,_vendor);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_vendor)) exitWith {null};
if (typeName _vendor != "OBJECT") exitWith {null};

{
	private["_clicense", "_clicense_id", "_clicense_name", "_clicense_price", "_clicense_vendors"];
	_clicense = _x;
	_cA_license_var_id = _clicense select A_license_var_id;
	_cA_license_var_name = _clicense select A_license_var_name;
	_cA_license_var_price = _clicense select A_license_var_price;
	_cA_license_var_vendors = _clicense select A_license_var_vendors;
	
	if (_vendor in _clicense_vendors) then {
		private["_action_id"];
		_action_id = player addAction [format["Buy %1 ($%2)", _clicense_name, strM(_clicense_price)], A_other_fnc_noscript, 
										format['[%1, "%2"] call A_license_fnc_add;', _player, _clicense_id], 0, false, false, "",
										format['not([%1, "%2"] call A_player_fnc_has_license)', _player, _clicense_id]
										];
		A_license_var_actions = A_license_var_actions + [_action_id];
	};
} forEach A_license_var_INV_Licenses;
