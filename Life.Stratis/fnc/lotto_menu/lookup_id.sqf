// A_lotto_menu_fnc_lookup_id

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_id);

if (undefined(_id)) exitWith {null};
private["_lotto"];

_lotto = null;

{
	private["_cid", "_clotto"];
	_clotto = _x;
	_cid = _clotto select A_lotto_menu_var_data_id;
	if (_cid == _id) then {
		_lotto = _clotto;
	};
} forEach (A_lotto_menu_var_data);

_lotto
