// A_interaction_fnc_item_process

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_interaction_fnc_item_process %1", _this];
ARGV(0,_player);
ARGV(1,_input_item);
ARGV(2,_output_item);
ARGV(3,_input_amount_required);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_input_item)) exitWith {null};
if (undefined(_output_item)) exitWith {null};
if (undefined(_input_amount_required)) exitWith {null};
if (typeName _input_item != "STRING") exitWith {null};
if (typeName _output_item != "STRING") exitWith {null};
if (typeName _input_amount_required != "SCALAR") exitWith {null};
if (_input_amount_required <= 0) exitWith {null};

private["_input_item_name", "_output_item_name"];
_input_item_name = (MASTER_ARRAY_ITEM_NAME(_input_item));
_output_item_name = (MASTER_ARRAY_ITEM_NAME(_output_item));

if ([_player] call A_player_fnc_blufor) exitWith {
	player groupChat format["%1-%2, only civilians are allowed to process %3", _player, (name _player), _input_item_name];
};

private["_input_amount"];
_input_amount = [_player, _input_item] call A_inventory_fnc_get_item_amount;

if (_input_amount < _input_amount_required) exitWith {
	player groupChat format["%1-%2, you require at least %3 %4 to produce %5 %6", _player, (name _player), _input_amount_required, _input_item_name, 1, _output_item_name];
};

private["_output_amount"];
_output_amount = floor(_input_amount/_input_amount_required);

private["_input_amount_used"];
_input_amount_used = round(_input_amount_required * _output_amount);

[_player, _input_item, -(_input_amount_used)] call A_inventory_fnc_add_item;
[_player, _output_item, _output_amount, ([_player] call A_player_fnc_inventory_name)] call A_inv_fnc_createitem;

player groupChat format["%1-%2, you porcessed %3 %4 into %5 %6", _player, (name _player), _input_amount_used, _input_item_name, _output_amount, _output_item_name];
