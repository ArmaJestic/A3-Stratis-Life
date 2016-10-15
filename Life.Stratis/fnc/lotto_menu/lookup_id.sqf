// A_lotto_menu_fnc_lookup_id

#include "header.h"


ARGV(0,_id);

if (UNDEFINED(_id)) exitWith {null};
private["_lotto"];

_lotto = null;

{
	private["_cid", "_clotto"];
	_clotto = _x;
	_cid = _clotto select DLLG_LOTTO_DATA_INDEX_ID;
	if (_cid == _id) then {
		_lotto = _clotto;
	};
} forEach (A_lotto_menu_var_data);

_lotto
