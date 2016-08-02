// A_bombs_fnc_delete

#include "..\..\includes\macro.h"


private["_name", "_id", "_i", "_j", "_actionArr"];
_id = _this;

for [{_i=0}, {_i < (count A_bombs_var_serverbombarray)}, {_i=_i+1}] do {
	if (((A_bombs_var_serverbombarray select _i) select 0) == _id) exitWith {
		A_bombs_var_serverbombarray set [_i, ""];
		A_bombs_var_serverbombarray = A_bombs_var_serverbombarray - [""];
	};
};

for [{_i=0}, {_i < (count A_bombs_var_localbombarray)}, {_i=_i+1}] do {
	if (((A_bombs_var_localbombarray select _i) select 0) == _id) exitWith {
		if (alive(vehicle player)) then {
			_actionArr = ((A_bombs_var_localbombarray select _i) select 3);
			for [{_j=0}, {_j < (count _actionArr)}, {_j=_j+1}] do {
				(vehicle player) removeAction (_actionArr select _j);
			};
		};

		A_bombs_var_localbombarray set [_i, ""];
		A_bombs_var_localbombarray = A_bombs_var_localbombarray - [""];
	};
};
