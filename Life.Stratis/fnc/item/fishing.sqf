// A_item_fnc_fishing

#include "..\..\includes\macro.h"


private ["_fishingarray"];

_art = _this select 0;

if(isblu)exitWith {null};

if (_art == "use") then {
	if(A_main_var_working) exitWith {null};

	_item   = _this select 1;
	_anzahl = _this select 2;

	A_main_var_working=true;
	_isInArea=false;

	{
		if (player distance (getMarkerPos ((_x select 0) select 0)) < ((_x select 0) select 1)) then {
			_isInArea = true; 
			_fishingarray = _x
		};
	} forEach A_inv_var_fishingarray;

	_resource = _fishingarray select 1;
	_max      = _fishingarray select 2;
	_infos    = _resource call A_inventory_fnc_get_item_array;
	_name     = (MASTER_ARRAY_ITEM_NAME(_infos));

	if (!_isInArea) exitwith {
		player groupChat "You are not where the fish are.";
		A_main_var_working = false;
	};

	if(_item == "fishingpole") then {
		totalamount=0;
		_max = 3;
		(format ["%1 switchmove ""%2"";", player, "AwopPercMstpSgthWnonDnon_end"]) call A_broadcast_fnc_broadcast;
		for [{_i=0}, {_i < 4}, {_i=_i+1}] do {
			_amount = round (random _max);
			cutText["fishing...","PLAIN DOWN",0.1];

			sleep 1.5;
			player switchmove "normal";

			_avail = floor (A_inventory_var_INV_CarryingCapacity - (call A_inventory_fnc_get_own_weight));

			totalamount = totalamount + _amount;
			if((totalamount*2) >= _avail)exitwith{totalamount = (_avail/2); player groupchat "maximum weight reached"; _i=6;};
			player groupchat format["You got %1 %2.", _amount, _name];
		};
		
		totalamount = (floor (totalamount));
		[player, _resource, totalamount] call A_inventory_fnc_add_item;
	};

	A_main_var_working=false;
};
