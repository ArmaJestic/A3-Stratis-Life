// A_salary_fnc_cop_salary_handout

#include "../../includes/macro.h"


if (not(isblu)) exitWith {null};
private["_player"];
_player = player;

private["_income"];
_income = add_copmoney;

if ("patrol" call A_inventory_fnc_has_license) then {
	_income = _income + 500;
};

if ("response" call A_inventory_fnc_has_license) then {
	_income = _income + 1000;
};

if ("sobr" call A_inventory_fnc_has_license) then {
	_income = _income + 1250;
};

if ("air_support_training" call A_inventory_fnc_has_license) then {
	_income = _income + 1000;
};

if ([_player] call A_player_fnc_chief) then {
	_income = _income + chiefExtraPay;
};

_income = if (undefined(_income)) then { add_copmoney } else {_income};
_income = if (typeName _income != "SCALAR") then { add_copmoney } else { _income };

[_player, (round _income)] call A_bank_fnc_transaction;

player groupChat format[localize "STRS_moneh_copmoneyadd", rolestring, strM((round _income))];
sleep 1;

if([_player] call A_player_fnc_chief)then{
	player groupchat format["As a Police Chief you get an extra paycheck of $%1.", strM(chiefExtraPay)]
};
