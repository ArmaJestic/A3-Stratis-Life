// A_paint_fnc_r_buy



private ["_x", "_n", "_moneh", "_cost", "_cfg1", "_cfg2"];
_moneh  = [player, 'money'] call A_inventory_fnc_get_item_amount;
_cost	= A_paint_var_cost;

if (_moneh < _cost) exitwith {player groupchat format["Your require $%1 for this", _cost];};

[player, 'money', -(_cost)] call A_inventory_fnc_add_item;

player groupchat format["You Paid $%1 to apply the original paint to your car", _cost];


_cfg1		= getArray (configFile >> "CfgVehicles" >> P_Preview_Class >> "hiddenselections");
_cfg2		= getArray (configFile >> "CfgVehicles" >> P_Preview_Class >> "hiddenselectionstextures");

clearVehicleInit (vehicle player);

_n = 0;
{
	/*
	(vehicle player) setVehicleInit format["liafu = true; this setObjectTexture %1", [_n, _x]];
	processInitCommands;
	*/
	_n = _n + 1;
} forEach _cfg2;
