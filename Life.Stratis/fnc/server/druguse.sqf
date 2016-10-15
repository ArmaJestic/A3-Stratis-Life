// A_server_fnc_druguse

#include "header.h"


{
	private _obj = _x;
	private _list = [_obj, "druglist"] call A_object_fnc_getVariable;

	if(DEFINED(_list)) then {
		{
			private _num = (_x select 1) - 1;
			if (_num == 0) then {
				_list set[_forEachIndex, null]; 
			}else{
				_x set[1, _num];
			//	_list set[_forEachIndex, _x];
			};
		}forEach _list;
		
		_list = _list - [null];
		
		if((count _list) > 0)then{
			[_obj, "druglist", _list, true] call A_object_fnc_setVariable;
		};
	};
} forEach A_bank_var_drugsellarray;