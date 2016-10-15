// A_shop_menu_fnc_buy_gear_item

#include "header.h"


ARGV(0,_data);
ARGV(1,_function);

if (UNDEFINED(_data)) exitWith {null};
if (typeName _data != "ARRAY") exitWith {null};

if (UNDEFINED(_function)) exitWith {null};
if (typeName _function != "CODE") exitWith {null};

private ["_type", "_amount", "_item", "_total_due", "_item_name", "_class", "_crate", "_in_hands"];

_amount = _data select INDEX_BUY_AMOUNT;
_item_name = _data select INDEX_BUY_NAME;
_class = _data select INDEX_BUY_CLASS;
_crate = objectFromNetId(_data select INDEX_BUY_CRATE_NETID);
_total_due = [(_data select INDEX_BUY_TOTAL_DUE)] call A_encoding_fnc_decode_number;;
_type = _data select INDEX_BUY_TYPE;
_in_hands = _data select INDEX_BUY_IN_HANDS;

if (_in_hands) then {
	call A_shop_menu_fnc_play_animation;
};

[_class, _amount, _crate, _in_hands] spawn _function;
	
player groupChat format["You bought %1 %2 for $%3", _amount, _item_name, strM(_total_due)];
