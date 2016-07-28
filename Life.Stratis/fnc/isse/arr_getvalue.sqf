// A_isse_fnc_arr_getvalue

#include "..\..\includes\macro.h"


    private ["_c", "_arr", "_key"];
    _arr = _this select 0;
    _key = _this select 1;
    for [{_c=0}, {_c < (count _arr)}, {_c=_c+1}] do {
        if (((_arr select _c) select 0) == _key) exitWith {
            ((_arr select _c) select 1)
        };
    };
