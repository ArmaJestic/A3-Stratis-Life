// A_retributions_fnc_fill_retributions

#include "..\..\includes\macro.h"

#define kvlist 5003 

lbClear kvlist;
private ["_damages", "_fees"];

_victims = [player, "victims"] call A_object_fnc_getVariable;
{
	_victim_data = _x;
	_type = _victim_data select A_retributions_var_vs_type;
	_victim_name = toString (_victim_data select A_retributions_var_vs_name);
	_victim_uid = _victim_data select A_retributions_var_vs_uid;
	_lost_money = _victim_data select A_retributions_var_vs_money;
	
	
	_damages = _lost_money;
	_fees = [_damages] call A_retributions_fnc_calculate_fees;

	if (_type == "TK") then {
		_index = lbAdd [kvlist, format ["A_retributions_fnc_victim(TK): %1 (+$%2, +$%3)", _victim_name, _damages, _fees]];
		lbSetData [kvlist, _index, format["%1", ["vtk", _victim_data]]];
		lbSetColor [kvlist, _index, [0, 1, 0, 1]];
	}else{ if ( _type == "DM") then {
		_index = lbAdd [kvlist, format ["A_retributions_fnc_victim(DM): %1 (+$%2, +$%3)", _victim_name, _damages, _fees]];
		lbSetData [kvlist, _index, format["%1", ["vdm", _victim_data]]];
		lbSetColor [kvlist, _index, [0, 1, 0, 1]];
	};};
} foreach _victims;

_killers = [player, "killers"] call A_object_fnc_getVariable;
{
	_killer_data = _x;
	_type = _killer_data select A_retributions_var_ks_type;
	_killer_name = toString (_killer_data select A_retributions_var_ks_name);
	_killer_uid =  _killer_data select A_retributions_var_ks_uid;
	_lost_money = _killer_data select A_retributions_var_ks_money;
	
	if (_type == "TK") then {
		_index = lbAdd [kvlist, format ["Killer(TK): %1 (Set ablaze, -$%2)", _killer_name, _lost_money]];
		lbSetData [kvlist, _index, format["%1", ["ktk", _killer_data]]];
		lbSetColor [kvlist, _index, [1, 0, 0, 1]];
	}else{ if ( _type == "DM") then {
		_index = lbAdd [kvlist, format ["Killer(DM): %1 (-$%2)", _killer_name, _lost_money]];
		lbSetData [kvlist, _index, format["%1", ["kdm", _killer_data]]];
		lbSetColor [kvlist, _index, [1, 0, 0, 1]];
	};};
	
} foreach _killers;
