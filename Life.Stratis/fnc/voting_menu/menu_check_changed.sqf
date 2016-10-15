// A_voting_menu_fnc_menu_check_changed

#include "header.h"


//player groupChat format["A_voting_menu_fnc_menu_check_changed %1",  _this];
ARGV(0,_control);
ARGV(1,_index);
ARGV(2,_state);
ARGV(3,_election_data);
ARGV(4,_player);

if (UNDEFINED(_state)) exitWith {};
if (UNDEFINED(_election_data)) exitWith {};

if (!([_player] call A_player_fnc_exists)) exitWith {};

private["_box", "_text"];
_text = " - Auto open window";
_box = if (_state == 1) then {"[x]"} else {"[ ]"};
ctrlSetText [voting_auto_pop_label_idc, _box + _text];

private["_election_id"];
_election_id = _election_data select INDEX_DATA_ELEC_ID;
[_player, format["%1_auto_show_window", _election_id], _state] call A_player_fnc_set_scalar;
