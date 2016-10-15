// A_isse_str_fnc_replace

#include "..\..\includes\macro.h"


private["_str", "_strArr", "_search", "_searchArr", "_replace", "_replaceArr", "_re", "_SubStr1", "_SubStr2"];

_str = _this select 0;
_strArr = (_this select 1) call A_isse_str_fnc_strtoarr;
_search = _this select 1;
_searchArr = (_this select 1) call A_isse_str_fnc_strtoarr;
_replace = _this select 2;
_replaceArr = (_this select 2) call A_isse_str_fnc_strtoarr;
_found = [_str, _search] call A_isse_str_fnc_pos;

if (_found > -1) then {
	_SubStr1 = [_str, 0, _found] call A_isse_str_fnc_substring;
	_SubStr2 = [_str, (_found + (count _searchArr)), (count _strArr)] call A_isse_str_fnc_substring;
	_str = format["%1%2%3", _SubStr1, _replace, _SubStr2];
	_str
}else{
	_str
};