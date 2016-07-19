// A_gang_fnc_calculate_income

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {0};

private["_gang", "_player_uid", "_extra"];
_player_uid = [_player] call A_gang_fnc_player_uid;
_gang = [_player_uid] call A_gang_fnc_lookup_player_uid;
if (undefined(_gang)) exitWith {0};

_extra = 0;

private["_member_uids", "_active_members", "_active_members_count"];
_member_uids = _gang select A_gang_var_members;
_active_members = [_member_uids] call A_gang_fnc_uids_2_players;
_active_members_count = count(_active_members);
if (_active_members_count == 0) exitWith {0};

private["_base_extra", "_gang_id"];
_base_extra = (gangincome / _active_members_count);
_A_gang_var_id = _gang select A_gang_var_id;

{if (true) then {
	private["_gang_area", "_cgang_id"];
	_gang_area = _x;
	_cgang_id = [_gang_area, "control"] call A_object_fnc_getVariable;
	if (undefined(_cgang_id)) exitWith {null};
	if (typeName _cgang_id != "STRING") exitWith {null};
	if (not(_cgang_id == _gang_id)) exitWith {null};
	
	_extra = _extra + _base_extra;
}} forEach gangareas;

_extra = round(_extra);
_extra
