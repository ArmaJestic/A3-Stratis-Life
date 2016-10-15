// A_lotto_menu_fnc_interact_lotto_play

#include "header.h"

 _this spawn {
ARGV(0,_player);
ARGV(1,_ticket_id);

if (!([_player] call A_player_fnc_human)) exitWith {};
if (UNDEFINED(_ticket_id)) exitWith {};
if (typeName _ticket_id != "STRING") exitWith {};

private["_ticket_data"];
_ticket_data = [_ticket_id] call A_lotto_menu_fnc_ticket_lookup_id;

if (UNDEFINED(_ticket_data)) exitWith {};

private["_price", "_chance", "_payout"];
_price = _ticket_data select DLLG_LOTTO_TICKET_INDEX_PRICE;
_payout = _ticket_data select DLLG_LOTTO_TICKET_INDEX_PAYOUT;
_chance = _ticket_data select DLLG_LOTTO_TICKET_INDEX_CHANCE;

private["_draw", "_money"];
_draw = floor(random 100);
_money = [_player, 'money'] call A_inventory_fnc_get_item_amount;

if (A_lotto_menu_var_playing_lotto == 1) exitWith {
	player groupChat "WARNING: You can only buy one ticket at a time.";
};

if (_money < _price) exitWith {
	role groupChat localize "STRS_lotto_nomoney";
};

[_player, 'money', -(_price)] call A_inventory_fnc_add_item;

private["_wait_time"];
_wait_time = 10;

player groupChat format["You will be notified of the lottery results in %1 seconds(s)", round(_wait_time)];

A_lotto_menu_var_playing_lotto = 1;
sleep _wait_time;
A_lotto_menu_var_playing_lotto = 0;

if (_draw > _chance) then {
	player groupChat format["%1-%2, sorry, your lottery ticket didn't get drawn this time.", _player, (name _player)];
}else{
	[_player, 'money', _payout] call A_inventory_fnc_add_item;
	player groupChat format["%1-%2, Congratulations, your have won the lottery, you payout is $%3", _player, (name _player), strM(_payout)];
};
};
