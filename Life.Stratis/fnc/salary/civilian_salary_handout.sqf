// A_salary_fnc_civilian_salary_handout

#include "../../includes/macro.h"


if (isblu) exitWith {null};
if ([player] call A_player_fnc_get_dead) exitWith {
	player groupChat format[localize "STRS_moneh_paycheckdead"];
};

private["_player"];
_player = player;

private["_income", "_activecount"];
_income = add_civmoney;

_activecount = 0;

private["_i"];
for [{_i=0}, {_i < (count BuildingsOwnerArray)}, {_i=_i+1}] do {
	private["_check"];
	_check = ( round((random 2)*((BuyAbleBuildingsArray select _i) select 4) ) );
	_income = _income + _check;
};

if (timeinworkplace > 0) then {
	private["_workplacepaycheck"];
	_workplacepaycheck = (round(add_workplace/180*timeinworkplace));
	_income = _income + _workplacepaycheck;
};

private["_gang_income"];
_gang_income = [_player] call A_gang_fnc_calculate_income;
if (_gang_income > 0) then {
	player groupChat format["%1-%2, because you are in a gang with that controls gang areas, you get extra $%3 income", _player, (name _player), strM(_gang_income)];
	_income = _income + _gang_income;
};

timeinworkplace = 0;
_income = if (undefined(_income)) then { add_civmoney } else {_income};
_income = if (typeName _income != "SCALAR") then { add_civmoney } else { _income };

_income = round _income;
[player, _income] call A_bank_fnc_transaction;

player groupChat format[localize "STRS_moneh_civmoneyadd", rolestring, strM(_income)];

_taxes = round((call A_shop_menu_fnc_get_paid_taxes));

if ([_player] call A_player_fnc_president) then {
	MayorTaxes = MayorTaxes + _taxes;
	MayorTaxes = round(MayorTaxes*(MayorTaxPercent/100));
	[player, (MayorTaxes + MayorExtraPay)] call A_bank_fnc_transaction;
	player groupchat format["As president you get an extra paycheck of $%1. You also got $%2 taxes.", strM(MayorExtraPay), strM(MayorTaxes)];
	MayorTaxes = 0;
}
else {if (_taxes > 0) then {
	(format["if ([player] call A_player_fnc_president) then {MayorTaxes = MayorTaxes + %1;};", _taxes]) call broadcast;
};};

call A_shop_menu_fnc_reset_paid_taxes;
