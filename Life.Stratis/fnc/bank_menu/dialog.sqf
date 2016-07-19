// A_bank_menu_fnc_dialog

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

 _this spawn {
disableSerialization;
ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {null};
if (_player != player) exitWith {null};

if (A_bank_menu_var_recently_robbed_bank)  exitWith {
	player groupChat format ["You robbed the bank a few minutes ago. You can not use it for %1 minutes after you robbed it.", strM(recently_robbed_bank_amount)];
};

if (not(createDialog "bank_menu")) exitWith {
	player groupChat format["ERROR: Could not create bank menu dialog"];
};

private["_list"];
_list = [] call A_bank_menu_fnc_setup;
[_player] spawn A_bank_menu_fnc_loop;

private["_my_index"];
_my_index = 0;

{if(true)then {
	private["_variable_name", "_variable_value"];
	_variable_name = _x;
	_variable_value = missionNamespace getVariable [_variable_name, null];
	if(not([_variable_value] call A_player_fnc_exists)) exitWith {};
	
	private["_index"];
	_index = _list lbAdd (format["%1 - (%2)", (_variable_name), (name _variable_value)]);
	lbSetData [(ctrlIDC _list), _index, _variable_name];
	lbSetValue [(ctrlIDC _list), _index, _variable_name];
	
	if (_variable_value == _player) then {
		_my_index = _index;
	};
}} forEach playerstringarray;

if (_my_index >= 0) then {
	_list lbSetCurSel _my_index;
};

//Deposit button
buttonSetAction [
bank_menu_button_deposit_idc,
(
	'	private["_variable_name", "_amount"];' +
	'	_variable_name  = (lbData [bank_menu_destination_field_idc, lbCurSel bank_menu_destination_field_idc]);' +
	'	_amount = ([ctrlText bank_menu_amount_field_idc] call A_misc_fnc_parse_number);' +
	'	[' + str(_player) + ', (missionNamespace getVariable _variable_name), _amount] call A_interaction_fnc_deposit;'+
	'closedialog 0;'
)];

//withdraw button
buttonSetAction [
bank_menu_button_withdraw_idc, 
(
	'	private["_amount"];' +
	'	_amount = ([ctrlText bank_menu_amount_field_idc] call A_misc_fnc_parse_number);' +
	'	[' + str(_player) + ', _amount] call A_interaction_fnc_withdraw;'+
	'closedialog 0;'
)];


};
