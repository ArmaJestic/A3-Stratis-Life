// A_interaction_fnc_mobile_send

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_interaction_fnc_mobile_send %1", _this];
ARGV(0,_player);
ARGV(1,_target);
ARGV(2,_text);

if (not([_player] call A_player_fnc_human)) exitWith {};
if (not([_target] call A_player_fnc_human)) exitWith {};
if (_player != player) exitWith {};

if (undefined(_text)) exitWith {};
if (typeName _text != "STRING") exitWith {};

if (_text == "" || {_text == A_mobile_menu_var_default_text}) exitWith {
	player groupChat format["You cannot send an empty message"];
};

private["_max_size"];
_max_size = A_mobile_menu_var_max_text;
if (([_text] call A_misc_fnc_strlen) > _max_size) then {
	_text = [_text, 0, 139] call A_misc_fnc_substr;
	player groupChat format["Your text message was truncated to %1 characters", _max_size];
};

private["_money", "_cost"];
_money  = [player, 'money'] call A_inventory_fnc_get_item_amount;
_cost = INV_smscost;

if (_money < _cost) exitWith {
	player groupChat format["Text messages cost %1, you do not have enough money on you.", strM(INV_smscost)];
};

[_player, 'money', -(_cost)] call A_inventory_fnc_add_item;

if (not(([_target, "handy"] call A_inventory_fnc_get_item_amount) > 0)) exitWith {
	player groupChat format["%1-%2 does not have a mobile phone, your text message bounced", _target, (name _target)];
};

player groupChat format["You sent a text message to %1-%2 for $%3", _target, (name _target), strM(_cost)];

private["_message"];
_message = format["%1", _text];
format['[%1, %2, toString(%3)] spawn A_interaction_fnc_mobile_receive;', _target, _player, toArray(_message)] call broadcast;
