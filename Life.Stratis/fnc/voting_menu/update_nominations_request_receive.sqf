// A_voting_menu_fnc_update_nominations_request_receive

#include "header.h"


player groupChat format["A_voting_menu_fnc_update_nominations_request_receive %1", _this];
ARGV(1,_this);
ARGV(0,_election_id);
ARGV(1,_nominee);

if (UNDEFINED(_election_id)) exitWith {};
if (!([_nominee] call A_player_fnc_exists)) exitWith {};
if (typeName _election_id != "STRING") exitWith {};

private["_uid", "_name"];
_uid = getPlayerUID _nominee;
_name = name _nominee;

private["_nominations"];
_nominations = [_election_id] call A_voting_menu_fnc_get_nominations;
if (UNDEFINED(_nominations)) exitWith {};

private["_nominations_index"];
_nominations_index = _nominations select INDEX_ELEC_NOMI_INDEX;
if ((_nominations_index find _uid) >= 0) exitWith {};

private["_nominations_data"];
_nominations_data = _nominations select INDEX_ELEC_NOMI_DATA;
if (UNDEFINED(_nominations_data)) exitWith {};


private["_nominee_data"];
_nominee_data = [];
_nominee_data set [INDEX_DATA_ELEC_NOMI_DATA_ENTRY_UID, _uid];
_nominee_data set [INDEX_DATA_ELEC_NOMI_DATA_ENTRY_NAME, _name];

_nominations_index set [count(_nominations_index), _uid];
_nominations_data set[count(_nominations_data), _nominee_data];

[_election_id, _nominations] call A_voting_menu_fnc_set_nominations;
