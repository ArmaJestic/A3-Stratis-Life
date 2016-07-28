// A_paint_fnc_buy



private ["_x", "_c", "_moneh", "_cost"];

_moneh  = [player, 'money'] call A_inventory_fnc_get_item_amount;
_cost	= A_paint_var_cost;

if (_moneh < _cost) exitwith {player groupchat format["Your require $%1 for this", _cost];};

[player, 'money', -(_cost)] call A_inventory_fnc_add_item;

player groupchat format["You Paid $%1 to apply the paint to your car", _cost];

if ( P_T_Change ) then {
	for [{_c = 0}, {_c < (count A_paint_var_t_p) }, {_c=_c+1}] do {
		_x = A_paint_var_t_p select _c;
		if ( (typeName _x) == "STRING" ) then {
			/*
			(vehicle player) setVehicleInit format["liafu = true; this setObjectTexture %1", [_c, _x]];
			processInitCommands;
			*/
		};
	};
	P_T_Change = false;
};
