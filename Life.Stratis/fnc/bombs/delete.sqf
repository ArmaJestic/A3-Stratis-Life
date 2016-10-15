// A_bombs_fnc_delete

#include "..\..\includes\macro.h"


params["_id"];

{
	if ((_x select 0) == _id) exitwith {
		A_bombs_var_serverbombarray set[_forEachIndex, null];
		A_bombs_var_serverbombarray = A_bombs_var_serverbombarray - [null];
	};
} forEach A_bombs_var_serverbombarray;

{
	if ((_x select 0) == _id) exitWith {
		if (alive(vehicle player)) then {
			private _actionArr = (_x select 3);
			{
				(vehicle player) removeAction _x;
			} forEach _actionArr;
		};
		A_bombs_var_localbombarray set[_forEachIndex,null];
		A_bombs_var_localbombarray = A_bombs_var_localbombarray - [null];
	};
} forEach A_bombs_var_localbombarray;