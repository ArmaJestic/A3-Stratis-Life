// A_isse_fnc_arr_countmultiple

#include "..\..\includes\macro.h"


    private ["_c", "_Farr", "_Fval", "_Fcount"];
    _Farr   = _this select 0;
    _Fval   = _this select 1;
    _Fcount = 0;
    for [{_c=0}, { _c < (count _Farr)}, {_c=_c+1}] do {
        if ( (typeName (_Farr select _c)) == (typeName _Fval) ) then {
            if ((_Farr select _c) == _Fval) then {
                _Fcount = _Fcount + 1;
                
            };
        };
    };
    _Fcount
