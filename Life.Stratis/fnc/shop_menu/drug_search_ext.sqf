// A_shop_menu_fnc_drug_search_ext

#include "header.h"


A_shop_menu_var_busy=true;

params["_shop_id"];

private _list = [_shop_id] call A_shop_menu_fnc_get_drug_list;

if(count _list == 0) exitWith {
	player groupchat "No A_item_fnc_drugs found";
	A_shop_menu_var_busy=false;
};

{
	if (true) then {
		private["_data", "_player", "_profit", "_uid"];
		_data = _x;
		_uid = _data select INDEX_DRUG_PLAYER_UID;
		_profit = _data select INDEX_DRUG_PROFIT;
		_player =  [_uid] call A_player_fnc_lookup_uid;
		if (UNDEFINED(_player)) exitWith {A_shop_menu_var_busy=false;};
		
		player groupChat format["This civilian bought $%1 worth of A_item_fnc_drugs from %2-%3!", strM(_profit), _player, (name _player)];
		
		[_player, "(drug-trafficking)", _profit] call A_player_fnc_update_warrants;
		private["_message"];
		_message = format["%1-%2 is wanted for trafficking $%3 worth of A_item_fnc_drugs!", _player, (name _player), strM(_profit)];
		format['cutText[toString(%1), "PLAIN"];',toArray(_message)] call A_broadcast_fnc_broadcast;
	};
} foreach _list;

_list = [];
A_shop_menu_var_busy=false;
[_shop_id, _list] call A_shop_menu_fnc_set_drug_list;