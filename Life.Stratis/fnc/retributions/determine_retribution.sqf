// A_retributions_fnc_determine_retribution

#include "..\..\includes\macro.h"


private["_lost_money"];
_lost_money  = [player, 'money'] call A_inventory_fnc_get_item_amount;

_default_comp = 20000;
if (undefined(_lost_money) || typeName _lost_money != "SCALAR" || _lost_money < _default_comp) then {
	_lost_money = _default_comp
}else{ if ( _lost_money <= 100000) then {
	_lost_money = round( _lost_money * 0.75);
} 
else { if (_lost_money > 100000 && _lost_money <= 250000) then {
	_lost_money = round( _lost_money * 0.50);
}else{ if (_lost_money > 250000 && _lost_money <= 500000) then {
	_lost_money = round( _lost_money * 0.25);
}else{ if (_lost_money > 500000 && _lost_money <= 1000000) then {
	_lost_money = round( _lost_money * 0.10);
}else{ if (_lost_money > 1000000) then {
	_lost_money = _default_comp;
};};};};};};

_lost_money
