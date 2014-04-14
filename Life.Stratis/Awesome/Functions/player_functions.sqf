#include "macro.h"

if (not(undefined(player_functions_defined))) exitWith {null};

player_exists = {
	ARGV(0,_player);
	if (undefined(_player)) exitWith {false};
	if (typeName _player != "OBJECT") exitWith {false};
	if (isNull _player) exitWith {false};
	true
};

player_ghost = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {false};
	private["_isGhost"];
	_isGhost = [_player, "isGhost"] call object_getVariable;
	if (undefined(_isGhost)) exitWith {false};
	if (typeName _isGhost != "BOOL") exitWith {false};
	_isGhost
};

player_human = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith { false};
	(isPlayer _player)
};

player_human_side = {
	ARGV(0,_player);
	([_player] call stats_human_side)
};

player_ai_side = {
	ARGV(0,_player);
	if (undefined(_player)) exitWith {sideUnknown};
	if (typeName _player != "OBJECT") exitWith {sideUnknown};
	if (isNull _player) exitWith {sideUnknown};
	
	(side _player)
};

player_side = {
	ARGV(0,_player);
	if ([_player] call player_human) exitWith {
		([_player] call player_human_side)
	};
	([_player] call player_ai_side)
};

player_civilian = {
	ARGV(0,_player);
	(([_player] call player_side) == civilian)
};

player_opfor = {
	ARGV(0,_player);
	(([_player] call player_side) == east)
};

player_insurgent = {
	ARGV(0,_player);
	(([_player] call player_side) == resistance)
};

player_cop = {
	ARGV(0,_player);
	(([_player] call player_side) == west)
};

player_pmc = {
	ARGV(0,_player);
	private["_uid"];
	_uid = getPlayerUID _player;
	(["pmc_whitelist", _uid] call list_contains_key)
};

player_admin = {
	ARGV(0,_player);
	private["_uid"];
	_uid = getPlayerUID _player;
	(["admin_list", _uid] call list_contains_key)
};

player_president = {
	ARGV(0,_player);
	private["_uid"];
	_uid = getPlayerUID _player;
	if (_uid == "") exitWith {false};
	(_uid == (server getVariable ["president_uid", "(unknown)"]))
};

player_set_president_uid = {
	ARGV(0,_uid);
	server setVariable ["president_uid", _uid, true];
	_uid
};


player_chief = {
	ARGV(0,_player);
	private["_uid"];
	_uid = getPlayerUID _player;
	if (_uid == "") exitWith {false};
	(_uid == (server getVariable ["chief_uid", "(unknown)"]))
};

player_set_chief_uid = {
	ARGV(0,_uid);
	server setVariable ["chief_uid", _uid, true];
	_uid
};


player_has_license = {
	ARGV(0,_player);
	ARGV(1,_license);
	if (not([_player] call player_human)) exitWith {false};
	if (undefined(_license)) exitWith {false};
	if (typeName _license != "STRING") exitWith {false};
	if (_license == "") exitWith {true};
	
	private["_licenses"];
	_licenses = [_player, "INV_LicenseOwner"] call player_get_array;
	(_license in _licenses)
};

player_add_licenses = {
	ARGV(0,_player);
	ARGV(1,_licenses);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_licenses)) exitWith {null};
	if (typeName _licenses != "ARRAY") exitWith {null};
	
	private["_current_licenses"];
	_current_licenses = [_player, "INV_LicenseOwner"] call player_get_array;

	{if (true) then {
		private["_license"];
		_license = _x;
		if (undefined(_license)) exitWith {null};
		if (typeName _license != "STRING") exitWith {null};
		if (_license in _current_licenses) exitWith {null};
		
		_current_licenses = _current_licenses + [_license];
	}} forEach _licenses;
	
	[_player, "INV_LicenseOwner", _current_licenses] call player_set_array;
};

player_remove_licenses = {
	ARGV(0,_player);
	ARGV(1,_licenses);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_licenses)) exitWith {null};
	if (typeName _licenses != "ARRAY") exitWith {null};
	
	private["_current_licenses"];
	_current_licenses = [_player, "INV_LicenseOwner"] call player_get_array;

	{if (true) then {
		private["_license"];
		_license = _x;
		if (undefined(_license)) exitWith {null};
		if (typeName _license != "STRING") exitWith {null};
		if (not(_license in _current_licenses)) exitWith {null};
		_current_licenses = _current_licenses - [_license];
	}} forEach _licenses;
	
	[_player, "INV_LicenseOwner", _current_licenses] call player_set_array;
};

player_gang_member = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {false};
	
	private["_player_gang_uid"];
	_player_gang_uid = [_player] call gang_player_uid;
	
	private["_gang"];
	_gang = [_player_gang_uid] call gangs_lookup_player_uid;
	not(undefined(_gang))
};

player_get_dead = {
	ARGV(0,_player);
	private["_side"];
	_side = ([_player] call player_side);
	_side = toLower(str(_side));
	([_player, format["isdead_%1", _side]] call player_get_bool)
};

player_set_dead = {
	ARGV(0,_player);
	ARGV(1,_dead);
	private["_side"];
	_side = ([_player] call player_side);
	_side = toLower(str(_side));
	[_player, format["isdead_%1", _side], _dead] call player_set_bool;
};

player_side_prefix = {
	ARGV(0,_side);
	if (undefined(_side)) exitWith {""};
	if (typeName _side != "SIDE") exitWith {""};
	
	if (_side == west) exitWith {"cop"};
	if (_side == east) exitWith {"opf"};
	if (_side == resistance) exitWith {"ins"};
	if (_side == civilian) exitWith {"civ"};
	""
};

player_prefix_side = {
	ARGV(0,_prefix);
	if (undefined(_prefix)) exitWith { sideUnknown };
	if (typeName _prefix != "STRING") exitWith {sideUnknown};
	
	_prefix = toLower(_prefix);
	if (_prefix == "cop") exitWith {west};
	if (_prefix == "opf") exitWith {east};
	if (_prefix == "civ") exitWith {civilian};
	if (_prefix == "ins") exitWith {resistance};
	
	sideUnknown
};


player_prone_states = [
	"amovppnemstpsnonwnondnon",
	"aidlppnemstpsnonwnondnon0s",
	"aidlppnemstpsnonwnondnon01",
	"aidlppnemstpsnonwnondnon02",
	"aidlppnemstpsnonwnondnon03",
	"amovppnemrunsnonwnondf",
	"amovppnemrunsnonwnondfl",
	"amovppnemrunsnonwnondl",
	"amovppnemrunsnonwnondbl",
	"amovppnemrunsnonwnondb",
	"amovppnemrunsnonwnondbr",
	"amovppnemrunsnonwnondr",
	"amovppnemrunsnonwnondfr",
	"amovppnemstpsnonwnondnon_turnl",
	"amovppnemstpsnonwnondnon_turnr",
	"awopppnemstpsgthwnondnon_end"
	];

player_vulnerale_states = [
	"UnaErcPoslechVelitele4", 
	"TestSurrender",
	"adthppnemstpsraswpstdnon_2", 
	"AcinPercMstpSnonWpstDnon_agony",
	"unconscious"
	];
	
player_vulnerale_states = player_vulnerale_states + player_prone_states;


player_vulnerable = {
	ARGV(0,_player);
	if (undefined(_player)) exitWith { false };
	
	_state  = animationState _player;
	 
	//player groupChat format["_state = %1", _state];
	if (toLower(_state) in ([player_vulnerale_states] call toLowerArray)) exitWith { true };

	private["_stunned", "_restrained"];
	_stunned = [_player, "stunned"] call player_get_bool;
	_restrained = [_player, "restrained"] call player_get_bool;
	(_stunned || _restrained)
};


player_set_arrest = {
	ARGV(0,_player);
	ARGV(1,_arrest);
	
	if (undefined(_player)) exitWith {null};
	if (undefined(_arrest)) exitWith {null};
	
	if (typeName _arrest != "BOOL") exitWith {null};
	
	private["_arrest_variable_name"];
	_arrest_variable_name = format["arrest"];

	[_player, _arrest_variable_name, _arrest, true] call object_setVariable;
	[_player, _arrest_variable_name, _arrest] call stats_player_save;
};

player_get_arrest = {
	ARGV(0,_player);
	
	if (undefined(_player)) exitWith {null};
	
	private["_arrest_variable_name"];
	_arrest_variable_name = format["arrest", _player];
	
	private["_arrest_variable"];
	_arrest_variable = [_player, _arrest_variable_name] call object_getVariable;
	_arrest_variable = if (undefined(_arrest_variable)) then {false} else {_arrest_variable};
	_arrest_variable = if (typeName _arrest_variable != "BOOL") then {false} else {_arrest_variable};
	_arrest_variable
};



player_update_reason = {
	ARGV(0,_player);
	ARGV(1,_reason);
	
	private["_reasons"];
	_reasons = [_player] call player_get_reason;
	
	if (_reason in _reasons) exitWith {null};
	_reasons = _reasons + [_reason];
	[_player, _reasons] call player_set_reason;
};

player_set_reason = {
	ARGV(0,_player);
	ARGV(1,_reason);

	if (undefined(_player)) exitWith {null};
	if (undefined(_reason)) exitWith {null};
	
	if (typeName _reason != "ARRAY") exitWith {null};
	
	private["_reason_variable_name", "_reason_variable"];
	_reason_variable_name = format["warrants"];
	
	[_player, _reason_variable_name, _reason, true] call object_setVariable;
	[_player, _reason_variable_name, _reason] call stats_player_save;
	
};

player_get_reason = {
	ARGV(0,_player);
	

	if (undefined(_player)) exitWith {null};
	private["_reason_variable_name"];
	_reason_variable_name = format["warrants", _player];
	
	private["_reason_variable"];
	_reason_variable = [_player, _reason_variable_name] call object_getVariable;
	_reason_variable = if (undefined(_reason_variable)) then {[]} else {_reason_variable};
	_reason_variable = if (typeName _reason_variable != "ARRAY") then { [] } else { _reason_variable };
	_reason_variable
};

player_set_wanted = {
	ARGV(0,_player);
	ARGV(1,_wanted);
	
	if (undefined(_player)) exitWith {null};
	if (undefined(_wanted)) exitWith {null};
	
	if (typeName _wanted != "BOOL") exitWith {null};

	private["_wanted_variable_name"];
	_wanted_variable_name = format["wanted"];

	[_player, _wanted_variable_name, _wanted, true] call object_setVariable;
	[_player, _wanted_variable_name, _wanted] call stats_player_save;
};

player_get_wanted = {
	ARGV(0,_player);
	
	if (undefined(_player)) exitWith {false};
	
	private["_wanted_variable_name"];
	_wanted_variable_name = format["wanted", _player];
	
	private["_wanted_variable"];
	_wanted_variable = [_player, _wanted_variable_name] call object_getVariable;
	_wanted_variable = if (undefined(_wanted_variable)) then {false} else {_wanted_variable};
	_wanted_variable = if (typeName _wanted_variable != "BOOL") then {false} else {_wanted_variable};
	_wanted_variable
};


player_update_bounty = {
	ARGV(0,_player);
	ARGV(1,_bounty);
	
	private["_current_bounty"];
	
	_current_bounty = [_player] call player_get_bounty;
	private["_new_bounty"];
	_new_bounty = (_current_bounty + _bounty);
	_new_bounty = if (_new_bounty < 0) then {0} else {_new_bounty};

	[_player, _new_bounty] call player_set_bounty;
};

player_set_bounty = {
	ARGV(0,_player);
	ARGV(1,_bounty);
	
	if (undefined(_player)) exitWith {null};
    if (undefined(_bounty)) exitWith {null};
	
	if (typeName _bounty != "SCALAR") exitWith {null};
	_bounty = if (_bounty < 0) then {0} else {_bounty};
	_bounty = round(_bounty);
	
	private["_bounty_variable_name"];
	_bounty_variable_name = format["bounty"];
	
	[_player, _bounty_variable_name, _bounty, true] call object_setVariable;
	[_player, _bounty_variable_name, _bounty] call stats_player_save;
};


player_get_bounty = {
	ARGV(0,_player);

	if (undefined(_player)) exitWith {null};

	private["_bounty_variable_name"];
	_bounty_variable_name = format["bounty"];
	
	private["_bounty_variable"];
	_bounty_variable = [_player, _bounty_variable_name] call object_getVariable;
	_bounty_variable = if (undefined(_bounty_variable)) then { 0 } else { _bounty_variable };
	_bounty_variable = if (typeName _bounty_variable != "SCALAR") then { 0 } else {_bounty_variable };
	_bounty_variable
};

player_update_warrants = {
	ARGV(0,_player);
	ARGV(1,_reason);
	ARGV(2,_bounty);
	
	[_player, true] call player_set_wanted;
	[_player, _reason] call player_update_reason;
	[_player, _bounty] call player_update_bounty;
};

player_reset_warrants = {
	ARGV(0,_player);
	[_player, false] call player_set_wanted;
	[_player, 0] call player_set_bounty;
	[_player, []] call player_set_reason;
};

player_armed = {
	ARGV(0,_player);
	([_player] call player_get_armed)
};

player_update_armed = {
	ARGV(0,_player);
	ARGV(1,_armed);
	
	private["_carmed"];
	_carmed =[_player] call player_get_armed;
	if ( str(_carmed) == str(_armed)) exitWith {null};
	//player groupChat format["_armed = %1", _armed];
	[_player, _armed] call player_set_armed;
};

player_get_armed = {
	ARGV(0,_player);
	if (undefined(_player)) exitWith {false};
	
	private["_armed"];
	_armed = [_player, "armed"] call object_getVariable;
	_armed = if (undefined(_armed)) then { false } else { _armed};
	_armed = if (typeName _armed != "BOOL") then {false} else {_armed};
	_armed
};

player_set_armed = {
	ARGV(0,_player);
	ARGV(1,_armed);
	if (undefined(_player)) exitWith {false};
	if (undefined(_armed)) exitWith {false};
	if (typeName _armed != "BOOL") exitWith {false};
	
	[_player, "armed", _armed, true] call object_setVariable;
};



player_update_scalar = {
	ARGV(0,_player);
	ARGV(1,_variable_name);
	ARGV(2,_variable_value);
	
	private["_current_value"];
	_current_value = [_player, _variable_name] call player_get_scalar;
	[_player, _variable_name, (_current_value + _variable_value)] call player_set_scalar;
};

player_set_scalar = {
	ARGV(0,_player);
	ARGV(1,_variable_name);
	ARGV(2,_variable_value);
	
	if (undefined(_player)) exitWith {null};
	if (undefined(_variable_name)) exitWith {null};
    if (undefined(_variable_value)) exitWith {null};
	
	if (typeName _variable_name != "STRING") exitWith {null};
	if (typeName _variable_value != "SCALAR") exitWith {null};
	
	private["_current_value"];
	_current_value = [_player, _variable_name] call player_get_scalar;
	if (_current_value == _variable_value) exitWith {null};
	
	[_player, _variable_name, _variable_value, true] call object_setVariable;
	[_player, _variable_name, _variable_value] call stats_player_save;
};

player_get_scalar = {
	ARGV(0,_player);
	ARGV(1,_variable_name);
	ARGV(2,_default);

	if (undefined(_player)) exitWith {_default};
	if (undefined(_variable_name)) exitWith {_default};

	private["_variable_value"];
	_variable_value = [_player, _variable_name, _default] call object_getVariable;
	_variable_value = if (undefined(_variable_value)) then { 0 } else { _variable_value };
	_variable_value = if (typeName _variable_value != "SCALAR") then { 0 } else {_variable_value };
	_variable_value
};


player_update_bool = {
	ARGV(0,_player);
	ARGV(1,_variable_name);
	ARGV(2,_variable_value);
	
	private["_current_value"];
	_current_value = [_player, _variable_name] call player_get_bool;
	if (str(_current_value) == str(_variable_value)) exitWith {null};
	[_player, _variable_name, _variable_value] call player_set_bool;
};

player_set_bool = {
	ARGV(0,_player);
	ARGV(1,_variable_name);
	ARGV(2,_variable_value);
	
	if (undefined(_player)) exitWith {null};
	if (undefined(_variable_name)) exitWith {null};
    if (undefined(_variable_value)) exitWith {null};
	
	if (typeName _variable_name != "STRING") exitWith {null};
	if (typeName _variable_value != "BOOL") exitWith {null};
	
	private["_current_value"];
	_current_value = [_player, _variable_name] call player_get_bool;
	if (str(_current_value) == str(_variable_value)) exitWith {null};
	
	[_player, _variable_name, _variable_value, true] call object_setVariable;
	[_player, _variable_name, _variable_value] call stats_player_save;
};

player_get_bool = {
	ARGV(0,_player);
	ARGV(1,_variable_name);
	ARGV(2,_default);

	if (undefined(_player)) exitWith {_default};
	if (undefined(_variable_name)) exitWith {_default};

	private["_variable_value"];
	_variable_value = [_player, _variable_name, _default] call object_getVariable;
	_variable_value = if (undefined(_variable_value)) then { false } else { _variable_value };
	_variable_value = if (typeName _variable_value != "BOOL") then { false } else {_variable_value };
	_variable_value
};

player_update_bail = {
	ARGV(0,_player);
	ARGV(1,_bail);
	
	private["_current_bail"];
	
	_current_bail = [_player] call player_get_bail;
	private["_new_bail"];
	_new_bail = (_current_bail + _bail);
	_new_bail = if (_new_bail < 0) then {0} else {_new_bail};

	[_player, _new_bail] call player_set_bail;
};

player_set_bail = {
	ARGV(0,_player);
	ARGV(1,_bail);
	
	if (undefined(_player)) exitWith {null};
    if (undefined(_bail)) exitWith {null};
	
	if (typeName _bail != "SCALAR") exitWith {null};
	_bail = if (_bail < 0) then {0} else {_bail};
	_bail = round(_bail);
	
	private["_bail_variable_name"];
	_bail_variable_name = format["bail"];
	
	[_player, _bail_variable_name, _bail, true] call object_setVariable;
	[_player, _bail_variable_name, _bail] call stats_player_save;
};


player_get_bail = {
	ARGV(0,_player);

	if (undefined(_player)) exitWith {0};

	private["_bail_variable_name"];
	_bail_variable_name = format["bail"];
	
	private["_bail_variable"];
	_bail_variable = [_player, _bail_variable_name] call object_getVariable;
	_bail_variable = if (undefined(_bail_variable)) then { 0 } else { _bail_variable };
	_bail_variable = if (typeName _bail_variable != "SCALAR") then { 0 } else {_bail_variable };
	_bail_variable
};


player_pmc_whitelist = {
	ARGV(0,_player);
	
	if (undefined(_player)) exitWith {null};
	
	private["_uid"];
	_uid = getPlayerUID _player;
	
	if (undefined(_uid)) exitWith {false};
	if (typeName _uid != "STRING") exitWith {false};
	if (_uid == "") exitWith {false};
	
	["pmc_whitelist", _uid] call list_contains_key;
};

player_rob_station = {
	ARGV(0,_player);
	ARGV(1,_station);
	
	if (undefined(_player)) exitWith {null};
	if (undefined(_station)) exitWith {null};
	if (typeName _station != "SCALAR") exitWith {null};
	
	if (not([_player] call player_armed)) exitwith {
		player groupchat "You need a gun to rob the station!";
	};
	
	private["_money_variable_name", "_money_variable"];
	_money_variable_name = format["station%1money", _station];
	_money_variable = missionNamespace getVariable _money_variable_name;
	
	[_player, "Robbed a gas station", wantedamountforrobbing] call player_update_warrants;
	format ['server globalChat "Someone robbed gas station %1!";', _station] call broadcast;
	
	[_player, 'money', _money_variable] call inventory_add_item;
	player sidechat format ["You stole $%1 from the gas station!", _money_variable];
	
	_money_variable = 0;
	missionNamespace setVariable [_money_variable_name, _money_variable];
	publicVariable _money_variable_name;
};


player_prison_time = {
	ARGV(0,_player);
	ARGV(1,_minutes);
	
	if (undefined(_player)) exitWith {null};
	if (_player != player) exitWith {null};
	
	if (undefined(_minutes)) exitWith {null};
	if (typeName _minutes != "SCALAR") exitWith {null};
	if (_minutes <= 0) exitWith {null};

	private["_seconds"];
	_seconds = round(_minutes) * 60;
	[_player, "jailtimeleft", _seconds] call player_set_scalar;
	private["_message"];
	_message = format["%1-%2 was sent to prison for %3 minutes", _player, (name _player), strM(round(_seconds/60))];
	[[_message, CHAT_GLOBAL, server], "interact_chat", true] call BIS_fnc_MP;
	_seconds
};

player_prison_bail = {
	ARGV(0,_player);
	ARGV(1,_percent);
	
	if (undefined(_player)) exitWith {null};
	if (_player != player) exitWith {null};
	
	if (undefined(_percent)) exitWith {null};
	if (typeName _percent != "SCALAR") exitWith {null};
	if (_percent <= 0) exitWith {null};
	
	_percent = _percent / 100;
	
	private["_bail", "_money"];
	_money =  [_player] call player_get_total_money;
	_bail = round(_percent * _money);
	_bail = if (_bail <= 0) then { 100000 } else { _bail };
	[_player, _bail] call player_set_bail;
	private["_message"];
	_message = format["%1-%2 has a bail set at $%3", _player, (name _player), strM(_bail)];
	[[_message, CHAT_GLOBAL, server], "interact_chat", true] call BIS_fnc_MP;

	_bail
};

player_prison_strip = {
	ARGV(0,_player);

	if (undefined(_player)) exitWith {null};
	if (_player != player) exitWith {null};
	if (not([_player] call player_human)) exitWith {null};
	
	//remove stolen cash, and illlal items
	[_player] call inventory_remove_illegal;
	if (stolencash > 0) then {
		[_player, stolencash] call player_lose_money;
		private["_message"];
		_message = format["%1-%2 was a bank robber, and has been charged $%3!", _player, (name _player), stolencash];
		format['server globalChat toString(%1);', toArray(_message)] call broadcast;
	};
	stolencash = 0;
};

player_prison_reset = {
	ARGV(0,_player);
	[_player, false] call player_set_arrest;
	[_player, "jailtimeleft", 0] call player_set_scalar;
	[_player, 0] call player_set_bail;
	[_player] call player_reset_warrants;
};

player_prison_release = {
	ARGV(0,_player);
	_player setPosATL getMarkerPos "jail_freemarker";	
	_player setdamage 0; 
};


player_prison_loop = { _this spawn {
	ARGV(0,_player);
	ARGV(1,_time_left);
	ARGV(2,_bail_left);

	if (undefined(_player)) exitWith {null};
	if (_player != player) exitWith {null};
	if (not([_player] call player_human)) exitWith {null};
	
	if (undefined(_time_left)) exitWith {null};
	if (typeName _time_left != "SCALAR") exitWith {null};
	
	if (undefined(_bail_left)) exitWith {null};
	if (typeName _bail_left != "SCALAR") exitWith {null};


	private["_player_name", "_time_original"];
	_player_name = (name _player);
	_time_original = _time_left;
	
	//move player to prison
	_player setPos (getMarkerPos "prisonspawn");
	_player setDamage 0;
	
	//mark as arrested and clear warrants
	[_player] call player_reset_warrants;
	[_player, true] call player_set_arrest;
	[_player, "restrained", false] call player_set_bool;
	[_player, "stunned", false] call player_set_bool;
	
	
	while {_time_left >= 0 && _bail_left >= 0} do {
		_bail_left = floor(((_time_left/_time_original)) * ([_player] call player_get_bail));
		
		//only update the time and bail left every 30 seconds to avoid spamming the stats
		if ((_time_left % 30) == 0) then {
			[_player, _bail_left] call player_set_bail;
			[_player, "jailtimeleft", _time_left] call player_set_scalar;
		};
		
		hintsilent format["Time until release\n%1 seconds\nBail left to pay\n$%2", _time_left, strM(_bail_left)];
		//PLAYER DISAPPEARED ...
		if (isNull(_player)) exitWith { 
			private["_message"];
			_message = format["%1 has pulled a ninja escape from prison >_< !", _player_name];
			format['server globalChat toString(%1);', toArray(_message)] call broadcast;
		};
		
		//PLAYER DIED
		if (not(alive _player)) exitWith {
			private["_message"];
			_message = format["%1-%2 has died while in prison",_player, _player_name];
			format['server globalChat toString(%1);', toArray(_message)] call broadcast;
			[_player, "jailtimeleft", _time_left] call player_set_scalar;
			[_player, _bail_left] call player_set_bail;
			[_player, true] call player_set_arrest;
		};
		
		//PLAYER HAS BEEN SET FREE
		if (not([_player] call player_get_arrest)) exitWith {
			/*
			private["_message"];
			_message = format["%1-%2 has been set free by the authorities", _player, _player_name];
			format['server globalChat toString(%1);', toArray(_message)] call broadcast;
			*/
			[_player] call player_prison_reset;
			[_player] call player_prison_release;
		};
		
		//PLAYER HAS ESCAPED PRISON
		if ((player distance prison_logic) >= 100) exitWith {
			private["_message"];
			_message = format["%1-%2 has pulled a daring escape from prison >_< !", _player, _player_name];
			format['server globalChat toString(%1);', toArray(_message)] call broadcast;
			[_player, false] call player_set_arrest;
			[_player, "jailtimeleft", 0] call player_set_scalar;
			[_player, 0] call player_set_bail;
			[_player, "(prison-break)", 20000] call player_update_warrants;
		};
		
		//PLAYER HAS SERVED HIS FULL SENTNECE
		if (_time_left <= 0 ) exitWith {
			private["_message"];
			_message = format["%1-%2 has been released from prison, after serving a %3 minute/s sentence", _player, _player_name, round(_time_original/60)];
			format['server globalChat toString(%1);', toArray(_message)] call broadcast;
			[_player] call player_prison_reset;
			[_player] call player_prison_release;
		};
		
		//PLAYER HAS PAID THE FULL BAIL
		if (_bail_left <= 0 && _time_left > 0 ) exitWith {
			private["_message"];
			_message = format["%1-%2 has been relased from prison, after paying bail", _player, _player_name];
			format['server globalChat toString(%1);', toArray(_message)] call broadcast;
			[_player] call player_prison_reset;
			[_player] call player_prison_release;
		};
		
		_time_left  = _time_left - 1;
		sleep 1;
	};
};};


player_prison_convict = {
	player groupChat format["player_prison_convict %1", _this];
	ARGV(0,_player);

	if (undefined(_player)) exitWith {null};
	if (_player != player) exitWith {null};
	if (not([_player] call player_human)) exitWith {null};

	private["_time_left", "_bail_left"];
	_time_left = round([_player, "jailtimeleft"] call player_get_scalar);
	_bail_left = [_player] call player_get_bail;
	if (not(_time_left > 0 && _bail_left > 0)) exitWith {null};
	
	[_player] call player_prison_strip;
	[_player, _time_left, _bail_left] call player_prison_loop;
};


player_near_cops = {
	ARGV(0,_player);
	ARGV(1,_distance);
	(([_player, west, _distance] call player_near_side_count) > 0)
};

player_near_civilians = {
	ARGV(0,_player);
	ARGV(1,_distance);
	(([_player, civilian, _distance] call player_near_side_count) > 0)
};

player_near_side_count = {
	ARGV(0,_player);
	ARGV(1,_side);
	ARGV(2,_distance);
	
	(count ([_player, _side, _distance] call player_near_side))
};

player_near_side = {
	ARGV(0,_player);
	ARGV(1,_side);
	ARGV(2,_distance);
	
	if (not([_player] call player_human)) exitWith {0};
	
	if (undefined(_side)) exitWith {0};
	if (typeName _side != "SIDE") exitWith {0};
	if (undefined(_distance)) exitWith {0};
	if (typeName _distance != "SCALAR") exitWith {0};

	
	private["_near_vehicles"];
	_near_vehicles = nearestobjects[(getpos _player), ["LandVehicle", "Air"], _distance];
	
	private["_near_players"];
	_near_players = nearestobjects[(getpos _player), ["Man"], _distance];
	
	//add the vehicle crew members to the list of player nears
	{
		private["_vehicle", "_crew"];
		_vehicle = _x;
		_crew =  crew _vehicle;
		if (count(_crew) > 0) then {
			_near_players = _near_players + _crew;
		};
	} forEach _near_vehicles;
	
	//check the players that are near
	private["_near_side_players"];
	_near_side_players = [];
	{
		private["_cplayer", "_cside"];
		_cplayer = _x;
		_cside = ([_cplayer] call player_side); 
		if (([_cplayer] call player_human) && _cside == _side) then {
			if (not(_cplayer == _player)) then {
				_near_side_players = _near_side_players + [_cplayer];
			};
		};
	} 
	forEach (_near_players);
	
	_near_side_players
};


players_object_near = {
	ARGV(0,_object);
	ARGV(1,_distance);
	
	if (undefined(_object)) exitWith {[]};
	if (undefined(_distance)) exitWith {[]};
	if (typeName _object != "OBJECT") exitWith {[]};
	if (typeName _distance != "SCALAR") exitWith {[]};
	
	private["_near_players"];
	_near_players = [];
	{
		private["_player_variable_name", "_player_variable"];
		_player_variable_name = _x;
		_player_variable = missionNamespace getVariable _player_variable_name;
		if ([_player_variable] call player_human) then {
			if ((_player_variable distance _object) < _distance) then {
				_near_players = _near_players + [_player_variable];
			};
		};
	} forEach playerstringarray;
	
	_near_players
};


player_get_index = {
	ARGV(0,_player);
	
	if (not([_player] call player_human)) exitWith {-1};
	
	private["_player_index"];
	
	_player_index = (playerstringarray find (str(_player)));
	_player_index
};

player_prison_roe = { _this spawn {
	//player groupChat format["roe prison _this = %1", _this];
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	if (_player != player) exitWith {null};
	
	private["_time_left"];
	_time_left = [_player, "roeprisontime"] call player_get_scalar;
	if (_time_left <= 0) exitWith {
		[_player, "roeprison", false] call player_set_bool;
	};
	
	private["_message"];
	_message = format["%1-%2 has been sent to prison for %3 minute/s, for ROE violations",  _player, (name _player), strN(round(_time_left/60))];
	format['server globalChat toString(%1);', toArray(_message)] call broadcast;
	
	[_player, "roeprison", true] call player_set_bool;
	_player setPos (getPos CopPrison);
	[_player] call player_reset_gear;
	
	private["_time_original"];
	_time_original = _time_left;
	
	while {_time_left >= 0} do {
		//only update the time left every 30 seconds to avoid spamming the stats
		if ((_time_left % 30) == 0) then {
			[_player, "roeprisontime", _time_left] call player_set_scalar;
		};
		
		hintsilent format["Time until release\n%1 seconds", _time_left];
		
		//PLAYER DISAPPEARED ...
		if (isNull(_player)) exitWith { 
			[_player, "roeprisontime", _time_left] call player_set_scalar;
		};
		
		//PLAYER DIED
		if (not(alive _player)) exitWith {
			[_player, "roeprisontime", _time_left] call player_set_scalar;
		};
		
		//PLAYER HAS ESCAPED PRISON
		if ((_player distance CopPrison) >= 100) then {
			private["_message"];
			_message = format["%1-%2 attempted to escape from prison with %3 minute/s left on his sentence", _player, (name _player), strN(round(_time_left/60))];
			format['server globalChat toString(%1);', toArray(_message)] call broadcast;
			_player setPos (getPos CopPrison);
		};
	
		//PLAYER HAS SERVED HIS FULL SENTNECE
		if (_time_left <= 0 ) exitWith {
			[_player, "roeprisontime", 0] call player_set_scalar;
			[_player, "roeprison", false] call player_set_bool;
			_message = format["%1-%2 has been set free, after serving %3 minute/s", _player, (name _player), strN(round(_time_original/60))];
			format['server globalChat toString(%1);', toArray(_message)] call broadcast;
			_player setPos (getPos CopPrisonAusgang);
		};
		
		_time_left  = _time_left - 1;
		sleep 1;
	};
};};


player_lookup_uid = {
	ARGV(0,_uid);
	
	if (undefined(_uid)) exitWith {null};
	if (typeName _uid != "STRING") exitWith {null};
	
	private["_player"];
	_player = null;
	{
		private["_player_variable_name", "_player_variable"];
		_player_variable_name = _x;
		_player_variable =  missionNamespace getVariable _player_variable_name;
		if (not(undefined(_player_variable)) && {([_player_variable] call player_human)}) then {
			private["_cuid"];
			_cuid = (getPlayerUID _player_variable);
			if (_cuid == _uid) exitWith {
				_player = _player_variable;
			};
		};
		if (not(undefined(_player))) exitWith {null};
	} forEach playerstringarray;
	
	_player
};

player_lookup_name = {
	ARGV(0,_name);
	
	if (undefined(_name)) exitWith {null};
	if (typeName _name != "STRING") exitWith {null};
	
	private["_player"];
	_player = null;
	{
		private["_player_variable_name", "_player_variable"];
		_player_variable_name = _x;
		_player_variable = missionNamespace getVariable _player_variable_name;
	
		if ([_player_variable] call player_exists) then {
			private["_cname"];
			_cname = [_player_variable, "name"] call object_getVariable;
			if (_cname == _name) exitWith {
				_player = _player_variable;
			};
		};
		if (not(undefined(_player))) exitWith {null};
	} forEach playerstringarray;
	_player
};

//finds a player by his gang UID
player_lookup_gang_uid = {
	ARGV(0,_player_gang_uid);
	if (undefined(_player_gang_uid)) exitWith {null};
	if (typeName _player_gang_uid != "STRING") exitWith {null};
	
	private["_player"];
	_player = null;
	
	{
		private["_unit", "_unit_gang_uid"];
		_unit = _x;
		_unit_gang_uid = [_unit] call gang_player_uid;
		
		if (_unit_gang_uid == _player_gang_uid) then {
			_player = _unit;
		};
	} forEach playableUnits;
	
	(_player)
};


player_update_array = {
	ARGV(0,_player);
	ARGV(1,_variable_name);
	ARGV(2,_variable_value);
	
	private["_current_value"];
	_current_value = [_player, _variable_name] call player_get_array;
	if (str(_current_value) == str(_variable_value)) exitWith {null};
	[_player, _variable_name, _variable_value] call player_set_array;
};

player_get_array = {
	ARGV(0,_player);
	ARGV(1,_variable_name);
	

	if (undefined(_player)) exitWith {null};
	if (undefined(_variable_name)) exitWith {null};

	private["_variable_value"];
	_variable_value = [_player, _variable_name] call object_getVariable;
	_variable_value = if (undefined(_variable_value)) then { [] } else { _variable_value };
	_variable_value = if (typeName _variable_value != "ARRAY") then { [] } else {_variable_value };
	_variable_value
};

player_set_array = {
	ARGV(0,_player);
	ARGV(1,_variable_name);
	ARGV(2,_variable_value);
	
	[_player, _variable_name, _variable_value, true] call player_set_array_checked;
};

player_set_array_checked = {
	ARGV(0,_player);
	ARGV(1,_variable_name);
	ARGV(2,_variable_value);
	ARGV(3,_check_change);
	
	if (undefined(_player)) exitWith {null};
	if (undefined(_variable_name)) exitWith {null};
    if (undefined(_variable_value)) exitWith {null};
	if (undefined(_check_change)) exitWith {null};
	
	if (typeName _variable_name != "STRING") exitWith {null};
	if (typeName _variable_value != "ARRAY") exitWith {null};
	if (typeName _check_change != "BOOL") exitWith {null};
	
	private["_current_value"];
	
	if (_check_change) then {
		_current_value = [_player, _variable_name] call player_get_array;	
		if (str(_current_value) == str(_variable_value)) exitWith {null};
	};
	
	[_player, _variable_name, _variable_value, true] call object_setVariable;
	[_player, _variable_name, _variable_value] call stats_player_save;
};


player_update_string = {
	ARGV(0,_player);
	ARGV(1,_variable_name);
	ARGV(2,_variable_value);
	
	private["_current_value"];
	_current_value = [_player, _variable_name] call player_get_string;
	if (str(_current_value) == str(_variable_value)) exitWith {null};
	[_player, _variable_name, _variable_value] call player_set_string;
};


player_set_string = {
	ARGV(0,_player);
	ARGV(1,_variable_name);
	ARGV(2,_variable_value);
	
	if (undefined(_player)) exitWith {null};
	if (undefined(_variable_name)) exitWith {null};
    if (undefined(_variable_value)) exitWith {null};
	
	if (typeName _variable_name != "STRING") exitWith {null};
	if (typeName _variable_value != "STRING") exitWith {null};
	
	private["_current_value"];
	_current_value = [_player, _variable_name] call player_get_string;
	if (str(_current_value) == str(_variable_value)) exitWith {null};
	
	[_player, _variable_name, _variable_value, true] call object_setVariable;
	[_player, _variable_name, _variable_value] call stats_player_save;
};

player_get_string = {
	ARGV(0,_player);
	ARGV(1,_variable_name);

	if (undefined(_player)) exitWith {null};
	if (undefined(_variable_name)) exitWith {null};

	private["_variable_value"];
	_variable_value = [_player, _variable_name] call object_getVariable;
	_variable_value = if (undefined(_variable_value)) then { "" } else { _variable_value };
	_variable_value = if (typeName _variable_value != "STRING") then { "" } else {_variable_value };
	_variable_value
};



player_gear_backpack = 0;
player_gear_backpack_weapons = 1;
player_gear_backpack_magazines = 2;
player_gear_primary_weapon_items = 3;
player_gear_secondary_weapon_items = 4;
player_gear_handgun_weapon_items = 5;
player_gear_uniform_items = 6;
player_gear_vest_items = 7;
player_gear_backpack_items = 8;
player_gear_assigned_items = 9;
player_gear_uniform = 10;
player_gear_vest = 11;
player_gear_headgear = 12;
player_gear_goggles = 13;
player_gear_primary_weapon = 14;
player_gear_secondary_weapon = 15;
player_gear_tertiary_weapon = 16;
player_gear_primary_magazine = 17;
player_gear_secondary_magazine = 18;
player_gear_tertiary_magazine = 19;

player_get_gear = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	if ([_player] call player_ghost) exitWith {[_player, "cached_gear"] call object_getVariable};
	
	private["_backpack", "_backpack_weapons", "_backpack_magazines", "_backpack_type"];
	_backpack = unitBackpack _player;
	_backpack_type = typeOf _backpack;
	
	private["_primary_items", "_secondary_items", "_handgun_items", "_uniform_items",
			"_vest_items", "_backpack_items", "_assigned_items"];
	_primary_items = [(primaryWeaponItems _player)] call toLowerArray;
	_secondary_items = [(secondaryWeaponItems _player)] call toLowerArray;
	_handgun_items = [(handgunItems _player)] call toLowerArray;
	_uniform_items = [(uniformItems _player)] call toLowerArray;
	_vest_items = [(vestItems _player)] call toLowerArray;
	_backpack_items = [(backpackItems _player)] call toLowerArray;
	_assigned_items = [(assignedItems _player)] call toLowerArray;
	
	private["_uniform", "_vest", "_headgear", "_goggles", "_primary_weapon", "_secondary_weapon", "_tertiary_weapon",
	        "_primary_magazine", "_secondary_magazine", "_tertiary_magazine"];
			
	_uniform = [_player] call player_uniform;
	_vest = [_player] call player_vest;
	_headgear = [_player] call player_headgear;
	_goggles = [_player] call player_goggles;
	_primary_weapon = primaryWeapon _player;
	_secondary_weapon = secondaryWeapon _player;
	_tertiary_weapon = handgunWeapon _player;
	_primary_magazine = primaryWeaponMagazine _player;
	_secondary_magazine = secondaryWeaponMagazine _player;
	_tertiary_magazine = handgunMagazine _player;
	
	
	if (_backpack_type == "") then {
		_backpack_type = "none";
		_backpack_weapons =  [];
		_backpack_magazines = [];
	}
	else {
		_backpack_weapons =  getWeaponCargo _backpack;
		_backpack_magazines = getMagazineCargo _backpack;
	};
	
	private["_gear"];
	_gear = [];
	_gear set [player_gear_backpack, _backpack_type];
	_gear set [player_gear_backpack_weapons, _backpack_weapons];
	_gear set [player_gear_backpack_magazines, _backpack_magazines];
	_gear set [player_gear_primary_weapon_items, _primary_items];
	_gear set [player_gear_secondary_weapon_items, _secondary_items];
	_gear set [player_gear_handgun_weapon_items, _handgun_items];
	_gear set [player_gear_uniform_items, _uniform_items];
	_gear set [player_gear_vest_items, _vest_items];
	_gear set [player_gear_backpack_items, _backpack_items];
	_gear set [player_gear_assigned_items, _assigned_items];
	_gear set [player_gear_uniform, _uniform];
	_gear set [player_gear_vest, _vest];
	_gear set [player_gear_headgear, _headgear];
	_gear set [player_gear_goggles, _goggles];
	_gear set [player_gear_primary_weapon, _primary_weapon];
	_gear set [player_gear_secondary_weapon, _secondary_weapon];
	_gear set [player_gear_tertiary_weapon, _tertiary_weapon];
	_gear set [player_gear_primary_magazine, _primary_magazine];
	_gear set [player_gear_secondary_magazine, _secondary_magazine];
	_gear set [player_gear_tertiary_magazine, _tertiary_magazine];
	
	_gear
};

CopStartGear_Mags = [
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag"
];

CopStartGear_Weap = ["hgun_Rook40_F", "ItemGPS"];
CopStartGear_HandGun_items = ["muzzle_snds_l"];

player_set_gear = {
	diag_log format["player_set_gear %1", _this];
	ARGV(0,_player);
	ARGV(1,_gear);
	if (not([_player] call player_exists)) exitWith {null};
	if (undefined(_gear)) exitWith {null};
	if (typeName _gear != "ARRAY") exitWith {null};
	
	private["_backpack", "_backpack_weapons", "_backpack_magazines",
			"_primary_items", "_secondary_items", "_handgun_items",
			"_uniform_items", "_vest_items", "_backpack_items", "_assigned_items",
			"_uniform", "_vest", "_headgear", "_goggles",
			"_primary_weapon", "_secondary_weapon", "_tertiary_weapon",
			"_primary_magazine", "_secondary_magazine", "_tertiary_magazine"];	
	
	_backpack = _gear select player_gear_backpack;
	_backpack_weapons = _gear select player_gear_backpack_weapons;
	_backpack_magazines = _gear select player_gear_backpack_magazines;
	_primary_items = _gear select player_gear_primary_weapon_items;
	_secondary_items = _gear select player_gear_secondary_weapon_items;
	_handgun_items = _gear select player_gear_handgun_weapon_items;
	_uniform_items = _gear select player_gear_uniform_items;
	_vest_items = _gear select player_gear_vest_items;
	_backpack_items = _gear select player_gear_backpack_items;
	_assigned_items = _gear select player_gear_assigned_items;
	_uniform = _gear select player_gear_uniform;
	_vest = _gear select player_gear_vest;
	_headgear = _gear select player_gear_headgear;
	_goggles = _gear select player_gear_goggles;
	_primary_weapon = _gear select player_gear_primary_weapon;
	_secondary_weapon = _gear select player_gear_secondary_weapon;
	_tertiary_weapon = _gear select player_gear_tertiary_weapon;
	_primary_magazine = _gear select player_gear_primary_magazine;
	_secondary_magazine = _gear select player_gear_secondary_magazine;
	_tertiary_magazine = _gear select player_gear_tertiary_magazine;
	
	if (undefined(_backpack)) exitWith {null};
	if (undefined(_backpack_weapons)) exitWith {null};
	if (undefined(_backpack_magazines)) exitWith {null};
	if (undefined(_primary_items)) exitWith {null};
	if (undefined(_secondary_items)) exitWith {null};
	if (undefined(_handgun_items)) exitWith {null};
	if (undefined(_uniform_items)) exitWith {null};
	if (undefined(_vest_items)) exitWith {null};
	if (undefined(_backpack_items)) exitWith {null};
	if (undefined(_assigned_items)) exitWith {null};
	if (undefined(_uniform)) exitWith {null};
	if (undefined(_vest)) exitWith {null};
	if (undefined(_headgear)) exitWith {null};
	if (undefined(_goggles)) exitWith {null};
	if (undefined(_primary_weapon)) exitWith {null};
	if (undefined(_secondary_weapon)) exitWith {null};
	if (undefined(_tertiary_weapon)) exitWith{null};
	if (undefined(_primary_magazine)) exitWith {null};
	if (undefined(_secondary_magazine)) exitWith {null};
	if (undefined(_tertiary_magazine)) exitWith{null};
	
	if (typeName _backpack != "STRING") exitWith {null};
	if (typeName _backpack_weapons != "ARRAY") exitWith {null};
	if (typeName _backpack_magazines != "ARRAY") exitWith {null};
	if (typeName _primary_items != "ARRAY") exitWith {null};
	if (typename _secondary_items != "ARRAY") exitWith {null};
	if (typeName _handgun_items != "ARRAY") exitWith {null};
	if (typeName _uniform_items != "ARRAY") exitWith {null};
	if (typeName _vest_items != "ARRAY") exitWith {null}; 
	if (typeName _backpack_items != "ARRAY") exitWith {null};
	if (typeName _assigned_items != "ARRAY") exitWith {null};
	if (typeName _uniform != "STRING") exitWith {null};
	if (typeName _vest != "STRING") exitWith {null}; 
	if (typeName _headgear != "STRING") exitWith {null};
	if (typeName _goggles != "STRING") exitWith {null};
	if (typeName _primary_weapon != "STRING") exitWith {null};
	if (typeName _secondary_weapon != "STRING") exitWith {null};
	if (typeName _tertiary_weapon != "STRING") exitWith {null};
	if (typeName _primary_magazine != "ARRAY") exitWith {null};
	if (typeName _secondary_magazine != "ARRAY") exitWith {null};
	if (typeName _tertiary_magazine != "ARRAY") exitWith {null};
	
	//it is important to restore first the gear containers in correct order (backpack, vest, uniform)
	removeUniform _player;
	removeVest _player;
	removeHeadgear _player;
	removeGoggles _player;
	
	//clear up all magazines, weapons, and items
	{_player removeMagazine _x} forEach (magazines _player);
	removeAllWeapons _player;
	{ [_player, _x] call removePlayerInventoryItem; } forEach ([_player] call player_get_all_items);
	
	if (([_player] call player_cop)) then {
		_handgun_items = CopStartGear_HandGun_items;
	};
	
	//HACK: create a temporary container so to hold the magazines for each weapon
	private["_pack", "_pack_class"];
	_pack_class = "B_AssaultPack_khk";
	_player addBackpack _pack_class; 
	_pack = unitBackpack _player;
	
	//restore primary weapon
	if (_primary_weapon != "") then {
		//HACK: clear the temporary container to hold the magazines
		clearWeaponCargoGlobal _pack;
		clearMagazineCargoGlobal _pack;
		
		{
			_pack addMagazineCargoGlobal [_x, 1];
		} forEach _primary_magazine;
		_player addWeapon _primary_weapon; 
		
		//restore primary weapon items
		{
			_player addPrimaryWeaponItem _x;
		} forEach (_primary_items);
		
		_player selectWeapon _primary_weapon;	
		_player action ["switchWeapon", _player, _player, 0];
		reload _player;
	};

	//restore secondary weapon
	if (_secondary_weapon != "") then {
		//HACK: clear the temporary container to hold the magazines
		clearWeaponCargoGlobal _pack;
		clearMagazineCargoGlobal _pack;
		
		{
			_pack addMagazineCargoGlobal [_x, 1];
		} forEach _secondary_magazine;
		_player addWeapon _secondary_weapon;
		
		//restore secondary weapon items
		{
			_player addSecondaryWeaponItem _x;
		} forEach (_secondary_items);
	};
	
	//restore tertiary weapon
	if (_tertiary_weapon != "") then {
		//HACK: clear the temporary container to hold the magazines
		clearWeaponCargoGlobal _pack;
		clearMagazineCargoGlobal _pack;
		
		{
			_pack addMagazineCargoGlobal [_x, 1];
		} forEach _tertiary_magazine;
		_player addWeapon _tertiary_weapon;
			
		//retore tertiary weapon items
		{
			_player addHandgunItem _x;
		} forEach (_handgun_items);
		
	};
	
	//HACK: once each weapon has magazines loaded, remove the temporary container
	removeBackpack _player;
		
	
	//restore the backpack
	if (not(_backpack == "" || _backpack == "none")) then {
		removeBackpack _player;
		_player addBackpack _backpack;
		
		private["_pack"];
		_pack = unitBackpack _player;
			
		clearWeaponCargoGlobal _pack;
		clearMagazineCargoGlobal _pack;
		
		private["_pack_weapons_class", "_pack_weapons_count", "_pack_magazines_class", "_pack_magazines_count"];
		_pack_weapons_class  = _backpack_weapons select 0;
		_pack_weapons_count	= _backpack_weapons select 1;
		_pack_magazines_class = _backpack_magazines select 0;
		_pack_magazines_count= _backpack_magazines select 1;
			
		private["_i"];
		
		_i = 0;
		while { _i < (count _pack_weapons_class) } do {
			private["_weapon_class", "_weapon_count"];
			_weapon_class = _pack_weapons_class select _i;
			_weapon_count = _pack_weapons_count select _i;
			_pack addWeaponCargoGlobal [_weapon_class, _weapon_count];
			_i = _i + 1;
		};
			
		_i = 0;
		while { _i < (count _pack_magazines_class) } do { 
			private["_magazine_class", "_magazine_count"];
			_magazine_class = _pack_magazines_class select _i;
			_magazine_count = _pack_magazines_count select _i;
			_pack addMagazineCargoGlobal [_magazine_class, _magazine_count];
			_i = _i + 1;
		};
		
		//restore back-pack items 
		_i = 0;
		while {_i < (count _backpack_items) } do {
			private["_item_class"];
			_item_class = _backpack_items select _i;
			_pack addItemCargoGlobal [_item_class, 1];
			_i = _i + 1;
		};
	
	};

	//fill up the vest first 
	if (_vest != "") then {
		diag_log format["player_set_gear: _vest = %1, _player = %2", _vest, _player];
		_player addVest _vest;
		{
			[_player, _x] call addPlayerInventoryItem;
		} forEach (_vest_items);
	};
	
	//fill up the uniform second
	if (_uniform != "") then {
		diag_log format["player_set_gear: _vest = %1, _player = %2", _uniform, _player];
		_player addUniform _uniform;
		{
			[_player, _x] call addPlayerInventoryItem;
		} forEach (_uniform_items);
	};
	
	//restore linked items
	{
		_player linkItem _x;
	} forEach (_assigned_items);
	

	//restore headgear
	_player addHeadgear _headgear;
	
	//restore goggles
	_player addGoggles _goggles;

};


player_reset_items = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	
	private["_headgear", "_goggles"];
	
	_headgear = [_player] call player_headgear;
	_goggles = [_player] call player_goggles;
	
	{ [_player, _x] call removePlayerInventoryItem; } forEach (assignedItems _player);
	{ [_player, _x] call removePlayerInventoryItem; } forEach (vestItems _player);
	{ [_player, _x] call removePlayerInventoryItem; } forEach (uniformItems _player);
	{ [_player, _x] call removePlayerInventoryItem; } forEach (backpackItems _player);
	
	if (not(_headgear == "")) then { 
		_player addHeadgear _headgear;
	};
	
	if (not(_goggles == "")) then {
		_player addGoggles _goggles;
	};
	
	//these are free items everyone gets
	_player linkItem "ItemMap";
	_player linkItem "ItemRadio";
	_player linkItem "ItemCompass";
	_player linkItem "ItemWatch";
};

player_reset_weapons = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	
	removeAllWeapons _player;
	{player removeMagazine _x} forEach (magazines _player);
	
	//remove the weapons from the player's backpack as well
	private["_backpack"];
	_backpack = unitBackpack _player;
	if (not(undefined(_backpack))) then {
		clearMagazineCargoGlobal _backpack;
		clearWeaponCargoGlobal _backpack;
	};
};

player_reset_gear = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	
	[_player] call player_reset_weapons;
	[_player] call player_reset_items;
};

player_remove_clothes = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	
	_player addUniform "None";
	_player addVest "None";
	_player addHeadgear "None";
	_player addGoggles "None";
};

cop_default_uniform = "U_B_CombatUniform_mcam";
civilian_default_uniform = "U_C_Poloshirt_burgundy";
opfor_default_uniform = "U_O_CombatUniform_ocamo";
insurgent_default_uniform = "U_I_CombatUniform_ocamo";

player_reset_clothes = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	
	[_player] call player_remove_clothes;
	
	if ([_player] call player_cop) exitWith {
		_player addUniform cop_default_uniform;
	};
	
	if ([_player] call player_civilian) exitWith {
		_player addUniform civilian_default_uniform;
	};
	
	if ([_player] call player_insurgent) exitWith {
		_player addUniform insurgent_default_uniform;
	};
	
	if ([_player] call player_opfor) exitWith {
		_player addUniform opfor_default_uniform;
	};
};



player_load_side_gear = {
	//player groupChat format["player_load_side_gear %1", _this];
	diag_log format["player_load_side_gear = %1", _this];
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};

	[_player] call player_reset_gear;
	private["_side"];
	_side = ([_player] call player_side);
	_side = toLower(str(_side));
	
	private["_backpack", "_backpack_weapons", "_backpack_magazines",
			"_primary_items", "_secondary_items", "_handgun_items", "_vest_items", "_uniform_items",
			"_vest", "_uniform", "_headgear", "_goggles",
			"_primary_weapon", "_secondary_weapon", "_tertiary_weapon",
			"_primary_magazine", "_secondary_magazine", "_tertiary_magazine"];
	
	_backpack = [_player, format["backpack_%1", _side]] call player_get_string;
	_backpack_weapons = [_player, format["backpack_weapons_%1", _side]] call player_get_array;
	_backpack_magazines = [_player, format["backpack_magazines_%1", _side]] call player_get_array;
	_primary_items = [_player, format["primary_items_%1", _side]] call player_get_array;
	_secondary_items = [_player, format["secondary_items_%1", _side]] call player_get_array;
	_handgun_items = [_player, format["handgun_items_%1", _side]] call player_get_array;
	_uniform_items = [_player, format["uniform_items_%1", _side]] call player_get_array;
	_vest_items = [_player, format["vest_items_%1", _side]] call player_get_array;
	_backpack_items = [_player, format["backpack_items_%1", _side]] call player_get_array;
	_assigned_items = [_player, format["assigned_items_%1", _side]] call player_get_array;
	_uniform = [_player, format["uniform_%1", _side]] call player_get_string;
	_vest = [_player, format["vest_%1", _side]] call player_get_string;
	_headgear = [_player, format["headgear_%1", _side]] call player_get_string;
	_goggles = [_player, format["goggles_%1", _side]] call player_get_string;
	_primary_weapon = [_player, format["primary_weapon_%1", _side]] call player_get_string;
	_secondary_weapon = [_player, format["secondary_weapon_%1", _side]] call player_get_string;
	_tertiary_weapon = [_player, format["tertiary_weapon_%1", _side]] call player_get_string;
	_primary_magazine = [_player, format["primary_magazine_%1", _side]] call player_get_array;
	_secondary_magazine = [_player, format["secondary_magazine_%1", _side]] call player_get_array;
	_tertiary_magazine = [_player, format["tertiary_magazine_%1", _side]] call player_get_array;
	

	private["_gear"];
	_gear = [];
	_gear set [player_gear_backpack, _backpack];
	_gear set [player_gear_backpack_weapons, _backpack_weapons];
	_gear set [player_gear_backpack_magazines, _backpack_magazines];
	_gear set [player_gear_primary_weapon_items, _primary_items];
	_gear set [player_gear_secondary_weapon_items, _secondary_items];
	_gear set [player_gear_handgun_weapon_items, _handgun_items];
	_gear set [player_gear_uniform_items, _uniform_items];
	_gear set [player_gear_vest_items, _vest_items];
	_gear set [player_gear_backpack_items, _backpack_items];
	_gear set [player_gear_assigned_items, _assigned_items];
	_gear set [player_gear_uniform, _uniform];
	_gear set [player_gear_vest, _vest];
	_gear set [player_gear_headgear, _headgear];
	_gear set [player_gear_goggles, _goggles];
	_gear set [player_gear_primary_weapon, _primary_weapon];
	_gear set [player_gear_secondary_weapon, _secondary_weapon];
	_gear set [player_gear_tertiary_weapon, _tertiary_weapon];
	_gear set [player_gear_primary_magazine, _primary_magazine];
	_gear set [player_gear_secondary_magazine, _secondary_magazine];
	_gear set [player_gear_tertiary_magazine, _tertiary_magazine];
	
	diag_log format["player_load_side_gear _gear = %1", _gear];
	
	[_player, _gear] call player_set_gear;
	
	
	private["_primary_weapon"];
	_primary_weapon = (primaryWeapon _player);
	
	if (_primary_weapon != "") then {
		_player selectWeapon _primary_weapon;
	};
	
	_player action ["switchweapon", _player, _player, 0];
};


side_gear_request_receive = {
	//player groupChat format["side_gear_request_receive %1", _this];
	diag_log format["side_gear_request_receive %1", _this];
	ARGV(0,_variable);
	ARGV(1,_request);

	if (undefined(_request)) exitWith {null};
	if (typeName _request != "ARRAY") exitWith {null};
	
	private["_player", "_gear"]; 
	_player = _request select 0;
	_gear = _request select 1;
	if (not([_player] call player_exists)) exitWith {null};

	diag_log format["side_gear_request_receive: _player = %1", _player];
	
	if (undefined(_gear)) then {
		_gear = [_player] call player_get_gear;
	};
	
	if (undefined(_gear)) exitWith {null};
	
	diag_log format["side_gear_request_receive: _gear = %1", _gear];
	
	
	private["_side"];
	_side = ([_player] call player_side);
	_side = toLower(str(_side));

	private["_backpack", "_backpack_weapons", "_backpack_magazines",
			"_primary_items", "_secondary_items", "_handgun_items", "_uniform_items",
			"_vest_items", "_backpack_items", "_assigned_items", "_uniform", "_vest", "_headgear", "_goggles",
			"_primary_weapon", "_secondary_weapon", "_tertiary_weapon",
			"_primary_magazine", "_secondary_magazine", "_tertiary_magazine"];
	
	
	_backpack = _gear select player_gear_backpack;
	_backpack_weapons = _gear select player_gear_backpack_weapons;
	_backpack_magazines = _gear select player_gear_backpack_magazines;
	_primary_items = _gear select player_gear_primary_weapon_items;
	_secondary_items = _gear select player_gear_secondary_weapon_items;
	_handgun_items = _gear select player_gear_handgun_weapon_items;
	_uniform_items = _gear select player_gear_uniform_items;
	_vest_items = _gear select player_gear_vest_items;
	_backpack_items = _gear select player_gear_backpack_items;
	_assigned_items = _gear select player_gear_assigned_items;
	_uniform = _gear select player_gear_uniform;
	_vest = _gear select player_gear_vest;
	_headgear = _gear select player_gear_headgear;
	_goggles = _gear select player_gear_goggles;
	_primary_weapon = _gear select player_gear_primary_weapon;
	_secondary_weapon = _gear select player_gear_secondary_weapon;
	_tertiary_weapon = _gear select player_gear_tertiary_weapon;
	_primary_magazine = _gear select player_gear_primary_magazine;
	_secondary_magazine = _gear select player_gear_secondary_magazine;
	_tertiary_magazine = _gear select player_gear_tertiary_magazine;
	
	[_player, format["backpack_%1", _side], _backpack] call player_set_string;
	[_player, format["backpack_weapons_%1", _side], _backpack_weapons] call player_set_array;
	[_player, format["backpack_magazines_%1", _side], _backpack_magazines] call player_set_array;
	[_player, format["primary_items_%1", _side], _primary_items] call player_set_array;
	[_player, format["secondary_items_%1", _side], _secondary_items] call player_set_array;
	[_player, format["handgun_items_%1", _side], _handgun_items] call player_set_array;
	[_player, format["uniform_items_%1", _side], _uniform_items] call player_set_array;
	[_player, format["vest_items_%1", _side], _vest_items] call player_set_array;
	[_player, format["backpack_items_%1", _side], _backpack_items] call player_set_array;
	[_player, format["assigned_items_%1", _side], _assigned_items] call player_set_array;
	[_player, format["uniform_%1", _side], _uniform] call player_set_string;
	[_player, format["vest_%1", _side], _vest] call player_set_string;
	[_player, format["headgear_%1", _side], _headgear] call player_set_string;
	[_player, format["goggles_%1", _side], _goggles] call player_set_string;
	[_player, format["primary_weapon_%1", _side], _primary_weapon] call player_set_string;
	[_player, format["secondary_weapon_%1", _side], _secondary_weapon] call player_set_string;
	[_player, format["tertiary_weapon_%1", _side], _tertiary_weapon] call player_set_string;
	[_player, format["primary_magazine_%1", _side], _primary_magazine] call player_set_array;
	[_player, format["secondary_magazine_%1", _side], _secondary_magazine] call player_set_array;
	[_player, format["tertiary_magazine_%1", _side], _tertiary_magazine] call player_set_array;
	
};

player_save_side_gear_setup = {
	if (not(isServer)) exitWith {null};
	//player groupChat format["player_save_side_gear_setup %1", _this];
	side_gear_request_buffer =  " ";
	publicVariableServer "side_gear_request_buffer";
	"side_gear_request_buffer" addPublicVariableEventHandler { _this call side_gear_request_receive;};
};


player_update_side_gear = {
	player groupChat format["player_update_side_gear %1", _this];
	ARGV(0,_player);
	ARGV(1,_gear);
	if (not([_player] call player_exists)) exitWith {null};
	if (undefined(_gear)) exitWith {null};

	side_gear_request_buffer = [_player, _gear];
	if (isServer) then {
		["", side_gear_request_buffer] call side_gear_request_receive;
	}
	else {
		publicVariable "side_gear_request_buffer";
	};
};

player_save_side_gear = {
	player groupChat format["player_save_side_gear %1", _this];
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};

	side_gear_request_buffer = [_player];
	if (isServer) then {
		["", side_gear_request_buffer] call side_gear_request_receive;
	}
	else {
		publicVariable "side_gear_request_buffer";
	};
};

player_save_side_position = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	
	private["_side"];
	_side = ([_player] call player_side);
	_side = toLower(str(_side));
	
	private["_position_atl", "_direction"];
	_position_atl = getPosATL _player;
	_direction = getDir _player;
	
	diag_log format["player_save_side_position %1 %2", _position_atl, _direction];
	[_player, format["position_atl_%1", _side], _position_atl] call player_set_array;
	[_player, format["direction_%1", _side], _direction] call player_set_scalar;
};

player_load_side_position = {
	player groupChat format["player_load_side_position %1", _this];
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {false};
	
	private["_side"];
	_side = ([_player] call player_side);
	_side = toLower(str(_side));
	
	private["_position_atl", "_direction"];
	_position_atl = [_player, format["position_atl_%1", _side]] call player_get_array;
	_direction = [_player, format["direction_%1", _side]] call player_get_scalar;
	
	
	if (not((count _position_atl) == 3)) exitWith {false};
	detach _player;
	_player setPosATL _position_atl;
	_player setDir _direction;
	
	player grouPChat format["_position_atl = %1", _position_atl];
	
	if ((_position_atl select 2) > 5000) exitWith {false};
	true
};




player_save_side_damage = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	
	private["_side"];
	_side = ([_player] call player_side);
	_side = toLower(str(_side));
	
	private["_damage"];
	_damage = damage _player;
	//diag_log format["Saving damage %1", _damage];
	diag_log format["player_save_side_damage = %1", _damage];
	[_player, format["damage_%1", _side], _damage] call player_set_scalar;
};

player_load_side_damage = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	
	private["_side"];
	_side = ([_player] call player_side);
	_side = toLower(str(_side));
	
	private["_damage"];
	_damage = [_player, format["damage_%1", _side]] call player_get_scalar;
	
	if (_damage < 0 ||  _damage > 1) exitWith {null};
	
	_player setDamage _damage;
};



player_load_side_vehicle = {
	//player groupChat format["player_load_side_vehicle %1", _this];
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {false};
	
	private["_side"];
	_side = ([_player] call player_side);
	_side = toLower(str(_side));
	
	private["_vehicle_name"];
	_vehicle_name = [_player, format["vehicle_driven_name_%1", _side]] call player_get_string;
	if (_vehicle_name == "") exitWith {false};
	
	private["_vehicle_class"];
	_vehicle_class = [_player, format["vehicle_driven_class_%1", _side]] call player_get_string;
	if (_vehicle_class == "") exitWith {false};
	
	//player groupChat format["_vehicle_name = %1, _vehicle_class = %2", _vehicle_name, _vehicle_class];
	
	private["_vehicle"];
	_vehicle = [_vehicle_name, _vehicle_class] call vehicle_recreate;
	if (undefined(_vehicle)) exitWith {false};
	
	private["_active_driver_uid", "_saved_driver_uid", "_player_uid", "_distance"];
	_player_uid = [_player] call stats_get_uid;
	_saved_driver_uid = [_vehicle, "saved_driver_uid"] call vehicle_get_string;
	_active_driver_uid = [_vehicle, "active_driver_uid"] call vehicle_get_string;
	
	//player groupChat format["_player_uid = %1", _player_uid];
	//player groupChat format["_saved_driver_uid = %1", _saved_driver_uid];
	//player groupChat format["_active_driver_uid = %1", _active_driver_uid];
	
	if (not((_active_driver_uid in ["", _saved_driver_uid]) && (_saved_driver_uid == _player_uid))) exitWith {
		player groupChat "Your vehicle has been stolen, destroyed, or moved while you were away!";
		false
	};
	
	[_player, _vehicle, false] call player_enter_vehicle;
	[_player, _vehicle] call vehicle_add;
	//player groupChat format["Vehicle recreated!"];
	true
};

player_save_side_vehicle = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	
	private["_side"];
	_side = ([_player] call player_side);
	_side = toLower(str(_side));
	
	private["_vehicle", "_driver", "_vehicle_name", "_vehicle_class"];
	_vehicle = (vehicle _player);
	_driver = driver _vehicle;
	_vehicle_name = "";
	_vehicle_class = "";
	
	if (not(_vehicle == _player) && driver(_vehicle) == _player) then {
		_vehicle_name = vehicleVarName _vehicle;
		_vehicle_class = typeOf _vehicle;
	};
	
	[_player, format["vehicle_driven_name_%1", _side], _vehicle_name] call player_set_string;
	[_player, format["vehicle_driven_class_%1", _side], _vehicle_class] call player_set_string;
};

player_save_side_inventory = {
	//diag_log format["player_save_side_inventory %1", _this];
	ARGV(0,_player);
	
	private["_inventory_name"];
	_inventory_name = [_player] call player_inventory_name;
	_inventory = [_player] call player_get_inventory;
	diag_log format["_inventory = %1", _inventory];
	[_player, _inventory_name, _inventory, false] call player_set_array_checked;
};


player_reset_side_inventory = {
	ARGV(0,_player);
	
	private["_inventory_name"];
	_inventory_name = [_player] call player_inventory_name;
	if (_inventory_name == "") exitWith {null};

	private["_empty_inventory"];
	_empty_inventory =
	[
		["keychain", ([1] call encode_number)], 
		["handy", ([1] call encode_number)]
	];
	
	[_player, _inventory_name, _empty_inventory, true] call object_setVariable;
};

player_inventory_name = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {""};
	private["_player_name"];
	_player_name = vehicleVarName _player;
	private["_side"];
	_side = ([_player] call player_side);
	_side = toLower(str(_side));
	(format["inventory_%1", _side])
};


player_get_inventory = {
	ARGV(0,_player);
	
	private["_inventory_name"];
	_inventory_name = [_player] call player_inventory_name;
	if (_inventory_name == "") exitWith {[]};
	
	private["_inventory"];
	_inventory = [_player, _inventory_name] call object_getVariable;
	(_inventory)
};

player_set_inventory = {
	ARGV(0,_player);
	ARGV(1,_inventory);
	
	if (undefined(_inventory)) exitWith {null};
	if (typeName _inventory != "ARRAY") exitWith {null};
	
	private["_inventory_name"];
	_inventory_name = [_player] call player_inventory_name;
	if (_inventory_name == "") exitWith {null};

	[_player, _inventory_name, _inventory, true] call object_setVariable;
};


object_storage_name = {
	ARGV(0,_object);
	if (undefined(_object)) exitWith {""};
	if (typeName _object != "OBJECT") exitWith {""};
	
	if (_object isKindOf "Man") exitWith {
		([_object] call player_inventory_name)
	};
	
	([_object] call vehicle_storage_name)
};

player_save_private_storage = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	
	private["_storage_name", "_storage"];
	_storage_name = "private_storage";
	_storage = [_player, _storage_name] call player_get_array;
	[_player, _storage_name, _storage, false] call player_set_array_checked;
};

player_exit_vehicle = {
	//player groupChat format["player_exit_vehicle %1", _this];
	ARGV(0,_player);
	ARGV(1,_vehicle);
	ARGV(2,_immediate);
	if (not([_player] call player_exists)) exitWith {null};
	if (undefined(_vehicle)) exitWith {null};
	if (undefined(_immediate)) exitWith {false};
	if (typeName _immediate != "BOOL") exitWith {false};
	
	_vehicle lock false;
	if (_immediate) then {
		moveOut _player;
	}
	else {
		private["_engine_state"];
		_engine_state =  isEngineOn _vehicle;
		_player action ["Eject", _vehicle];
		_vehicle engineOn _engine_state;
	};
	
	if (not(alive _player)) then {
		_player setPos [-1,-1,-1];
	};
};


player_enter_vehicle_cargo = { 
	player groupChat format["player_enter_vehicle_cargo %1", _this];
	ARGV(0,_player);
	ARGV(1,_vehicle);
	ARGV(2,_immediate);
	if (not([_player] call player_exists)) exitWith {false};
	if (undefined(_vehicle)) exitWith {false};
	if (undefined(_immediate)) exitWith {false};
	if (typeName _immediate != "BOOL") exitWith {false};
	
	_vehicle lock false;
	private["_empty_commander", "_empty_cargo"];
	_empty_commander = _vehicle emptyPositions "Commander";
	_empty_cargo = _vehicle emptyPositions "Cargo";
	

	if (_empty_commander > 0) exitWith {
		if (_immediate) then {
			_player moveInCommander _vehicle;
		}
		else {
			_player action ["getInCommmander", _vehicle];
		};
		true
	};
		
	if (_empty_cargo > 0) exitWith { 
		if (_immediate) then {
			_player moveInCargo _vehicle;
		}
		else {
			_player action ["getInCargo", _vehicle];
		};
		true
	};
	
	false
};



player_enter_vehicle = { 
	//player groupChat format["player_enter_vehicle %1", _this];
	ARGV(0,_player);
	ARGV(1,_vehicle);
	ARGV(2,_immediate);
	if (not([_player] call player_exists)) exitWith {false};
	if (undefined(_vehicle)) exitWith {false};
	if (undefined(_immediate)) exitWith {false};
	if (typeName _immediate != "BOOL") exitWith {false};
	
	_vehicle lock false;
	private["_empty_driver", "_empty_gunner", "_empty_commander", "_empty_cargo"];
	_empty_driver = _vehicle emptyPositions "Driver";
	_empty_gunner = _vehicle emptyPositions "Gunner";
	_empty_commander = _vehicle emptyPositions "Commander";
	_empty_cargo = _vehicle emptyPositions "Cargo";
	

	if (_empty_driver > 0) exitWith {
		if (_immediate) then {
			_player moveInDriver _vehicle;
		}
		else {
			_player action ["getInDriver", _vehicle];
		};
		true
	};
		
	if (_empty_gunner > 0) exitWith {
		if (_immediate) then {
			_player moveInGunner _vehicle;
		}
		else {
			_player action ["getInGunner", _vehicle];
		};
		true
	};
		
	if (_empty_commander > 0) exitWith {
		if (_immediate) then {
			_player moveInCommander _vehicle;
		}
		else {
			_player action ["getInCommmander", _vehicle];
		};
		true
	};
		
	if (_empty_cargo > 0) exitWith { 
		if (_immediate) then {
			_player moveInCargo _vehicle;
		}
		else {
			_player action ["getInCargo", _vehicle];
		};
		true
	};
	
	false
};



player_rejoin_camera = {
	ARGV(0,_delay);
	if (undefined(_delay)) exitWith {null};
	if (typeName _delay != "SCALAR") exitWith {null};
	
	private["_end_time"];
	_end_time = time + _delay;
	
	setPlayerRespawnTime 9999;
	[_end_time] spawn player_rejoin_camera_text;
	[_end_time] spawn  player_rejoin_camera_movement;
};



player_rejoin_camera_text = {
	ARGV(0,_deadTimeEnd);
	ARGV(1,_stopCount);
	
	sleep 1;
	cutText ["","black in"];
	while {(time < _deadTimeEnd) && (playerRespawnTime > 0) } do {
		sleep 1;
		private["_time_left"];
		_time_left = round(_deadTimeEnd - time);
		if (_time_left <= _stopCount) exitWIth {};
		cutText [format["%1 seconds remaining", _time_left], "plain"];
		
	};
};



player_rejoin_camera_choice = {
	player groupChat format["player_rejoin_camera_choice %1", _this];
	ARGV(0,_timeout);
	ARGV(1,_countdown);
	ARGV(2,_transition);
	
	if (undefined(_transition)) then {
		_transition = 0;
	};

	player groupChat format["Waiting ..."];
	waitUntil {(time > (_timeout - _countdown))};
	player groupChat format["Waiting ... complete."];
	setPlayerRespawnTime _countdown;
	[player, _transition] call BIS_fnc_respawnMenuPosition;
	waitUntil {(alive player)};
	player groupChat format["Spawn ... complete."];
	[player] call player_teleport_respawn_position;
	setPlayerRespawntime 9999;
};




player_rejoin_suicide = {
	player_rejoin_suicide_active = true;
	private["_pos"];
	_pos = getPos player;
	player setPos [(_pos select 0),(_pos select 1) ,10000];
	player setDamage 1;
	//waitUntil {not(isNil "player_rejoin_camera_complete") && {player_rejoin_camera_complete}};
};

player_rejoin_choice_active = false;
player_rejoin_choice = {
	player groupChat format["player_rejoin_choice %1", _this];
	ARGV(0,_countdown);
	player_rejoin_choice_active = true;
	titleText ["", "BLACK OUT", 0.0001];
	private["_pos"];
	player setDamage 1;
	//waitUntil {not(isNil "player_rejoin_camera_complete") && {player_rejoin_camera_complete}};
	
	waitUntil { not(alive player)};
	setPlayerRespawnTime _countdown;
	[player, 0] call BIS_fnc_respawnMenuPosition;
	waitUntil {(alive player)};
	player groupChat format["Spawn ... complete."];
	[player] call player_teleport_respawn_position;
	setPlayerRespawntime 9999;
	player groupChat format["Rejoin choice complete!"];
	titleText ["", "BLACK IN", 5];
	player_rejoin_choice_active = false;
};

player_rejoin_camera_movement = {
	player_rejoin_camera_complete = false;
	

	private["_deadcam_target_array"];
	_deadcam_target_array =
	[
		[17205.75,99198.17,-49454.65],
		[114238.47,12719.49,3040.26],
		[114238.47,12719.49,3040.28],
		[9396.48,-87407.76,-3495.99],
		[9396.48,-87407.76,-3495.72],
		[-85499.48,17145.94,-3497.86],
		[-81437.91,41177.12,-3500.26],
		[-68592.92,68496.92,-3504.91],
		[63894.18,99059.27,-3504.91],
		[57781.25,102312.13,-3505.24],
		[18155.12,112290.52,-3505.59],
		[114056.91,13559.94,-3506.64],
		[114056.91,13559.94,-3506.63],
		[12082.11,112377.59,-3507.94],
		[12082.11,112377.59,-3508.13],
		[12082.11,112377.59,-3507.88],
		[71475.13,94441.38,-3511.65],
		[79131.48,88521.11,-3512.17],
		[90116.62,77668.10,-3514.78],
		[93979.69,72896.55,-3515.45],
		[23989.44,112118.31,-3515.51],
		[111421.41,-10631.93,-3515.78],
		[111421.41,-10631.93,-3515.45],
		[111421.41,-10631.93,-3515.62],
		[-85207.23,22475.24,-3515.77],
		[-85269.09,22481.34,761.18],
		[-52542.68,-60176.11,-15820.92],
		[66335.50,-71098.57,-15831.98],
		[112733.68,9274.25,-15848.19],
		[112733.68,9274.25,-15848.03],
		[112733.68,9274.25,-15848.01],
		[112733.68,9274.25,-15848.28],
		[15793.38,-87445.16,-1975.57],
		[15793.38,-87445.16,-1975.58],
		[-85045.43,23679.19,-1976.55],
		[-2976.49,110953.34,-1977.04],
		[-2976.49,110953.34,-1976.94],
		[25975.48,-86795.57,-1977.29],
		[25975.48,-86795.57,-1977.28],
		[30152.87,-86219.98,-1977.49],
		[114191.58,8919.13,-1977.75],
		[114186.95,8335.76,-1978.02],
		[13212.45,-87514.59,-1978.28],
		[13212.45,-87514.59,-1978.39],
		[13328.19,-76559.05,-45508.50]
	];

	private["_deadcam_position_array", "_x_adjust", "_y_adjust", "_deadcamlogic_pos"];
	_deadcamlogic_pos = getPos deadcamlogic;
	
	//re-adjust the position to be anchored more or less around the deadcamlogic marker
	_x_adjust = (_deadcamlogic_pos select 0) - 6575.55;
	_y_adjust = (_deadcamlogic_pos select 1) - 2451.36;
	_z_adjust = 10;
		
	_deadcam_position_array   =
	[
		[6573.78,2365.67,19.16],
		[6563.33,2409.16,3.60],
		[6598.98,2409.17,3.60],
		[6615.21,2406.75,2.60],
		[6616.97,2469.89,3.60],
		[6619.17,2455.47,4.36],
		[6650.88,2457.08,5.60],
		[6719.63,2400.90,6.92],
		[6712.46,2403.60,7.08],
		[6712.08,2419.00,8.08],
		[6727.18,2457.75,20.08],
		[6724.96,2465.48,15.08],
		[6764.31,2465.91,7.08],
		[6771.92,2463.60,20.08],
		[6771.38,2538.25,21.08],
		[6771.13,2550.88,22.08],
		[6769.29,2568.52,23.08],
		[6793.91,2598.42,24.08],
		[6825.21,2646.20,25.08],
		[6839.44,2658.20,25.08],
		[6869.00,2658.38,25.08],
		[6909.94,2668.50,25.35],
		[6942.29,2667.94,25.33],		
		[6846.04,2627.05,20.37],
		[6827.04,2538.54,18.41],
		[6742.96,2468.32,18.69],
		[6769.18,2697.18,15.22],
		[6792.32,2615.79,10.43],
		[6679.88,2556.44,6.43],
		[6560.67,2516.16,6.43],
		[6588.56,2525.49,6.43],
		[6551.50,2521.79,6.43],
		[6606.49,2523.45,1.69],
		[6606.37,2476.85,1.69],
		[6602.42,2474.65,1.69],
		[6578.19,2474.97,1.69],
		[6574.55,2488.17,1.69],
		[6574.79,2497.03,1.69],
		[6573.99,2491.74,5.46],
		[6574.33,2490.64,4.93],
		[6574.66,2458.02,4.93],
		[6597.66,2457.95,4.93],
		[6599.95,2459.04,5.23],
		[6599.66,2459.05,18.31],
		[6575.55,2451.36,19.46]
	];


	private["_deadcam_kameraposition", "_position"];
	
	_deadcam_kameraposition = round(random (count _deadcam_position_array - 1));
	_position = (_deadcam_position_array select _deadcam_kameraposition);
	_position = [((_position select 0) + _x_adjust), ((_position select 1) + _y_adjust), ((_position select 2) + _z_adjust)];
	
	//INITIATE THE CAMERA
	private["_camera"];
	_camera = "camera" camCreate _position;
	_camera cameraEffect ["Internal", "LEFT"];
	_camera camPreparePos [0,0,0];
	
	_camera camSetPos _position;
	_camera camSetTarget (_deadcam_target_array select _deadcam_kameraposition);
	_camera camSetFOV 0.700;
	if (not(sunOrMoon > 0)) then {
		camUseNVG true;
	};
	_camera camCommit 1;
	waitUntil {camCommitted _camera};

	
	//CYCLE THE CAMERA POSITIONS
	while {true} do {
		_deadcam_kameraposition = _deadcam_kameraposition + 1;
		if (count _deadcam_position_array <= _deadcam_kameraposition) then {
			_deadcam_kameraposition = 0;
		};
		
		private["_position", "_target"];

		_position = _deadcam_position_array select _deadcam_kameraposition;
		_target = _deadcam_target_array   select _deadcam_kameraposition;
		
		_position = [((_position select 0) + _x_adjust), ((_position select 1) + _y_adjust), ((_position select 2) + _z_adjust)];
		

		_camera camSetPos _position;
		_camera camSetTarget _target;
		_camera camSetFOV 0.7;
		_camera camCommit 5;
		
		waitUntil {(camCommitted _camera) || (playerRespawnTime <= 0)};
		if (playerRespawnTime <= 0) exitWith {};

	};

	//DESTROY THE CAMERA
	_camera cameraEffect ["terminate","back"];
	//titleCut [" ","Black in"];
	camDestroy _camera;
	camUseNVG false;
	//titlefadeout 0;
	//0 cutfadeout 0;
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [6];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 5;
	
	setPlayerRespawnTime 9999;
	player_rejoin_camera_complete = true;
};




player_dead_camera_blackout_message = {
	private["_message"];
	private["_extraddeadtime", "_civskilled", "_copskilled", "_deadtimes"];
	
	_extradeadtime = [player, "extradeadtime"] call player_get_scalar;
	_selfkilled = [player, "selfkilled"] call player_get_scalar;
	_deadtimes = [player, "deadtimes"] call player_get_scalar;
	_message = format["You have now died %1 time(s) and suicided %2 time(s) and have to wait extra %3 seconds to respawn.", _deadtimes, _selfkilled, _extradeadtime];

	_message
};

player_minimum_dead_time = {
	//this value should be always set >= the the respawnDelay in description.ext
	30
};

player_maximum_dead_time = {
	180
};

player_dead_wait_time = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};

	private["_minimum_deadtime"];
	_minimum_deadtime = call player_minimum_dead_time;
	_maximum_deadtime = call player_maximum_dead_time;
	
	private["_extradeadtime", "_deadtime"];
	_extradeadtime = [_player, "extradeadtime"] call player_get_scalar;
	_deadtime = _extradeadtime + _minimum_deadtime;
	_deadtime = ((_maximum_deadtime) min (_deadtime));
	
	_deadtime
};




player_rejoin_camera  = {
	player groupChat format["player_rejoin_camera %1", _this];
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {};


	private["_delay"];
	_delay = [_player] call player_dead_wait_time;
	
	private["_end_time"];
	
	private["_jailtimeleft", "_min_dead_time"];
	_min_dead_time = call player_minimum_dead_time;
	_jailtimeleft = [_player, "jailtimeleft"] call player_get_scalar;
	if (_jailtimeleft > _min_dead_time) then { 
		_jailtimeleft = _jailtimeleft - _min_dead_time;
		[_player, "jailtimeleft", _jailtimeleft] call player_set_scalar;
		player groupChat format["Your prison sentence has been reduced by %1 second/s", _min_dead_time];
		_delay  = _min_dead_time;
	};
	
	_delay = 30;
	_end_time = time + _delay;
	setPlayerRespawnTime 9999;
	[_end_time, 5] spawn player_rejoin_camera_choice;
	[_end_time, 6] spawn player_rejoin_camera_text;
	[] call player_rejoin_camera_movement;
};




player_dead_camera = {
	if (defined(player_rejoin_suicide_active)) exitWith {
		player_rejoin_suicide_active = nil;
	};
	
	ARGV(0,_player);
	
	if (not([_player] call player_exists)) exitWith {null};
	
	private["_pos"];


	_pos = (getPosATL _player);
	_camera = "camera" camCreate [(_pos select 0), (_pos select 1), ((_pos select 2) + 3)];
	_camera camPrepareTarget player;
	_camera cameraEffect ["Internal", "LEFT"];
	
	if (not((_pos select 2) > 5000 || ((_pos select 1) < -1000))) then {
		_camera camPreparePos [(_pos select 0), (_pos select 1), ((_pos select 2) + 40)];
	};
	_camera camPrepareFOV 1;
	
	if (not(sunOrMoon > 0)) then {
		camUseNVG true;
	};
	 
	_camera camCommitPrepared 10;
	_blackOut_message = call player_dead_camera_blackout_message;
	cutText [_blackOut_message, "black out", 9.5];
	waitUntil { camCommitted _camera };

	
	//DESTROY THE CAMERA
	camDestroy _camera;
	camUseNVG false;
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [6];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 5;
};

player_reset_stats = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	[_player, "deadtimes", 1] call player_update_scalar;
	[_player, "extradeadtime", 30] call player_update_scalar;
};



player_init_arrays = {
	while {true} do {
		private["_complete"];
		_complete = ([player] call player_human) || isServer;
		if (_complete) exitWith {null};
	};
	
	private["_player"];
	_player = player;
	
	playerstringarray = 
	[
		"civ1","civ2","civ3","civ4","civ5","civ6","civ7","civ8","civ9","civ10",
		"civ11","civ12","civ13","civ14","civ15","civ16","civ17","civ18","civ19","civ20",
		"civ21","civ22","civ23","civ24","civ25","civ26","civ27","civ28","civ29","civ30",
		"civ31","civ32","civ33","civ34","civ35","civ36","civ37","civ38","civ39","civ40",
		"civ41","civ42","civ43","civ44","civ45","civ46","civ47","civ48","civ49","civ50",
		"civ51","civ52","civ53","civ54","civ55","civ56","civ57","civ58","civ59","civ60",
		"civ61","civ62","civ63","civ64",
		"ins1","ins2","ins3","ins4","ins5","ins6","ins7","ins8","ins9","ins10",
		"opf1","opf2","opf3","opf4","opf5","opf6","opf7","opf8","opf9","opf10",
		"cop1","cop2","cop3","cop4","cop5","cop6","cop7","cop8","cop9","cop10",
		"cop11","cop12","cop13","cop14","cop15","cop16","cop17","cop18","cop19","cop20"
	];


	role = _player;
	rolestring = str(_player);
	rolenumber = (playerstringarray find rolestring) + 1;

	//player groupChat format["role = %1, rolestring = %2,  rolenumber = %3", role, rolestring, rolenumber];

	iscop = [_player] call player_cop;
	isciv = [_player] call player_civilian;
	isopf = [_player] call player_opfor;
	isins = [_player] call player_insurgent;
	
	_player addMPEventHandler ["MPKilled", { _this call player_handle_mpkilled }];
	_player addMPEventHandler ["MPRespawn", { _this call player_handle_mprespawn }];
};


player_objects_filter = {
	ARGV(0,_target);
	ARGV(1,_objects);
	ARGV(2,_filter_function);
	
	if (typeName _objects != "ARRAY") exitWith {[]};
	if (undefined(_filter_function)) exitWith {[]};
	if (typeName _filter_function != "CODE") exitWith {[]};
	
	private["_result"];
	_result = [];
	{
		private["_cobject", "_evaluation"];
		_cobject = _x;		
		_evaluation = ([_target, _cobject] call _filter_function);
		if (_evaluation) then {
			_result = _result + [_cobject];
		};
	} forEach _objects;
	
	(_result)
};

player_count_carshop = {
	ARGV(0,_player);
	ARGV(1,_distance);
	
	if (not([_player] call player_human)) exitWith { 0};
	if (undefined(_distance)) exitWith {0};
	if (typeName _distance != "SCALAR") exitWith {0};
	
	private["_carshops"];
	
	private["_filter_function"];
	_filter_function = {
		private["_target", "_object", "_player", "_distance"];
		ARGV(0,_target);
		ARGV(1,_object);
		
		_player = _target select 0;
		_distance = _target select 1;
		((_player distance _object) <= _distance)
	};
	
	private["_filtered"];
	_filtered = [[_player, _distance], carshoparray, _filter_function] call player_objects_filter;
	((count _filtered) > 0)
};

player_count_atm = {
	ARGV(0,_player);
	ARGV(1,_distance);
	
	if (not([_player] call player_human)) exitWith { 0};
	if (undefined(_distance)) exitWith {0};
	if (typeName _distance != "SCALAR") exitWith {0};
	
	private["_filter_function"];
	_filter_function = {
		private["_target", "_object"];
		ARGV(0,_target);
		ARGV(1,_object);
		([_object] call object_atm)
	};
	
	private["_filtered"];
	private["_near_objects"];
	_near_objects = nearestobjects [_player, object_atm_classes, _distance];
	_filtered = [[_player, _distance], _near_objects, _filter_function] call player_objects_filter;
	((count _filtered) > 0)
};


player_count_vehicle = {
	ARGV(0,_player);
	ARGV(1,_distance);
	ARGV(2,_locked);
	ARGV(3,_mobile);
	
	if (not([_player] call player_human)) exitWith {0};
	if (undefined(_distance)) exitWith {0};
	if (undefined(_locked)) exitWith {0};
	if (undefined(_mobile)) exitWith {0};
	if (typeName _distance != "SCALAR") exitWith {0};
	if (typeName _locked != "BOOL") exitWith {0};
	if (typeName _mobile != "BOOL") exitWith {0};
	
	private["_near_vehicles"];
	//_near_vehicles =  nearestObjects  [_player, ["Car", "Motorcycle", "Tank", "Helicopter", "Plane"], _distance];
	
	_near_vehicles = nearestObjects [_player, ["Car","Tank", "Motorcycle", "Helicopter", "Plane"], _distance];
	
	
	private["_filter_function"];
	_filter_function = {
		private["_target", "_object", "_player", "_locked", "_mobile"];
		ARGV(0,_target);
		ARGV(1,_object);
		
		_player = _target select 0;
		_locked = _target select 1;
		_mobile = _target select 2;
		
		private["_canMove", "_isLocked"];
		_canMove = canMove _object;
		_isLocked = (locked _object) == 2;
		
		_mobile = if (_mobile) then {_canMove} else {not(_canMove)};
		_locked = if (_locked) then {_isLocked} else { not(_isLocked)};
		(_mobile && _locked)
	};
	
	private["_filtered"];
	_filtered = [[_player, _locked, _mobile], _near_vehicles, _filter_function] call player_objects_filter;
	((count _filtered) > 0)
};


player_side_spawn_marker = {
	ARGV(0,_side);
	
	private["_default_respawn"];
	_default_respawn = "respawn_civilian";
	if (undefined(_side)) exitWith {_default_respawn};
	if (typeName _side != "SIDE") exitWith {_default_respawn};
	
	if (_side == west) exitWith { "respawn_west" };
	if (_side == east) exitWith { "respawn_east" };
	if (_side == resistance) exitWith { "respawn_guerrila" };
	if (_side == civilian) exitWith { "respawn_civilian" };
	
	_default_respawn
};

player_teleport_spawn = {
	ARGV(0,_player);
	private["_respawn_marker"];
	_respawn_marker = [([_player] call player_side)] call player_side_spawn_marker;
	_player setVelocity [0,0,0];
	_player setPos (getMarkerPos _respawn_marker);
};

player_distance_side_spawn = {
	ARGV(0,_player);
	ARGV(1,_side);
	if (not([_player] call player_exists)) exitWith {-1};
	if (undefined(_side)) exitWith {-1};
	if (typeName _side != "SIDE") exitWith {-1};
	
	private["_respawn_marker"];
	_respawn_marker = [_side] call player_side_spawn_marker;
	(_player distance (getMarkerPos _respawn_marker))
};

player_near_side_spawn = {
	ARGV(0,_player);
	ARGV(1,_side);
	ARGV(2,_distance);
	
	if (undefined(_distance)) exitWith {false};
	if (typeName _distance != "SCALAR") exitWith {false};
	
	private["_cdistance"];
	_cdistance = [_player, _side] call player_distance_side_spawn;
	if (_cdistance < 0) exitWith {false};
	(_cdistance <= _distance)
};

player_stranded = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {false};
	
	private["_near_atm", "_has_cash", "_has_lockpicks",
			"_near_carhop", "_near_locked_mobile_vehicle", "_has_repair_kit",
			"_near_locked_inmobile_vehicle", "_near_unlocked_mobile_vehicle", 
			"_near_unlocked_inmobile_vehicle", "_near_own_spawn", "_driving_movable_vehicle"];
			
	
	private["_marked_distance", "_unmarked_distance"];
	_marked_distance = 500; //(for stuff that is marked on map, player can look it up and walk, or run to those)
	_unmarked_distance = 50; //(for stuff that is not marked on map, player would have to find it in the near vicinity)
	
	_near_atm = [_player, _marked_distance] call player_count_atm;
	_near_carhop = [_player, _marked_distance] call player_count_carshop;
	_near_locked_mobile_vehicle = [_player, _unmarked_distance, true, true] call player_count_vehicle;
	_near_locked_inmobile_vehicle = [_player, _unmarked_distance, true, false] call player_count_vehicle;
	_near_unlocked_mobile_vehicle = [_player, _unmarked_distance, false, true] call player_count_vehicle;
	_near_unlocked_inmobile_vehicle = [_player, _unmarked_distance, false, false] call player_count_vehicle;
	_has_repair_kit = (([player, "reparaturkit"] call inventory_get_item_amount) > 0);
	_has_lockpicks = (([player, "lockpick"] call inventory_get_item_amount) > 5);
	_has_cash = (([player, "money"] call inventory_get_item_amount) > 1000);
	_near_own_spawn = [_player, ([_player] call player_side), _marked_distance] call player_near_side_spawn;
	private["_vehicle"];
	_vehicle = (vehicle _player);
	_driving_movable_vehicle = ((_vehicle != _player) && canMove _vehicle && (driver(_vehicle) == _player));
	
	

	/*
	player groupChat format["_driving_movable_vehicle = %1", _driving_movable_vehicle];
	player groupChat format["_near_own_spawn = %1", _near_own_spawn];
	player groupChat format["_near_atm = %1", _near_atm];
	player grouPChat format["_near_carhop = %1", _near_carhop];
	player groupChat format["_near_locked_mobile_vehicle = %1", _near_locked_mobile_vehicle];
	player groupChat format["_near_locked_inmobile_vehicle = %1", _near_locked_inmobile_vehicle];
	player groupChat format["_near_unlocked_mobile_vehicle = %1", _near_unlocked_mobile_vehicle];
	player groupChat format["_near_unlocked_inmobile_vehicle = %1", _near_unlocked_inmobile_vehicle];
	player groupChat format["_has_repair_kit = %1", _has_repair_kit];
	player groupChat format["_has_lockpicks = %1", _has_lockpicks];
	player groupChat format["_has_cash = %1", _has_cash];
	*/
	
	(
	not(
		(_driving_movable_vehicle) ||
		(_near_own_spawn) ||
		(_near_atm && _near_carhop) ||
		(_has_cash && _near_carhop) ||
		(_near_unlocked_mobile_vehicle) ||
		(_has_repair_kit && _near_unlocked_inmobile_vehicle) ||
		(_has_lockpicks && _near_locked_mobile_vehicle) ||
		(_has_lockpicks && _has_repair_kit && _near_locked_inmobile_vehicle)
		)
	)
	
};

player_reset_ui = {
	uisleep 0.5;
	closeDialog 0;
};

isleep = {
	ARGV(0,_sleep);
	_sleep = serverTime + _sleep;
	waitUntil { _sleep < serverTime };
};

player_continuity = { 
	if (not(isClient)) exitWith {null};
	
	while {true} do {
		private["_complete"];
		_complete = ([player] call player_human);
		if (_complete) exitWith {null};
	};
	
	private["_player"];
	_player = player;
	[_player] call vehicle_load;
	[_player] call player_reset_clothes;
	[_player] call player_reset_gear;
	
	server setVariable [(getPlayerUID _player), _player, true];

	if ([_player] call player_get_dead) then {
		[] call player_rejoin_suicide;
	}
	else {
		_player allowDamage false;
		[_player] call player_load_side_gear;
		[_player] call player_load_side_damage;
		
		if (not([_player] call player_load_side_vehicle)) then {
			if (not([_player] call player_load_side_position)) then {
				[10] spawn player_rejoin_choice;
			};
		};
		_player allowDamage true;
	};
	
	titleText ["", "BLACK IN", 5];
	5 fadeSound 1;
	[_player, false] call player_set_dead;
};

player_despawn = { _this spawn {
	//player groupChat format["player_despawn %1", _this];
	ARGV(0,_unit);
	ARGV(1,_delay);
	
	if (undefined(_unit)) exitWith {null};
	if (typeName _unit != "OBJECT") exitWith {null};
	if (isNull _unit) exitWith {null};
	if (undefined(_delay)) exitWith {null};
	if (typeName _delay != "SCALAR") exitWith {null};

	_delay = ((_delay - 5) max (0));
	//diag_log format["player_despawn waiting %1, %2", _unit, _delay];
	[_delay] call isleep;
	
	if ([_unit] call under_base) exitWIth {
		_unit setPos [0,0,0];
		deleteVehicle _unit;
	};
	
	//diag_log format["player_despawn hiding %1", _unit];
	private["_i"];
	_i = 0;
	while { _i < 5 } do {
		hideBody _unit;
		sleep 1;
		_i = _i + 1;
	};

	//diag_log format["player_despawn deleting %1", _unit];
	//_unit setPos [-1,-1,-1];
	
	if (isServer) then {
		sleep 5;
		deleteVehicle _unit;
	};
};};


player_reset_prison = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	if (([_player, "restrained"] call player_get_bool) && not(iscop)) then {
		private["_message"];
		_message = format["%1-%2 aborted while restrained, he has been sent to prison", _player, (name _player)];
		format['server globalChat toString(%1);', toArray(_message)] call broadcast;
		
		[_player, 15] call player_prison_time;
		[_player, 100] call player_prison_bail;
		[_player] call player_prison_convict;
	}
	else { if (([_player] call player_get_arrest) && not(iscop))then {
		private["_message"];
		_message = format["%1-%2 has been sent to prison to complete his previous sentence", _player, (name _player)];
		format['server globalChat toString(%1);', toArray(_message)] call broadcast;
		[_player] call player_prison_convict;
	}
	else {if ([_player, "roeprison"] call player_get_bool) then {
		[_player] call player_prison_roe;
	};};};
};

player_set_saved_group = {
	ARGV(0,_player);
	ARGV(1,_group);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_group)) exitWith {null};
	if (typeName _group != "GROUP") exitWith {null};
	
	[_player, "saved_group", _group, true] call object_setVariable;
};

player_get_saved_group = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	private["_group"];
	_group = [_player, "saved_group"] call object_getVariable;
	(_group)
};


player_spawn = { _this spawn {
	ARGV(0,_player);
	ARGV(1,_first_time);
	
	if (not([_player] call player_exists)) exitWith {null};
	if (undefined(_first_time)) exitWith {null};
	if (typeName _first_time != "BOOL") exitWith {null};
	
	waitUntil { alive _player };
	
	[_player] call object_attachStorage;
	server setVariable [(getPlayerUID _player), _player, true];
	
	if (not(_first_time)) then {
		[_player] call player_reset_gear; //start from clean slate
		[_player] call player_reset_clothes;
		[_player] call player_load_side_gear;
		
		//only cops get to keep their full gear
		if (not([_player] call player_cop)) then {
			[_player] call player_reset_gear;
		};
	};
	
	if (_first_time) then {
		[_player] call player_intro_text;
	};
	

	[_player] call player_reset_prison;
	//call respawn_retribution;
	[_player] call player_init_stats;
	
	//mark the player alive when we are done with the dead camera
	[_player, false] call player_set_dead;
};};



player_wait = {
	ARGV(0,_flag_name);
	if (undefined(_flag_name)) exitWith {null};
	if (typeName _flag_name != "STRING") exitWith {null};
	private["_flag_variable"];
	_flag_variable = missionNamespace getVariable _flag_name;
	if (undefined(_flag_variable)) exitWith {null};
	waitUntil { (missionNamespace getVariable _flag_name)};
};

player_intro_text = {_this spawn {
	private["_intro_messages"];
	
	_intro_messages = [
		"Welcome to Stratis Life, an RPG mission. \n\n Feel free to copy or edit our mission file. \n\n This is an international server, everyone is welcome.",
		"Join our teamspeak at tlr.ts3dns.com!",
		"Cops must join TS3, may not abuse their power or teamkill.",
		"Racial slurs are prohibited here. \n\n Foul language and heated arguments are OK. \n\n Racist harassment of other players is NOT.",
		"Visit www.takistanliferevolution.com for more info.\n\nPlease be helpful to new players and don't grief."
	];

	private["_delay"];
	_delay = 5;
	
	{
		private["_message"];
		_message = _x;
		titleText [_message, "PLAIN", 0];
		sleep _delay;
	} forEach _intro_messages;
	
	3 fademusic 0;
	
};};


player_drop_item_init_handler_persistent = {
	ARGV(0,_object);
	ARGV(1,_item);
	ARGV(2,_name);
	
	if (undefined(_object)) exitWith {};
	if (undefined(_item)) exitWith {};
	if (undefined(_name)) exitWith {};
	if (typeName _object != "OBJECT") exitWith {};
	if (isNull _object) exitWith {};
	if (typeName _item != "STRING") exitWith {};
	if (typeName _name != "STRING") exitWith {};
	
	_object setVehicleVarName _name;
	missionNamespace setVariable [_name, _object];
	[_object, _item] call mine_ore_init_handler_persistent;

};






player_drop_item = {
	ARGV(0,_player);
	ARGV(1,_item);
	ARGV(2,_amount);
	ARGV(3,_data);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_item)) exitWith {null};
	if (undefined(_amount)) exitWith {null};
	if (typeName _item != "STRING") exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	if (_item == "handy") exitWith {null};
	
	private["_class", "_object"];
	_class = [_item] call item2class;
	if (undefined(_class)) exitWith {null};
	
	
	private["_data"];
	_data = _item call inventory_get_item_array;
	
	if (ITEM_DATA_ANIMAL(_data)) then {
		private["_spawn_location"];
		_spawn_location = if (ITEM_DATA_ANIMAL_SEA(_data)) then {[0,0,0]} else {[3000,3000,50]};
		_object = createAgent [_class, _spawn_location, [], 0, "CAN_COLLIDE"];
		_object setDamage 1;
		sleep 0.5; //give some time for the dead animation to play
		_object setPos (position _player);
	}
	else {
		_object = _class createVehicle (position _player);
	};
	
	private["_in_water"];
	_in_water = [_player] call object_in_water;
	
	if (alive _player && not(_in_water)) then {
		_object setPosASL (ATLtoASL(_player modeltoWorld [0,0.5,0]));
		//_object setposASL getposASL _player;
	};
	
	if (alive _player && _in_water) then {
		_object attachTo [_player, [0,0.5,0], "RightHand"];
		detach _object;
	};
	
	
	//give a name to the object
	private["_object_name"];
	_object_name = format["%1_%2_%3_%4", _class, (getPlayerUID _player), round(time), round(random(time))];
	//[[_object, _object_name], "player_drop_item_init_handler_persistent", true, true] spawn BIS_fnc_MP;
	[[_object, _item, _object_name], "player_drop_item_init_handler_persistent", true, true, _object] spawn jip_register;
	waitUntil {not(isNil _object_name)};
	
	
	//set the droppable item meta-data
	[_object, _item, _amount, _data] call object_item_set_data;
	_object
};
	


player_teleport_respawn_position = {
	ARGV(0,_player);
	if (undefined(_player)) exitWith {};
	
	if (undefined(attachRef)) then {
		attachRef = [] call object_create_attach_ref;
	};
	
	private["_respawn"];
	_respawn = missionnamespace getvariable ["BIS_fnc_respawnMenuPosition_respawn",""];

		
	if (isNil "_respawn") exitWith {};
	if ((typeName _respawn == "STRING") && {_respawn == ""}) exitWith {};
	
	if (typeName _respawn == "OBJECT" && {_respawn isKindOf "Air" || _respawn isKindOf "LandVehicle" || _respawn isKindOf "Ship"}) then {
		private["_vehicle"];
		_vehicle = _respawn;
		//Driver
		if (!alive (driver _vehicle) && !(lockedDriver _vehicle)) then {
			_player moveInDriver _vehicle;
		};
		if (_player in _vehicle) exitwith {};

		//Turrets
		{
			if (!alive (_vehicle turretunit _x) && !(_vehicle lockedturret _x)) then {
				_player moveinturret [_vehicle,_x];
			};
		} foreach ([_vehicle,[]] call bis_fnc_getTurrets);
		if (_player in _vehicle) exitwith {};

		//Cargo
		if ((_vehicle emptyPositions "cargo") > 0 && (locked _vehicle) <= 1) then {
			_player moveincargo _vehicle;
		};
		if (_player in _vehicle) exitwith {};
		
		_player setPos getPos _vehicle;
	}
	else { if (typeName _respawn == "STRING") then {
		_respawn = missionNamespace getVariable [_respawn + "_proxy", _respawn];
		if (typeName _respawn == "STRING") exitWith {
			_player setPos (getMarkerPos _respawn);
		};
		
		private["_rad", "_dir"];
		_rad = [_respawn, "radius", 0] call object_getVariable;
		_rad = (random _rad);
		_dir = random(360);
		
		private["_pos"];
		_pos = _respawn modelToWorld [0,0,0];
		
		//convert from polar coordinates to X, Y
		private["_x", "_y", "_xr", "_yr"];
		_xr = _rad * cos(_dir);
		_yr = _rad * sin(_dir);
		player globalChat format["_xr = %1, _yr = %2, _dir = %3", _xr, _yr, _dir];
		
		_player attachTo [_respawn, [_xr,_yr,0]];
		detach _player;
	}
	else { if (typeName _respawn == "ARRAY") then {	
		_player attachTo [attachRef, _respawn];
		detach _player;
	};};};
};



player_drop_inventory = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	
	if ([_player] call player_cop) then {
		private["_amount"];	
		_amount = ([_player, "money"] call inventory_get_item_amount);
		if (_amount <= 0) exitWith {null};
		
		[_player, "money", _amount] call player_drop_item;
		[_player, "money", -(_amount)] call inventory_add_item;
	}
	else {
		private["_i"];
		_i = 0;
		
		private["_inventory"];
		_inventory = [_player] call player_get_inventory;
		if (undefined(_inventory)) exitWith {};
		while { _i < (count _inventory) } do {
			private["_item", "_amount"];
			_item   = ((_inventory select _i) select 0);
			_amount = ([player, _item] call inventory_get_item_amount);

			if (_amount > 0 and (_item call inventory_get_item_droppable)) then {
				[_player, _item, _amount] call player_drop_item;
			};
			_i = _i + 1;
		};
		[_player] call player_reset_side_inventory;
	};
};

player_escape_menu_check = { _this spawn {
	if (not(isClient)) exitWith {null};
	disableSerialization;
	sleep 10;

	while {true} do {
		waitUntil {not(isnull (findDisplay 49))};

		_ctrl = (findDisplay 49) displayCtrl 1010;
		_ctrl ctrlEnable false;
		//escape menu opened
		_enCtrl = [_ctrl] spawn {
			disableSerialization;
			ARGV(0,_ctrl);
			_stext = ctrlText _ctrl;
			private["_i"];
			_ctrl buttonSetAction "respawnButtonPressed = true;";
			for "_i" from 30 to 1 step -1 do {
				if (isnull (findDisplay 49)) exitWith {null};
				_text = _stext + format ["(%1)",_i]; _ctrl ctrlSetText _text;
				sleep 1;
			};
				
			if (!isnull (findDisplay 49)) then {
				_ctrl ctrlSetText _stext; 
				_ctrl ctrlEnable true;
			};
		};

		waitUntil {isNull (findDisplay 49)};
		//escape menu closed
		if (!scriptDone _enCtrl) then {
			terminate _enCtrl
		};
	};
};};


player_init_civilian_stats = {
	ARGV(0,_player);
	if (not([_player] call player_civilian)) exitWith {null};
	
	[_player, "gasmask", false, true] call object_setVariable;
	[_player, "stun_armor", "none", true] call object_setVariable;
	[_player, "stun_light_on", 0] call inventory_set_item_amount;
	[_player, "stun_full_on", 0] call inventory_set_item_amount;
};

player_init_cop_stats = {
	ARGV(0,_player);
	if (not([_player] call player_cop)) exitWith {null};
	
	private["_gasmask_on"];
	_gasmask_on = ([player, "gasmask_on"] call inventory_get_item_amount > 0);
	[_player, "gasmask", _gasmask_on, true] call object_setVariable;
	
	if ([player, "stun_light_on"] call inventory_get_item_amount > 0) then {
		[_player, "stun_armor", "light", true] call object_setVariable;
	}
	else { if ([player, "stun_full_on"] call inventory_get_item_amount > 0) then {
		[_player, "stun_armor", "full", true] call object_setVariable;
	}
	else {
		[_player, "stun_armor", "none", true] call object_setVariable;
	};};
	stunshots = 0;
};

player_init_stats = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	role = _player;
	INV_hunger = 25;
	shoveldur = 20;
	pickaxedur = 50;
	hammerdur = 100;
	alreadygotaworkplacejob = 0;
	respawnButtonPressed = false;
	demerits = if ("car" call inventory_has_license) then {10} else {demerits};
	[_player, "stunned", false] call player_set_bool;
	[_player, "restrained", false] call player_set_bool;
	[_player, "extradeadtime", 0] call player_set_scalar;
	
	if (not(iscop)) then {
		[_player, "sidemarkers", true] call player_set_bool;	
	};
	
	[_player] call player_init_civilian_stats;
	[_player] call player_init_cop_stats;
};


player_handle_mpkilled = { _this spawn {
	player groupChat format["player_handle_mpkilled2 %1", _this];
	ARGV(0,_unit);
	ARGV(1,_killer);
	

	
	if (str(_unit) != str(player)) exitWith {null};
	
	private["_player"];
	_player = player;
	
	[_unit, 15] spawn player_despawn;
	[_player] spawn player_save_side_gear;
	[_player] spawn player_save_side_inventory;
	

	if (defined(victim)) then {
		[_killer, _player] call victim;
	};
	
	if (player_rejoin_choice_active) exitWith {};
	
	[_player] call player_reset_gear;
	[_player] call player_drop_inventory;
	[_player] call player_reset_ui;
	[_player] call player_reset_stats;
	[_player] call player_dead_camera;
	[_player] call player_rejoin_camera;
	
};};




player_handle_mprespawn = {
	//player groupChat format["player_handle_mprespawn %1", _this];
	ARGV(0,_unit);
	ARGV(1,_corpse);
	
	if (not(str(_unit) == str(player))) exitWith {null};
	//player groupChat format["Respawning now!"];
	[_unit, false] call player_spawn;
};



player_handle_damage = {
	//player groupChat format["player_handle_damage %1", _this];
	ARGV(0,_unit);
	ARGV(1,_select);
	ARGV(2,_damage);
	ARGV(3,_source);
	ARGV(4,_projectile);


	private["_distance"];
	_distance = 0;

	/*
	if( ((_unit distance getmarkerpos "respawn_west" < 100))  || 
		((_unit distance getmarkerpos "respawn_east" < 100)) || 
		((_unit distance getmarkerpos "respawn_guerrila" < 100)) || 
		(_unit distance getmarkerpos "respawn_civilian" < 100)
		) exitWith {null};
	*/

	private["_exit"];
	_exit = false;

	private["_nvcls"];
	_nvcls = nearestObjects [getpos _unit, ["LandVehicle"], 5];

	private["_reduce"];
	_reduce = false;

	private["_source_cop", "_weapon"];
	_source_cop = ([_source] call player_cop);
	_weapon = currentWeapon _source;

	if (toLower(_weapon) == toLower("hgun_P07_snds_F") && _source_cop) then {
		_reduce = true;
		_distance = _source distance _unit;
		_veh = vehicle _unit;
		_inveh = ((_veh iskindof "Quadbike_01_base_F"));
		[_unit, _source, _distance, _select, _damage, _veh, _inveh] call stun_using_weapon;
	};

	if (_reduce) then {
		_damage = _damage * 0.25;
	};
		
	if (not(alive _unit)) then {
		[_shooter, _unit] spawn victim;
	};
	
	_damage
};




player_handle_fired = {
	//player groupChat format["player_handle_fired %1", _this];
	ARGV(0,_unit);
	ARGV(1,_weapon);
	ARGV(2,_muzzle);
	ARGV(3,_mode);
	ARGV(4,_ammo);
	ARGV(5,_magazine);
	ARGV(6,_projectile);
	

	if (_projectile isKindOf "PipeBombBase") then {
		[_projectile] call mine_explosive_wait_despawn;
	};

	if (_unit distance (getmarkerpos "respawn_west") < 100) exitwith {
		deletevehicle _projectile;
		if (firestrikes == 0) exitwith {
			[player] call player_reset_gear;
			firestrikes = 3;
		};
		firestrikes = firestrikes - 1;
		format['hint "WARNING %1: DO NOT FIRE INSIDE THE COPBASE! %2/%3 chances left.";', name _unit, firestrikes, totalstrikes] call broadcast;
	};
	
	if (((_unit distance (getmarkerpos "respawn_civilian")) < 130) ) exitwith {
		deleteVehicle _projectile;
		if (firestrikes == 0) exitwith {
			[player] call player_reset_gear;
			firestrikes = 3;
		};
		
		firestrikes = firestrikes - 1;
		format['hint "WARNING %1: DO NOT FIRE INSIDE THE CIVILIAN SPAWN! %2/%3 chances left.";', name _unit, firestrikes, totalstrikes] call broadcast;
	};

	if ((_unit distance (getmarkerpos "respawn_east")) < 100) exitwith {
		deletevehicle _projectile;
	};
	
	if ((_unit distance (getmarkerpos "respawn_guerrila")) < 100 ) exitwith {
		deletevehicle _projectile;
	};

	if (_weapon  == "hgun_P07_snds_F") then {
		[_unit] call stun_gun_sound;		
	};

	//[_this, _projectile] execVM "Awesome\Scripts\Smoke.sqf";
};


player_camera_create = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	private["_pos"];
	_pos = (getPosATL _player);
	_camera = "camera" camCreate [(_pos select 0), (_pos select 1), ((_pos select 2) + 3)];
	_camera cameraEffect ["Internal", "LEFT"];
	_camera setPos _pos;
	_camera camSetFoV 1;
	showCinemaBorder false;
	[_player, "self_camera", _camera] call object_setVariable;

	//hook for disabling camera when player dies
	[] spawn { 
		waitUntil {not(alive player)};
		[player] call player_camera_destroy;
	};
	_camera
};

player_camera_destroy = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	
	private["_camera"];
	_camera = [_player, "self_camera"] call object_getVariable;
	if (undefined(_camera)) exitWith {null};
	
	[_player, "self_camera", null] call object_setVariable;
	_camera cameraEffect ["terminate","back"];
	camDestroy _camera;
};


player_weapons_compatible_with_attachment = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {[]};
	
	private["_weapons"];
	_weapons = [_player] call player_weapons;
	
	private["_compatible_attachments", "_i"];
	_compatible_attachments = [];
	_i = 0;
	while {_i < count(_weapons) } do {
		private["_weapon_id"];
		_weapon_id = _weapons select _i;
		if (not([_weapon_id, _item_id] call weapon_compatible_with_attachment)) then {
			_weapons set [_i, ""];
		};
		_i = _i + 1;
	};
	
	(_weapons)
};

player_get_all_items = {
	//player groupChat format["player_get_all_items %1", _this];
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {[]};
	
	private["_uniformItems", "_vestItems", "_pWItems", "_sWItems", "_hgWItems", "_backPackItems", "_allItems"];
	_uniformItems = uniformItems _player;
	_vestItems = vestItems _player;
	_pWItems = primaryWeaponItems _player;
	_sWItems = secondaryWeaponItems _player;
	_hgWItems = handgunItems _player;
	_backPackItems = backpackItems _player;
	_assignedItems = assignedItems _player;
	
	private["_others"];
	_others = [];
	_others = _others + [([_player] call player_backpack)];
	_others = _others + [([_player] call player_uniform)];
	_others = _others + [([_player] call player_vest)];

	_allItems = _uniformItems + _vestItems + _pWItems + _sWItems + _hgWItems + _backPackItems + _assignedItems + _others;
	_allItems = _allItems - [""];
	//player groupChat format["_allItems = %1", _allItems];
	([(_allItems)] call toLowerArray)
};

player_backpack = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {""};
	
	private["_backpack"];
	_backpack = unitBackpack _player;
	if (undefined(_backpack)) exitWith {""};
	
	(typeOf _backpack)
};

player_uniform = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {""};
	
	(uniform _player)
};

player_vest = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {""};
	
	(vest _player)
};

player_headgear = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {""};
	
	(headgear _player)
};

player_goggles = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {""};
	
	(goggles player)
};

player_add_item = {
	player groupChat format["player_add_item %1", _this];
	ARGV(0,_player);
	ARGV(1,_item_id);
	
	if (not([_player] call player_human)) exitWith {false};
	if (not([_item_id] call class_item)) exitWith {false};
	
	private["_load_before", "_load_after"];
	_load_before = load _player;
	_player addItem _item_id;
	_load_after = load _player;
	

	// drop the item in the ground
	if (_load_after <= _load_before) exitWith {
		_holder = createVehicle ["GroundWeaponHolder", (getPos _player), [], 0, "CAN_COLLIDE"];
		_holder addItemCargoGlobal [_item_id, 1];
		false
	};
	
	true
};

player_get_weapon_slot_item = {
	//player groupChat format["player_get_weapon_slot_item %1", _this];
	ARGV(0,_player);
	ARGV(1,_weapon_id);
	ARGV(2,_slot_id);
	
	if (not([_player] call player_human)) exitWith {""};
	if (undefined(_weapon_id)) exitWith {""};
	if (typeName _weapon_id != "STRING") exitWith {""};
	if (undefined(_slot_id)) exitWith {""};
	if (typeName _slot_id != "SCALAR") exitWith {""};
	
	private["_weapon_items"];
	_weapon_items = [_player, _weapon_id] call player_weapon_attachments;
		
	toLower(_weapon_items select _slot_id)
};


player_determine_weapon_type = {
	//player groupChat format["player_determine_weapon_type %1", _this];
	ARGV(0,_player);
	ARGV(1,_weapon_id);

	
	if (not([_player] call player_exists)) exitWith {-1};
	if (undefined(_weapon_id)) exitWith {-1};
	if (typeName _weapon_id != "STRING") exitWith {-1};

	
	private["_player_weapons"];
	_player_weapons = [_player] call player_weapons;
	
	//determine the type of weapon
	
	private["_i", "_weapon_type"];
	_i = 1;
	_weapon_type = -1;
	while { _i < count(_player_weapons) } do {
		private["_cweapon_id"];
		_cweapon_id = _player_weapons select _i;
		if (not(_cweapon_id == "") && (_cweapon_id == _weapon_id)) exitWith {
			_weapon_type = _i;
		};
		_i = _i + 1;
	};
	
	(_weapon_type)
};

//finds a weapon that has an open slot for this attachment
player_weapon_attachment_slot_open = {
	ARGV(0,_player);
	ARGV(1,_item_id);
	
	if (not([_player] call player_exists)) exitWith {_empty_result};
	if (undefined(_item_id)) exitWith {_empty_result};
	if (typeName _item_id != "STRING") exitWith {_empty_result};
	
	
	private["_weapons", "_i", "_empty_compatible_weapon"];
	_empty_compatible_weapon = "";
	_weapons = [_player] call player_weapons;
	_weapons = _weapons - [""];
	
	_i = 0;
	while { _i < count(_weapons) } do {
		if (true) then {
			private["_weapon_id"];
			_weapon_id = _weapons select _i;
			
			private["_compatible_attachments", "_attachments"];
			_attachments = [_player, _weapon_id] call player_weapon_attachments;
			_compatible_attachments = [_weapon_id] call weapon_compatible_attachments;
			
			private["_j"];
			_j = 0;
			while { _j < count(_attachments) } do {
				private["_id", "_list"];
				_id  = _attachments select _j;
				//player groupChat format["_compatible_attachments = %1", _compatible_attachments];
				_list = _compatible_attachments select _j;
				
				if (_id == "" && toLower(_item_id) in _list) exitWith {
					_empty_compatible_weapon = _weapon_id;
				};
				_j = _j + 1;
			};
			if (_empty_compatible_weapon != "") exitWith {null};
		};
		_i = _i + 1;
	};
	
	(_empty_compatible_weapon)
};

player_all_weapon_attachments = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {[]};

	private["_items"];
	_items = (primaryWeaponItems _player) + (secondaryWeaponItems _player) + (handgunItems _player) ;
	
	if (undefined(_items)) exitWIth {[]};
	if (typeName _items != "ARRAY") exitWith {[]};
	([_items] call toLowerArray)
};



player_weapon_attachments = {
	ARGV(0,_player);
	ARGV(1,_weapon_id);
	
	private["_empty_result"];
	
	_empty_result = ["","",""];
	
	if (not([_player] call player_exists)) exitWith {_empty_result};
	if (undefined(_weapon_id)) exitWith {_empty_result};
	if (typeName _weapon_id != "STRING") exitWith {_empty_result};
	
	private["_weapon_type"];
	_weapon_type = [_player, _weapon_id] call player_determine_weapon_type;
	
	private["_items"];
	_items = _empty_result;
	if (_weapon_type == player_primary_weapon) then {
		_items = (primaryWeaponItems _player);
	}
	else { if (_weapon_type == player_secondary_weapon) then {
		_items = (secondaryWeaponItems _player);
	}
	else { if (_weapon_type == player_handgun_weapon) then {
		_items = (handgunItems _player);
	};};};
	
	private["_i"];
	_i = 0;
	while { _i < count(_items) } do {
		_items set [_i, toLower(_items select _i)];
		_i = _i + 1;
	};
	
	(_items)
};

player_get_first_weapon = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	

	private["_weapons", "_weapon_id", "_i"];
	_weapons =  [_player] call player_weapons;
	_weapon_id = "";

	_i = 0;
	while {_i < count(_weapons) } do {
		private["_cweapon_id"];
		_cweapon_id = _weapons select _i;
		if not(_cweapon_id == "") exitWith {
			_weapon_id = _cweapon_id;
		};
		_i = _i + 1;
	};
	
	(_weapon_id)
};


player_current_weapon = 0;
player_primary_weapon = 1;
player_secondary_weapon = 2;
player_handgun_weapon = 3;

player_weapons = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	
	private["_currentWeapon", "_primaryWeapon", "_secondaryWeapon", "_handgunWeapon"];
	
	_currentWeapon = currentWeapon _player;
	_primaryWeapon = primaryWeapon _player;
	_secondaryWeapon = secondaryWeapon _player;
	_handgunWeapon = handgunWeapon _player;
	
	_currentWeapon = if (undefined(_currentWeapon)) then {""} else {_currentWeapon};
	_primaryWeapon = if (undefined(_primaryWeapon)) then {""} else { _primaryWeapon};
	_secondaryWeapon = if (undefined(_secondaryWeapon)) then {""} else {_secondaryWeapon};
	_handgunWeapon = if (undefined(_handgunWeapon)) then {""} else {_handgunWeapon};
	
	private["_data"];
	_data = [];
	_data set [player_current_weapon, _currentWeapon];
	_data set [player_primary_weapon, _primaryWeapon];
	_data set [player_secondary_weapon, _secondaryWeapon];
	_data set [player_handgun_weapon, _handgunWeapon];
	
	(_data)
};

player_add_weapon_item = {
	//player groupChat format["player_add_weapon_item %1", _this];
	ARGV(0,_player);
	ARGV(1,_weapon_id);
	ARGV(2,_item_id);
	
	if (not([_player] call player_exists)) exitWith {false};
	if (undefined(_weapon_id)) exitWith {false};
	if (typeName _weapon_id != "STRING") exitWith {false};
	if (undefined(_item_id)) exitWith {false};
	if (typeName _item_id != "STRING") exitWith {false};
	
	private["_weapon_type"];
	_weapon_type = [_player, _weapon_id] call player_determine_weapon_type;
	
	if (_weapon_type == player_primary_weapon) exitWith {
		(_player addPrimaryWeaponItem _item_id)
	};
	
	if (_weapon_type == player_secondary_weapon) exitWith {
		(_player addSecondaryWeaponItem _item_id)
	};
	
	if (_weapon_type == player_handgun_weapon) exitWith {
		(_player addHandgunItem _item_id)
	};
	
	false
};

player_remove_weapon_item = {
	//player groupChat format["player_remove_weapon_item %1", _this];	
	ARGV(0,_player);
	ARGV(1,_weapon_id);
	ARGV(2,_item_id);
	
	if (not([_player] call player_exists)) exitWith {false};
	if (undefined(_weapon_id)) exitWith {false};
	if (typeName _weapon_id != "STRING") exitWith {false};
	if (undefined(_item_id)) exitWith {false};
	if (typeName _item_id != "STRING") exitWith {false};
	
	private["_weapon_type"];
	_weapon_type = [_player, _weapon_id] call player_determine_weapon_type;
	
	if (_weapon_type == player_primary_weapon) exitWith {
		_player removePrimaryWeaponItem _item_id;
		true
	};
	
	if (_weapon_type == player_secondary_weapon) exitWith {
		[_player, _item_id] call removeItemFromSecondaryWeapon;
		true
	};
	
	if (_weapon_type == player_handgun_weapon) exitWith {
		[_player, _item_id] call removeItemFromHandgun;
		true
	};
	
	false
	
};

player_linked_item_slot_open = {
	//player groupChat format["player_linked_item_slot_open %1", _this];
	ARGV(0,_player);
	ARGV(1,_item_id);
	
	if (not([_player] call player_exists)) exitWith{false};
	if (not([_item_id] call class_item)) exitWith {false};
	
	private["_assigned_items"];
	_assigned_items = [(assignedItems _player)] call toLowerArray;
	
	not(toLower(_item_id) in _assigned_items)
};

player_unsurrender_animation = {
	player groupChat format["player_unsurrender_animation %1", _this];
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {};
	_player playMoveNow "AmovPercMstpSnonWnonDnon";
	
};

player_surrender_animation = {
	player groupChat format["player_surrender_animation %1", _this];
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {};

	_player playmove "TestSurrender";
	_player playmovenow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
	_player playmove "TestSurrender";
};


restrained_animations = ["unaercposlechvelitele4", "amovpercmstpsnonwnondnon_ease"];
player_unrestrained_animation = {
	player groupChat format["player_unrestrained_animation %1", _this];
	ARGV(0,_player);	
	if (not([_player] call player_exists)) exitWith {};
	_player switchMove "amovpercmstpsnonwnondnon";
	_player playMoveNow "amovpercmstpsnonwnondnon";
};


player_restrained_animation = {
	player groupChat format["player_restrained_animation %1", _this];
	ARGV(0,_player);
	
	if (not([_player] call player_exists)) exitWith {};
	_player switchMove "AmovPercMstpSnonWnonDnon_Ease";
	_player playMoveNow "UnaErcPoslechVelitele4";
};




[] call player_escape_menu_check;
[] call player_save_side_gear_setup;
[] call player_init_arrays;

player_functions_defined = true;