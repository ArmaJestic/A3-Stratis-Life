// A_other_fnc_bankrob

#include "..\..\includes\macro.h"


_this = _this select 3;
_art  = _this select 0;
_safe = _this select 1;

if (_art == "ausrauben") then {
	call compile format["local_cash = robpool%1", _safe];

	if(local_cash < 50000)exitwith{player groupchat "this safe has recently been stolen from and is empty"};

	if(!A_bank_var_robenable)exitwith{player groupchat "you are already robbing the bank"};
	if(!(call A_inventory_fnc_iventory_is_armed) and !A_param_var_debug)exitWith{player groupChat localize "STRS_bank_rob_noweapon";};
	A_bank_var_robenable = false;
	call compile format["robpool%1 = 0;publicvariable ""robpool%1"";", _safe];
	player groupChat format[localize "STRS_bank_rob_info", strM(robb_money)];

	format['[0,1,2,["opfer", %1, %2]] execVM "A_other_fnc_bankrob.sqf";', _safe, local_cash] call A_broadcast_fnc_broadcast;

	player playmove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 5;
	waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};

	if (alive player) then {
		[player, 'money', local_cash] call A_inventory_fnc_add_item;
		player groupChat format[localize "STRS_bank_rob_success"];
		[local_cash] spawn Bank_Rob_End_Script;
	};

	A_bank_var_A_bank_var_stolencash = A_bank_var_A_bank_var_stolencash + local_cash;

	A_bank_var_local_usebankpossible = false;
	A_bank_var_robenable = true;
	A_bank_var_A_bank_var_rblock = A_bank_var_A_bank_var_rblock + ((local_cash/50000)*60);
	_A_bank_var_rblock = A_bank_var_rblock;

	sleep 2;

	if(_A_bank_var_rblock != A_bank_var_rblock)exitWith {null};

	for [{A_bank_var_A_bank_var_A_bank_var_A_bank_var_rblock}, {A_bank_var_A_bank_var_A_bank_var_A_bank_var_rblock > -1}, {A_bank_var_A_bank_var_A_bank_var_A_bank_var_rblock=A_bank_var_A_bank_var_A_bank_var_A_bank_var_rblock-1}] do {sleep 1;};

	A_bank_var_local_usebankpossible = true;
	A_bank_var_stolencash = 0;
	A_bank_var_rblock = 0;
};


if (_art == "opfer") then {
	private["_bank_account", "_insurances_inv", "_insurances_stor"];
	_robpool = _this select 2;

	titleText [localize "STRS_bank_rob_titlemsg", "plain"];

	_safe say "Bank_alarm";
	copbase1 say "Bank_alarm";

	sleep 8;

	["Bank", "civilian", _robpool] spawn A_misc_fnc_Isse_AddCrimeLogEntry;
	server globalchat format["The thief stole $%1!", _robpool];

	sleep 4;

	private["_bank_account", "_verlust", "_verlustA", "_verlustB"];
	_bank_account = [player] call A_bank_fnc_get_value;
	_verlust = round(_bank_account*A_bank_var_maxbankrobpercentlost);
	_verlustA = round(_bank_account*A_bank_var_maxbankrobpercentlosta);
	_verlustB = round(_bank_account*A_bank_var_maxbankrobpercentlostb);

	_bank_account = [player] call A_bank_fnc_get_value;
	_insurances_inv = [player, 'bankinsurance'] call A_inventory_fnc_get_item_amount;
	_insurances_stor = [player, 'bankinsurance', 'private_storage'] call A_inventory_fnc_get_storage_amount;
	
	
	if ((_bank_account <= _verlust) and (_bank_account >= 1) and ((_insurances_inv + _insurances_stor) == 0)) exitWith {
		[player, 0] call A_bank_fnc_set_value;	
		player groupChat localize "STRS_bank_rob_allmoneylost";
	};

	//Takes 5 percent from bank account if player has less than 100k (1/24/2012 IsHoOtYoUnOw)
	_bank_account = [player] call A_bank_fnc_get_value;
	if((_bank_account >  _verlust) and (_bank_account <= 99999) and ((_insurances_inv + _insurances_stor) == 0)) exitWith {
		[player, -(_verlust)] call A_bank_fnc_transaction;
		_bank_account = [player] call A_bank_fnc_get_value;
		player groupChat format[localize "STRS_bank_rob_somemoneylost", strM(_verlust), strM(_bank_account)];
	};

	//Takes 10 percent from bank account if player has 100k - 999k (1/24/2012 IsHoOtYoUnOw)	
	_bank_account = [player] call A_bank_fnc_get_value;
	if((_bank_account >  _verlust) and (_bank_account >= 100000) and (_bank_account <= 999999) and ((_insurances_inv + _insurances_stor) == 0)) exitWith {
		[player, -(_verlustA)] call A_bank_fnc_transaction;
		_bank_account = [player] call A_bank_fnc_get_value;
		player groupChat format[localize "STRS_bank_rob_somemoneylost", strM(_verlustA), strM(_bank_account)];
	};

	//Takes 20 percent from bank account if player has 1mil or more (1/24/2012 IsHoOtYoUnOw)
	_bank_account =[player] call A_bank_fnc_get_value;
	if((_bank_account >  _verlust) and (_bank_account >= 1000000) and ((_insurances_inv + _insurances_stor) == 0)) exitWith {
		[player, -(_verlustB)] call A_bank_fnc_transaction;
		_bank_account = [player] call A_bank_fnc_get_value;
		player groupChat format[localize "STRS_bank_rob_somemoneylost", strM(_verlustB), strM(_bank_account)];
	};	

	if (_insurances_inv > 0) exitWith {
		player groupChat localize "STRS_bank_rob_lostnomoney";
		[player, 'bankinsurance', -(1)] call A_inventory_fnc_add_item;
	};
	
	if(_insurances_stor > 0) exitWith {
		player groupChat localize "STRS_bank_rob_lostnomoney";
		[player, 'bankinsurance', -(1), 'private_storage'] call A_inventory_fnc_storage_add_item;
	};
};
