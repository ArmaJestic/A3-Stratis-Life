// A_main_menu_fnc_handle_finances

#include "header.h"


ARGV(0,_title);
private["_list"];
_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;
lbClear (ctrlIDC _list);

private["_player"];
_player = player;

private["_total_money", "_inventory_money", "_private_money", "_factory_money", "_bank_money"];
_total_money = [_player] call A_money_fnc_get_total_money;
_inventory_money = [_player] call A_money_fnc_get_inventory_money;
_private_money = [_player] call A_money_fnc_get_private_storage_money;
_factory_money = [_player] call A_money_fnc_get_factory_money;

_bank_money = [_player] call A_bank_fnc_get_value;

_list lbAdd format ["Total money: $%1", strM(_total_money)];
_list lbAdd format ["Inventory: $%2", localize "STRS_statdialog_health", strM(_inventory_money)];
_list lbAdd format ["Bank account: $%2", localize "STRS_statdialog_health", strM(_bank_money)];
_list lbAdd format ["Private storage: $%1", strM(_private_money)];
_list lbAdd format ["Factory storage: $%1", strM(_factory_money)];
