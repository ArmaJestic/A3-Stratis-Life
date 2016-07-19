// A_shop_menu_fnc_weapon_inherits_from

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_weapon_class);
ARGV(1,_base_class);

private["_config_class"];
_config_class = if (count _this > 2) then { _this select 2; } else { "CfgWeapons" };


if (undefined(_weapon_class)) exitWith { false };
if (undefined(_base_class)) exitWith { false };
if (undefined(_config_class)) exitWith { false };

if (typeName _weapon_class != "STRING") exitWith { false };
if (typename _base_class != "STRING") exitWith { false };

private["_i", "_matches", "_parent_config", "_parent_name"];
_i = 10;
_matches = false;
_parent_config = (configFile >> _config_class >> _weapon_class );
_parent_name = configName(_parent_config);
while { _i > 0 } do {
	if (_parent_name == _base_class) exitWith { _matches = true };
	_parent_config = inheritsFrom(_parent_config);
	_parent_name = configName(_parent_config);
    _i = _i - 1;
};
_matches
