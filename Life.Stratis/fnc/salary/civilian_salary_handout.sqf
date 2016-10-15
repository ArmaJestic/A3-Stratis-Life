// A_salary_fnc_civilian_salary_handout

#include "..\..\includes\macro.h"


if ([player] call A_player_fnc_get_dead) exitWith {
	player groupChat format[localize "STRS_moneh_paycheckdead"];
};

private _player = player;
private _income = A_main_var_add_civmoney;
private _activecount = 0;

private["_i"];
for [{_i=0}, {_i < (count BuildingsOwnerArray)}, {_i=_i+1}] do {
	private["_check"];
	_check = ( round((random 2)*((BuyAbleBuildingsArray select _i) select 4) ) );
	_income = _income + _check;
};

if (A_main_var_timeinworkplace > 0) then {
	private _workplacepaycheck = (round(A_main_var_add_workplace/180*A_main_var_timeinworkplace));
	_income = _income + _workplacepaycheck;
};

private _gang_income = [_player] call A_gang_fnc_calculate_income;
if (_gang_income > 0) then {
	player groupChat format["%1-%2, because you are in a gang with that controls gang areas, you get extra $%3 income", _player, (name _player), strM(_gang_income)];
	_income = _income + _gang_income;
};

A_main_var_timeinworkplace = 0;
_income = if (UNDEFINED(_income)) then { A_main_var_add_civmoney } else {_income};
_income = if (typeName _income != "SCALAR") then { A_main_var_add_civmoney } else { _income };

_income = round _income;
[player, _income] call A_bank_fnc_transaction;

player groupChat format[localize "STRS_moneh_civmoneyadd", rolestring, strM(_income)];

_taxes = round((call A_shop_menu_fnc_get_paid_taxes));

if ([_player] call A_player_fnc_president) then {
	A_main_var_mayortaxes = A_main_var_mayortaxes + _taxes;
	A_main_var_mayortaxes = round(A_main_var_mayortaxes*(A_main_var_mayortaxpercent/100));
	[player, (A_main_var_mayortaxes + A_main_var_mayorextrapay)] call A_bank_fnc_transaction;
	player groupchat format["As president you get an extra paycheck of $%1. You also got $%2 taxes.", strM(A_main_var_mayorextrapay), strM(A_main_var_mayortaxes)];
	A_main_var_mayortaxes = 0;
}else{
	if (_taxes > 0) then {
		(format["if ([player] call A_player_fnc_president) then {A_main_var_mayortaxes = A_main_var_mayortaxes + %1;};", _taxes]) call A_broadcast_fnc_broadcast;
	};
};

call A_shop_menu_fnc_reset_paid_taxes;