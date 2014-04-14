#include "constants.h"
#include "macro.h"
#include "dikcodes.h"

if (not(undefined(doors_modification_defined))) exitWith {};







doors_lcontrol_state = false;

doors_wait_display = {
	private["_display"];
	waitUntil {
		_display = findDisplay 46;
		not(isNil "_display" || {isNull _display})
	};
	_display
};

//Mouse wheel handler

doors_MouseZChangedHandler_id = null;


doors_MouseZChangedHandler = {
	if (not(doors_lcontrol_state)) exitWith {};
	ARGV(0,_event);
	ARGV(1,_data);
	
	private["_z_change"];
	_z_change = _event select 1;
	
	private["_object"];
	_object = cursorTarget;
	
	private["_neck_pos", "_pos1", "_pos2"];
	_neck_pos = player selectionPosition "neck";
	_pos1 = player modelToWorld _neck_pos;
	_pos2 = player modelToWorld [(_neck_pos select 0), (_neck_pos select 1) + 2, (_neck_pos select 2)];
	

	private["_intersect"];
	_intersect = [_object, "FIRE"] intersect [_pos1, _pos2];

	//player groupChat format["_object = %1, _intersect = %2", _object, _intersect];
	
	if (count(_intersect) == 0) exitWith {};

	private["_door"];
	_door = ((_intersect select 0) select 0);
	
	if ([[_object,_door]] call house_door_locked) exitWith {};
	
	private["_animation_phase", "_animation_name"];
	_animation_name = format["%1_rot", _door];
	_animation_phase = _object animationPhase _animation_name;
	
	_door_z_change = _animation_phase + _z_change / 8;
	
	if (_door_z_change <= 0.1) then {
		_door_z_change = 0.001;
	};
	
	if (_door_z_change >= 0.9) then {
		_door_z_change = 0.999;
	};
	
	_object animate [_animation_name,  _door_z_change];
};


doors_remove_MouseZChanged = {
	disableSerialization;
    _display = findDisplay 46;
	if (not(undefined(doors_MouseZChangedHandler_id))) then {
		_display displayRemoveEventHandler  ["MouseZChanged", doors_MouseZChangedHandler_id];
		doors_MouseZChangedHandler_id = null;
	};
};

doors_setup_MouseZChanged = {
	private["_data"];
	_data = _this;
	
	disableSerialization;
    _display = findDisplay 46;
	if ( undefined(doors_MouseZChangedHandler_id) ) then {
		doors_MouseZChangedHandler_id = _display displayAddEventHandler  ["MouseZChanged", format["[_this, %1] call doors_MouseZChangedHandler", _data]];
	};
};


//Keydown handler
doors_KeyDownHandler_id = null;
doors_KeyDownHandler = {
	//player groupChat format["doors_KeyDownHandler %1", _this];
	ARGV(0,_event);
	ARGV(1,_data);
	
	private["_key"];
	_key = _event select 1;
	if (_key == DIK_LSHIFT && not(doors_lcontrol_state)) then {
		doors_lcontrol_state = true;
	};
};

doors_remove_KeyDown = {
	disableSerialization;
    _display = findDisplay 46;
	if (not(undefined(doors_KeyDownHandler_id))) then {
		_display displayRemoveEventHandler  ["KeyDown", doors_KeyDownHandler_id];
		doors_KeyDownHandler_id = null;
	};
};

doors_setup_KeyDown = {
	private["_data"];
	_data = _this;
	
	disableSerialization;
     _display = call doors_wait_display;
	if ( undefined(doors_KeyDownHandler_id) ) then {
		doors_KeyDownHandler_id = _display displayAddEventHandler  ["KeyDown", format["[_this, %1] call doors_KeyDownHandler", _data]];
	};
};

//Key up handler

doors_KeyUpHandler_id = null;
doors_KeyUpHandler = {
	ARGV(0,_event);
	ARGV(1,_data);
	
	private["_key"];
	_key = _event select 1;
	if (_key == DIK_LSHIFT && doors_lcontrol_state) then {
		doors_lcontrol_state = false;
	};
};

doors_remove_KeyUp = {
	disableSerialization;
     _display = call doors_wait_display;
	if (not(undefined(doors_KeyUpHandler_id))) then {
		_display displayRemoveEventHandler  ["KeyUp", doors_KeyUpHandler_id];
		doors_KeyUpHandler_id = null;
	};
};


doors_setup_KeyUp = {
	private["_data"];
	_data = _this;
	
	disableSerialization;
    _display = call doors_wait_display;
	if ( undefined(doors_KeyUpHandler_id) ) then {
		doors_KeyUpHandler_id = _display displayAddEventHandler  ["KeyUp", format["[_this, %1] call doors_KeyUpHandler", _data]];
	};
};




//House functions
house_data_object = 0;
house_data_door = 1;

house_player_near = {
	ARGV(0,_player);
	private["_object"];
	_object = cursorTarget;
	
	if (not(_object isKindOf "House")) exitWith {null};
	
	private["_neck_pos", "_pos1", "_pos2"];
	_neck_pos = _player selectionPosition "neck";
	_pos1 = player modelToWorld _neck_pos;
	_pos2 = player modelToWorld [(_neck_pos select 0), (_neck_pos select 1) + 2, (_neck_pos select 2)];
	
	private["_intersect"];
	_intersect = [_object, "FIRE"] intersect [_pos1, _pos2];
	
	if (count(_intersect) == 0) exitWith {null};

	private["_name"];
	_name = ((_intersect select 0) select 0);
	

	private["_data"];
	_data = [];
	_data set [house_data_object, _object];
	_data set [house_data_door, _name];
	_data
};

if (undefined(house_actions)) then {
	house_actions = [];
};



house_door_move = {
	ARGV(0,_this);
	ARGV(0,_house);
	ARGV(1,_percent);
	if (undefined(_house)) exitWith {};	
	if (undefined(_percent)) exitWith {};
	
	if (_percent >= 0.99) then {
		_percent = 0.99;
	};
	
	if (_percent <= 0.1) then {
		_percent = 0.1;
	};

	private["_object", "_door"];
	_object = _house select house_data_object;
	_door = _house select house_data_door;
	
	_object animate [format["%1_rot", _door], _percent];
};


house_door_lock = {
	ARGV(0,_this);
	ARGV(0,_house);
	ARGV(1,_state);
	if (undefined(_house)) exitWith {};
	if (undefined(_state)) then {
		_state = 1;
	};
	
	private["_object", "_door"];
	_object = _house select house_data_object;
	_door = _house select house_data_door;
	
	_object setVariable [format["disabled_%1", _door], _state, true];
};


house_door_closed = {
	ARGV(0,_house);
	
	if (undefined(_house)) exitWith {false};
	

	private["_object", "_door"];
	_object = _house select house_data_object;
	_door = _house select house_data_door;
	
	private["_animation_name"];
	_animation_name = format["%1_rot", _door];
	
	((_object animationPhase _animation_name) <= 0.1)
};



house_door_locked = {
	ARGV(0,_house);
	
	if (undefined(_house)) exitWith {false};
	

	private["_object", "_door"];
	_object = _house select house_data_object;
	_door = _house select house_data_door;
	
	((_object getVariable [format["disabled_%1", _door], 0]) == 1)
};


house_door_knock_handler = {
	ARGV(0,_player);
	_player say3d "door_knock";
};

house_door_knock = {
	ARGV(0,_this);
	ARGV(0,_player);
	[[_player], "house_door_knock_handler", true] call BIS_fnc_MP;
};

house_owner_uid = {
	ARGV(0,_object);
	if (undefined(_object)) exitWith {null};
	(_object getVariable ["owner_uid", null])
};

house_player_home_owner = {
	ARGV(0,_player);
	if (undefined(_player)) exitWith {false};
	private["_house_id"];
	_house_id = [_player, "house_id", null] call object_getVariable;
	//player groupChat format["_house_id = %1", _this];
	if (undefined(_house_id)) exitWith {false};
	true
};

house_sell_price = 150000;
house_buy_price = 250000;


house_add_actions = {
	if (count house_actions > 0) exitWith {};
	ARGV(0,_player);
	ARGV(1,_house);

	if (not([_player] call player_human)) exitWith {};
	if (undefined(_house)) exitWith {};
	
	private["_object", "_door"];
	_object = _house select house_data_object;
	_door = _house select house_data_door;
	
	private["_action_id"];
	_action_id = player addaction ["<t color='#dddd00'>Lock door</t>", "action.sqf", [[_house, 1], "house_door_lock"],10,false,false,"", format["not([[(objectFromNetId '%1'), '%2']] call house_door_locked) && {([(objectFromNetId '%1'), %3] call house_player_owner)}", (netId _object), _door, _player]];
	house_actions = house_actions + [_action_id];
	
	_action_id = player addaction ["<t color='#dddd00'>Unlock door</t>", "action.sqf", [[_house, 0], "house_door_lock"],10,false,false,"", format["([[(objectFromNetId '%1'), '%2']] call house_door_locked) && {([(objectFromNetId '%1'), %3] call house_player_owner)}", (netId _object), _door, _player]];
	house_actions = house_actions + [_action_id];
	
	_action_id = player addaction ["<t color='#dddd00'>Open door</t>", "action.sqf", [[_house, 1], "house_door_move"],10,false,false,"", format["not([[(objectFromNetId '%1'), '%2']] call house_door_locked) && {([[(objectFromNetId '%1'), '%2']] call house_door_closed)}", (netId _object), _door]];
	house_actions = house_actions + [_action_id];
	
	_action_id = player addaction ["<t color='#dddd00'>Close door</t>", "action.sqf", [[_house, 0], "house_door_move"],10,false,false,"", format["not([[(objectFromNetId '%1'), '%2']] call house_door_locked) && {not([[(objectFromNetId '%1'), '%2']] call house_door_closed)}", (netId _object), _door]];
	house_actions = house_actions + [_action_id];
	
	_action_id = player addaction ["<t color='#dddd00'>Knock</t>", "action.sqf", [[_player], "house_door_knock"],10,false,true,"", format["([[(objectFromNetId '%1'), '%2']] call house_door_locked) && {([[(objectFromNetId '%1'), '%2']] call house_door_closed)}", (netId _object), _door]];
	house_actions = house_actions + [_action_id];
	
	_action_id = player addaction [format["<t color='#dddd00'>Sell house ($%1)</t>",strM(house_sell_price)], "action.sqf", [[_player, _object], "house_sell"],10,false,true,"", format["not([[(objectFromNetId '%1'), '%2']] call house_door_locked) && {([(objectFromNetId '%1'), %3] call house_player_owner)}", (netId _object), _door, _player]];
	house_actions = house_actions + [_action_id];
	
	_action_id = player addaction [format["<t color='#dddd00'>Buy house ($%1)</t>",strM(house_buy_price)], "action.sqf", [[_player, _object], "house_buy"],10,false,true,"", format["([(objectFromNetId '%1')] call house_available) && {not([%2] call house_player_home_owner)}", (netId _object), _player]];
	house_actions = house_actions + [_action_id];
	
	_action_id = player addaction ["<t color='#dddd00'>House information</t>", "action.sqf", [[_object], "house_information"],10,false,true,"", format["not([(objectFromNetId '%1')] call house_available) && {not([(objectFromNetId '%1'), %2] call house_player_owner)}", (netId _object), _player]];
	house_actions = house_actions + [_action_id];
};



house_remove_actions = {
	if (count house_actions == 0) exitWith {};
	private["_player"];
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {};
	
	{
		private["_action_id"];
		_action_id = _x;
		_player removeAction _action_id;
	} forEach house_actions;
	house_actions = [];
};

house_doors_disable = {
	ARGV(0,_player);
	ARGV(1,_house);
	
	private["_object", "_door"];
	_object = _house select house_data_object;
	_door = _house select house_data_door;
	
	private["_i", "_bis_door_variable_name", "_disabled"];
	_i = 1;
	while {_i < 10} do {
		_bis_door_variable_name = format["bis_disabled_door_%1", _i];
		_disabled = _object getVariable [_bis_door_variable_name,0];
		if (not(_disabled == 1)) then {
			_object setVariable [_bis_door_variable_name, 1];
		};
		_i = _i + 1;
	};
};



house_available = {
	ARGV(0,_object);
	
	private["_owner_uid"];
	_owner_uid = [_object] call house_owner_uid;
	(undefined(_owner_uid))
};

house_player_owner = {
	ARGV(0,_object);
	ARGV(1,_player);
	if (undefined(_player)) exitWith {};
	if (undefined(_object)) exitWith {};
	
	private["_puid", "_ouid"];
	_puid = getPlayerUID _player;
	_ouid = _object getVariable ["owner_uid", ""];
	
	(_puid == _ouid)
};


house_buy = {
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_object);
	
	if (undefined(_player)) exitWith {};
	if (undefined(_object)) exitWith {};
	
	
	[_player, "house_id", (netId _object), true] call object_setVariable;
	_object setVariable ["owner_uid", (getPlayerUID _player), true];
	player groupChat format["You bought this house for $%1", strM(house_buy_price)];
	
	[_player, _object] call house_add_spawn_data;
};


player_current_house = {
	ARGV(0,_player);
	if (undefined(_player)) exitWith {null};
	
	private["_house_id"];
	_house_id = [_player, "house_id", ""] call object_getVariable;
	
	if (_house_id == "") exitWith {null};
	
	private["_house"];
	_house = objectFromNetId _house_id;
	
	if (isNil "_house" || {(typeName _house != "OBJECT") || {isNull _house}}) exitWith {null};
	
	_house
};


house_sell = {
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_object);
	
	if (undefined(_player)) exitWith {};
	if (undefined(_object)) exitWith {};
	
	[_player, "house_id", nil, true] call object_setVariable;
	_object setVariable ["owner_uid", nil, true];
	player groupChat format["You sold this house for $%1", strM(house_sell_price)];
	
	[_player, _object] call house_remove_spawn_data;
};



house_spawn_data_house_id = 0;
house_spawn_data_respawn_id = 1;

house_remove_spawn_data = {
	player groupChat format["house_remove_spawn_data %1", _this];
	ARGV(0,_player);
	ARGV(1,_object);
	
	if (undefined(_player)) exitWith {null};
	if (undefined(_object)) exitWith {null};
	
	private["_houses_spawn_data"];
	_houses_spawn_data = [_player, "houses_spawn_data", null] call object_getVariable;
	if (undefined(_houses_spawn_data)) exitWith {null};
	
	private["_house_id"];
	_house_id = netId _object;
	
	private["_index", "_spawn_data"];
	_spawn_data = objNull;
	_index = -1;
	
	{
		private["_cspawn_data", "_chouse_id"];
		_cspawn_data = _x;
		_chouse_id = _cspawn_data select house_spawn_data_house_id;
		if (_chouse_id == _house_id) exitWith {
			_index = _forEachIndex;
			_spawn_data = _cspawn_data;
		};
	} forEach _houses_spawn_data;
	
	if (_index == -1) exitWith {null};
	
	private["_respawn_id", "_result"];
	_respawn_id = _spawn_data select house_spawn_data_respawn_id;
	_result = [_player,_respawn_id]  call BIS_fnc_removeRespawnPosition;
	if (not(_result)) exitWith {
		diag_log format["WARNING: could not remove respawn position for %1", [_player, _respawn_id]];
		null
	};
	_spawn_data
};



house_add_spawn_data = {
	player groupChat format["house_add_spawn_data %1", _this];
	ARGV(0,_player);
	ARGV(1,_object);
	
	if (undefined(_player)) exitWith {null};
	if (undefined(_object)) exitWith {null};
	
	private["_spawn_data_info", "_pos"];
	_pos = (_object buildingPos 1);
	if (str(_pos) == str([0,0,0])) then {
		_pos = _object modelToWorld [0,0,0];
	};
	
	_spawn_data_info = [_player,_pos] call BIS_fnc_addRespawnPosition;
	
	private["_spawn_data"];
	_spawn_data = [];
	_spawn_data set [house_spawn_data_house_id, netId _object];
	_spawn_data set [house_spawn_data_respawn_id, (_spawn_data_info select 1)];
	
	private["_houses_spawn_data"];
	_houses_spawn_data = [_player, "houses_spawn_data", []] call object_getVariable;
	_houses_spawn_data set [count(_houses_spawn_data), _spawn_data];
	[_player, "houses_spawn_data", _houses_spawn_data, true] call object_setVariable;
	
	_spawn_data
};

house_information ={
	ARGV(0,_this);
	ARGV(0,_object);
	
	private["_owner_uid"];
	_owner_uid = [_object] call house_owner_uid;
	if (undefined(_owner_uid)) exitWith {
		hint "This house is for sale";
	};
	
	
	private["_player"];
	_player = [_owner_uid] call player_lookup_uid;
	if (undefined(_player)) exitWith {
		hint "The owner of this house is not connected.\nThe house will be available for sale in a few minutes";
	};
	
	hint format["This house belongs to %1-%2", _player, (name _player)];	
};

house_owner_disconnect = { _this spawn {
	ARGV(0,_object);
	ARGV(1,_player_name);
	if (undefined(_object)) exitWith {};
	if (undefined(_player_name)) exitWith {};
	
	private["_timeout"];
	_timeout = 120;
	sleep _timeout;
	_object setVariable ["owner_uid", nil, true];
	private["_message"];
	_message = format["%1's house is now for sale", _player_name];
	[[_message, CHAT_GLOBAL, server], "interact_chat", true] call BIS_fnc_MP;
};};






doors_modification_defined = true;