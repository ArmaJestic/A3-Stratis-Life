// A_license_fnc_add_actions

#include "header.h"


//player groupChat format["A_license_fnc_add_actions %1", _this];
if (count A_license_var_actions > 0) exitWith {null};
ARGV(0,_player);
ARGV(1,_vendor);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (UNDEFINED(_vendor)) exitWith {null};
if (typeName _vendor != "OBJECT") exitWith {null};

{
	
	private _clicense = _x;
	private _clicense_id = _clicense select LICENSE_INDEX_ID;
	private _clicense_name = _clicense select LICENSE_INDEX_NAME;
	private _clicense_price = _clicense select LICENSE_INDEX_PRICE;
	private _clicense_vendors = _clicense select LICENSE_INDEX_VENDORS;
	
	private _inVendors = {
			if ((typeName _x) == "STRING") then {
				(_vendor isEqualTo (missionNamespace getVariable[_x, objNull]))
			}else{
				(_vendor isEqualTo _x)
			};
		} count _clicense_vendors;
	if (_inVendors > 0) then {
		private _action_id = player addAction [format["Buy %1 ($%2)", _clicense_name, strM(_clicense_price)], A_actions_fnc_noscript, 
										format['[%1, "%2"] call A_license_fnc_add;', _player, _clicense_id], 0, false, false, "",
										format['!([%1, "%2"] call A_player_fnc_has_license)', _player, _clicense_id]
										];
		A_license_var_actions pushBack _action_id;
	};
	
} forEach A_license_var_licenses;