// A_shop_menu_fnc_update_drug_list

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_shop_id);
private["_shop_cache"];
_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (undefined(_shop_cache)) exitWith {null};

private["_data"];
ARGV(1,_data);
if (undefined(_data)) exitWith {null};

private["_list", "_uid", "_profit"];
_list = [_shop_id] call A_shop_menu_fnc_get_drug_list;

//if player uid is already in the list, just update it
_uid = _data select A_shop_menu_var_drug_list_player_uid;
_profit = _data select A_shop_menu_var_drug_list_profit;
private["_inList"];
_inList = false;
{
	private["_cdata", "_cuid", "_cprofit"];
	_cdata = _x;
	_cuid = _cdata select A_shop_menu_var_drug_list_player_uid;
	_cprofit = _cdata select A_shop_menu_var_drug_list_profit;
	if (_cuid == _uid) exitWith {
		_cdata set [A_shop_menu_var_drug_list_profit, (_cprofit + _profit)];
		_inList = true;
	};
} foreach _list;

if (not(_inList)) then {
	_list = _list + [_data];
};

[_shop_id, _list] call A_shop_menu_fnc_set_drug_list;

_list
