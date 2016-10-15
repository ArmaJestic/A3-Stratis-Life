// A_bases_fnc_oil_derrick_barrel_update

#include "header.h"


params[["_barrel",objNull,[objNull]],["_amount",0,[0]]];

if (isNull _barrel) exitWith {};
if (_amount < 0) exitWith {};
if !([_barrel,"isPumpBarrel",false] call A_object_fnc_getVariable) exitWith {};

private _label_template = [_barrel,"label_template",""] call A_object_fnc_getVariable;
[_barrel,"label",format[_label_template,_amount], true] call A_object_fnc_setVariable;
[_barrel,"amount",_amount,true] call A_object_fnc_setVariable;