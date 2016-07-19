// A_shop_menu_fnc_buy_gear_item

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_data);
ARGV(1,_function);

if (undefined(_data)) exitWith {null};
if (typeName _data != "ARRAY") exitWith {null};

if (undefined(_function)) exitWith {null};
if (typeName _function != "CODE") exitWith {null};

private ["_type", "_amount", "_item", "_total_due", "_item_name", "_class", "_crate", "_in_hands"];

_amount = _data select A_shop_menu_var_buy_item_amount;
_item_name = _data select A_shop_menu_var_buy_item_name;
_class = _data select A_shop_menu_var_buy_item_class;
_crate = objectFromNetId(_data select A_shop_menu_var_buy_item_crate_netid);
_total_due = [(_data select A_shop_menu_var_buy_item_total_due)] call A_encoding_fnc_decode_number;;
_type = _data select A_shop_menu_var_buy_item_type;
_in_hands = _data select A_shop_menu_var_buy_item_in_hands;

if (_in_hands) then {
	call A_shop_menu_fnc_play_animation;
};

[_class, _amount, _crate, _in_hands] spawn _function;
	
player groupChat format["You bought %1 %2 for $%3", _amount, _item_name, strM(_total_due)];
