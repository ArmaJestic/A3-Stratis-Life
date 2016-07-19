// A_interaction_fnc_gang_create

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_interaction_fnc_gang_create %1", _this];
ARGV(0,_player);
ARGV(1,_text);
if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_text)) exitWith {null};
if (typeName _text != "STRING") exitWith {null};

//check that player is not in a gang
private["_gang", "_player_uid"];
_player_uid = [_player] call A_gang_fnc_player_uid;
_gang = [_player_uid] call A_gang_fnc_lookup_player_uid;
if (not(undefined(_gang))) exitWith {
	private["_gang_name"];
	_A_gang_var_name = _gang select A_gang_var_name;
	player groupChat format["%1-%2, you are already a member of gang %3", _player, (name _player), _gang_name];
};

//check that there is no other gang with the same name
private["_cgang"];
_cgang = [_text] call A_gang_fnc_lookup_name;
if (not(undefined(_cgang))) exitWith {
	private["_cgang_name"];
	_cA_gang_var_name = _cgang select A_gang_var_name;
	player groupChat format["%1-%2, there is already a gang named %3", _player, (name _player), _cgang_name];
};


//check that the gang meets the naming requirements
private["_text_length"];
_text_length = [_text] call A_misc_fnc_strlen;
player groupChat format["_text_length = %1", _text_length];
private["_max_length", "_min_length"];
_max_length = 30;
_min_length = 3;

if (_text_length < _min_length) exitWith {
	player groupChat format["%1-%2, the gang name you entered is less than %3 characters long", _player, (name _player), _min_length];
};
if (_text_length > _max_length) exitWith {
	player groupChat format["%1-%2, the gang name you entered is more than %3 characters long", _player, (name _player), _max_length];
};

//check that player has enough money to create the gang
private["_money"];
_money = [_player, 'money'] call A_inventory_fnc_get_item_amount;
if (_money < gangcreatecost) exitWith {
	player groupChat format["%1-%2, you do not have enough money to create a gang", _player, (name _player)];
};

[player, 'money', -(gangcreatecost)] call A_inventory_fnc_add_item;
format['[%1, toString(%2)] call A_gang_fnc_create;', _player, toArray(_text)] call broadcast;
player groupChat format["%1-%2, you have created a new gang called %3", _player, (name _player), _text];
