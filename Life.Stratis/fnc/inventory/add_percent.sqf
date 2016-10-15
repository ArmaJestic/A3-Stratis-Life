// A_inventory_fnc_add_percent

#include "header.h"


ARGV(0,_worth);
ARGV(1,_percent);

private["_round"];
_round  = true;
if (count _this > 2) then {
	_round = _this select 2
};

private["_result"];
if (_round) then {
	_result  = round (  _worth + ((_worth / 100) * _percent) );
} 
else {
	_result  = (  _worth + ((_worth / 100) * _percent)  );
};
_result
