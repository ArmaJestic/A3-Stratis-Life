// A_shop_menu_fnc_update_drug_list

#include "header.h"


params["_shop_id","_data"];

if (UNDEFINED(_data)) exitWith {null};
private _shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (UNDEFINED(_shop_cache)) exitWith {null};


private _list = [_shop_id] call A_shop_menu_fnc_get_drug_list;

//if player uid is already in the list, just update it
private _uid = _data select INDEX_DRUG_PLAYER_UID;
private _profit = _data select INDEX_DRUG_PROFIT;

private _inList = false;
{
	private _cdata = _x;
	private _cuid = _cdata select INDEX_DRUG_PLAYER_UID;
	private _cprofit = _cdata select INDEX_DRUG_PROFIT;
	if (_cuid == _uid) exitWith {
		_cdata set [INDEX_DRUG_PROFIT, (_cprofit + _profit)];
		_inList = true;
	};
} foreach _list;

if (!(_inList)) then {
	_list = _list + [_data];
};

[_shop_id, _list] call A_shop_menu_fnc_set_drug_list;

_list