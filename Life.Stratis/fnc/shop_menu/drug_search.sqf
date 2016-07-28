// A_shop_menu_fnc_drug_search

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


waituntil{!A_shop_menu_var_busy};
A_shop_menu_var_busy=true;
ARGV(0,_shop_id);

private["_list"];
_list = [_shop_id] call A_shop_menu_fnc_get_drug_list;

//player groupChat format["_shop_id = %1, _list = %2", _shop_id, _list];

if(count _list == 0) exitWith {
	player groupchat "No A_item_fnc_drugs found";
	A_shop_menu_var_busy=false;
};

{
	if (true) then {
		private["_data", "_player", "_profit", "_uid"];
		_data = _x;
		_uid = _data select A_shop_menu_var_drug_list_player_uid;
		_profit = _data select A_shop_menu_var_drug_list_profit;
		_player =  [_uid] call A_player_fnc_lookup_uid;
		if (undefined(_player)) exitWith {A_shop_menu_var_busy=false;};
		
		player groupChat format["This civilian bought $%1 worth of A_item_fnc_drugs from %2-%3!", strM(_profit), _player, (name _player)];
		
		[_player, "(drug-trafficking)", _profit] call A_player_fnc_update_warrants;
		private["_message"];
		_message = format["%1-%2 is wanted for trafficking $%3 worth of A_item_fnc_drugs!", _player, (name _player), strM(_profit)];
		format['titleText [toString(%1), "PLAIN"];', toArray(_message)] call A_broadcast_fnc_broadcast;
	};
} foreach _list;

_list = [];
A_shop_menu_var_busy=false;
[_shop_id, _list] call A_shop_menu_fnc_set_drug_list;
