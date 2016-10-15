// A_gang_fnc_calculate_income

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {0};

private["_gang", "_player_uid", "_extra"];
_player_uid = [_player] call A_gang_fnc_player_uid;
_gang = [_player_uid] call A_gang_fnc_lookup_player_uid;
if (UNDEFINED(_gang)) exitWith {0};

_extra = 0;

private["_member_uids", "_active_members", "_active_members_count"];
_member_uids = _gang select GANG_INDEX_MEMBERS;
_active_members = [_member_uids] call A_gang_fnc_uids_2_players;
_active_members_count = count(_active_members);
if (_active_members_count == 0) exitWith {0};

private["_base_extra", "_gang_id"];
_base_extra = (A_main_var_gangincome / _active_members_count);
_gang_id = _gang select GANG_INDEX_ID;

{if (true) then {
	private["_gang_area", "_cgang_id"];
	_gang_area = _x;
	_cgang_id = [_gang_area, "control"] call A_object_fnc_getVariable;
	if (UNDEFINED(_cgang_id)) exitWith {null};
	if (typeName _cgang_id != "STRING") exitWith {null};
	if (!(_cgang_id == _gang_id)) exitWith {null};
	
	_extra = _extra + _base_extra;
}} forEach A_main_var_gangareas;

_extra = round(_extra);
_extra
