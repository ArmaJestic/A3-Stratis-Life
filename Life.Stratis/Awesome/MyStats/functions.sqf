#include "macro.h"
#include "constants.h"
#include "ASCII.h"

stats_use_factions = false;
stats_server_uid = "__SERVER__";

if (not(undefined(stats_functions_defined))) exitWith {null};

stats_load_request_uid = 0;
stats_load_request_response_variable = 1;

stats_load_request_receive = {
	private["_variable", "_request"];
	
	_variable = _this select 0;
	_request = _this select 1;
	
	//player groupChat format["LOAD_REQUEST_RECV: %1", _request];
	
	if (undefined(_request)) exitWith {null};
	if (typeName _request != "ARRAY") exitWith {null};
	
	private["_uid", "_response_variable"];
	_uid = _request select stats_load_request_uid;
	_response_variable = _request select stats_load_request_response_variable;
	
	
	if (undefined(_uid)) exitWith {null};
	if (typeName _uid != "STRING") exitWith {null};
	if (undefined(_response_variable)) exitWith {null};
	if (typeName _response_variable != "STRING") exitWith {null};
	
	private["_data"];
	_data = [_uid] call getAllPlayerVariables;
	server setVariable[_response_variable, _data, true];
};

stats_build_load_request = {
	private["_uid"];
	
	_uid = _this select 0;
	if (undefined(_uid)) exitWith {null};
	if (typeName _uid != "STRING") exitWith {null};
	
	private["_response_variable"];
	_response_variable = _uid;
	server setVariable [_response_variable, nil, true];
	
	private["_request"];
	
	_request = [];
	_request set [stats_load_request_uid, _uid];
	_request set [stats_load_request_response_variable, _response_variable];
	_request
};


stats_load_request_send = {
	private["_uid", "_request", "_response_variable"];
	
	_uid = _this select 0;
	_request = [_uid] call stats_build_load_request;
	if (undefined(_request)) exitWith {[]};
	
	private["_response_variable"];
	_response_variable = _request select stats_load_request_response_variable;
	server setVariable [_response_variable, nil, true];
	
	if (isServer) then {
		//on the server we can call the receive function directly
		["", _request] call stats_load_request_receive;
	}
	else {
		//from the client we have to send request across the network
		stats_load_request_buffer = _request;
		publicVariableServer "stats_load_request_buffer";
	};
	
	//wait for the response
	private["_data"];
	
	_data = [];
	waitUntil {  
		_data = server getVariable _response_variable;
		if (defined(_data) && {typeName _data == "ARRAY"}) exitWith {true};
		false
	};
	
	_data
};

stats_save_request_uid = 0;
stats_save_request_key = 1;
stats_save_request_value = 2;

stats_save_request_receive = {
	diag_log format['stats_save_request_receive: %1', _this];

	private["_variable", "_request"];
	
	_variable = _this select 0;
	_request = _this select 1;
	
	if (undefined(_request)) exitWith {null};
	if (typeName _request != "ARRAY") exitWith {null};
	
	private["_uid", "_key", "_value"];
	_uid = _request select stats_save_request_uid;
	_key = _request select stats_save_request_key;
	_value = _request select stats_save_request_value;
	
	diag_log format['stats_save_request_receive: Exit checks'];
	
	if (undefined(_uid)) exitWith {diag_log format['stats_save_request_receive: Exit1']; null};
	if (undefined(_key)) exitWith {diag_log format['stats_save_request_receive: Exit2']; null};
	if (undefined(_value)) exitWith {diag_log format['stats_save_request_receive: Exit3']; null};
	if (typeName _uid != "STRING") exitWith {diag_log format['stats_save_request_receive: Exit4']; null};
	if (typeName _key != "STRING") exitWith {diag_log format['stats_save_request_receive: Exit5']; null};
	
	_value = [_value];
	
	diag_log format['stats_save_request_receive: calling updatePlayerVariable'];
	[_uid, _key, _value] call updatePlayerVariable;
	
	diag_log format['stats_save_request_receive: complete'];
};

stats_build_save_request = {
	private["_uid", "_variable", "_value"];
	
	_uid = _this select 0;
	_variable = _this select 1;
	_value = _this select 2;
	
	if (undefined(_uid)) exitWith {null};
	if (undefined(_variable)) exitWith {null};
	if (undefined(_value)) exitWith {null};
	
	if (typeName _uid != "STRING") exitWith {null};
	if (_uid == "") exitWith {null};
	if (typeName _variable != "STRING") exitWith {null};
	
	private["_request"];

	_request = [];
	_request set [stats_save_request_uid, _uid];
	_request set [stats_save_request_key, _variable];
	_request set [stats_save_request_value, _value];
	_request
};

stats_save_request_send = {
	diag_log format['stats_save_request_send: %1', _this];

	_request = _this call stats_build_save_request;
	if (undefined(_request)) exitWith {diag_log format['stats_save_request_send: Exit']; null};

	
	if (isServer) then {
		// if we are on server, we can call the receive method directly
		diag_log format['stats_save_request_send: server, call stats_save_request_receive'];
		["", _request] call stats_save_request_receive;
	}
	else {
		// if we are on client, then we need to send it across the network
		diag_log format['stats_save_request_send: client, broadcasting'];
		stats_save_request_buffer = _request;
		publicVariableServer "stats_save_request_buffer";
	};
	
	diag_log format['stats_save_request_send: complete'];
};

stats_human_side = {
	private ["_player"];
	_player = _this select 0;
	if (undefined(_player)) exitWith {sideUnknown};
	if (typeName _player != "OBJECT") exitWith {sideUnknown};
	if (isNull _player) exitWith {sideUnknown};
	
	private["_player_str", "_data", "_ch1", "_ch2"];
	_player_str = toUpper(str(_player));
	_data = toArray _player_str;
	_ch1 = (_data select 1);
	_ch2 = (_data select 2);
	
	if (_ch1 == ASCII_P && _ch2 == ASCII_F) exitWith { east};
	if (_ch1 == ASCII_I && _ch2 == ASCII_V) exitWith { civilian };
	if (_ch1 == ASCII_N && _ch2 == ASCII_S) exitWith { resistance };
	if (_ch1 == ASCII_O && _ch2 == ASCII_P) exitWith { west };
	
	 sideUnknown
};


stats_get_faction = {
	private ["_player"];
	_player = _this select 0;
	private["_side"];
	_side = [_player] call stats_human_side;
	if (_side == east) exitWith {"Opfor"};
	if (_side == west) exitWith {"Cop"};
	if (_side == civilian) exitWith {"Civilian"};
	if (_side == resistance) exitWith {"Insurgent"};
	""
};


stats_get_uid = {
	private["_object"];
	_object = _this select 0;
	
	_uid = [_object, "stats_uid"] call object_getVariable;
	if (not(undefined(_uid))) exitWith {_uid};
	
	if (not(_object isKindOf "Man")) exitWith {
		([_object] call starts_get_vehicle_uid)
	};
	
	([_object] call stats_get_player_uid)
};

starts_get_vehicle_uid = {
	private["_object"];
	
	_object = _this select 0;
	if (undefined(_object)) exitWith {""};
	
	private["_uid"];
	_uid = vehicleVarName _object;
	if (undefined(_uid)) exitWith {""};
	if (typeName _uid != "STRING") exitWith {null};
	
	[_object, "stats_uid", _uid, true] call object_setVariable;
	(_uid)
};

stats_get_player_uid = {
	private["_player", "_uid"];
	_player = _this select 0;
	
	_uid = [_player, "stats_uid"] call object_getVariable;
	if (not(undefined(_uid))) exitWith {_uid};
	
	_uid = getPlayerUID _player;
	if (undefined(_uid)) exitWith {""};
	if (typeName _uid != "STRING") exitWith {""};
	if (_uid == "") exitWith {""};
	
	[_player, "real_uid", _uid, true] call object_setVariable;
	[_player, "name", (name _player), true] call object_setVariable;
	
	private["_faction"];
	_faction = [_player] call stats_get_faction;
	_uid = if (stats_use_factions) then { _uid + "_" + _faction } else {_uid};
	[_player, "stats_uid", _uid, true] call object_setVariable;
	_uid	
};

//generic method for saving variables, can be called either from server or client
//Arguments are [uid,key,value]
stats_save = {
	diag_log format['stats_save: %1', _this];
	_this call stats_save_request_send;
	diag_log format['stats_save: complete'];
};

//Method intended to be run on server-side, it is used for saving SERVER specific variables (can be run on client side as well)
//Arguments are [key,value]
stats_server_save = {
	diag_log format['stats_save: %1', _this];

	private["_variable", "_value"];
	
	_variable = _this select 0;
	_value = _this select 1;
	
	diag_log format['stats_server_save: exit checks'];
	
	if (undefined(_variable)) exitWith {diag_log format['stats_server_save: exit1']; null};
	if (undefined(_value)) exitWith {diag_log format['stats_server_save: exit2']; null};
	if (typeName _variable != "STRING") exitWith {diag_log format['stats_server_save: exit3']; null};
	
	diag_log format['stats_server_save: exits passed'];
	
	diag_log format['stats_server_save: calling stats_save'];
	private["_uid"];
	[stats_server_uid, _variable, _value] call stats_save;
	
	diag_log format['stats_server_save: complete'];
};

//Method intended to be run on client-side, for saving CLIENT specific variables
stats_client_save = {
	private["_variable", "_value"];
	
	_variable = _this select 0;
	_value = _this select 1;
	
	[player, _variable, _value] call stats_player_save;
	true
};

//method intended saving player stats ... it can be run on any client, or even cross-client to save stats for another player
stats_player_save = {
	private["_player", "_variable", "_value"];
	_player = _this select 0;
	_variable = _this select 1;
	_value = _this select 2;
	
	private["_uid"];
	_uid = [_player] call stats_get_uid;
	if (_uid == "") exitWith {null};
	
	if (undefined(_variable)) exitWith {null};
	if (undefined(_value)) exitWith {null};
	if (typeName _variable != "STRING") exitWith {null};
		
	[_uid, _variable, _value] call stats_save;
};

//method intended saving vehicle stats ... it can be run on any client
stats_vehicle_save = {
	private["_vehicle", "_variable", "_value"];
	_vehicle = _this select 0;
	_variable = _this select 1;
	_value = _this select 2;
	
	private["_uid"];
	_uid = [_vehicle] call stats_get_uid;
	
	if (_uid == "") exitWith {null};
	
	if (undefined(_variable)) exitWith {null};
	if (undefined(_value)) exitWith {null};
	if (typeName _variable != "STRING") exitWith {null};
		
	[_uid, _variable, _value] call stats_save;
};


stats_server_player_disconnected = {
	private["_id", "_name", "_uid"];
	_id = _this select 0; 
	_name = _this select 1; 
	_uid  = _this select 2; 
	
	if (undefined(_uid)) exitWith {null};
	if (typeName _uid != "STRING") exitWith {null};
	if (_uid == "") exitWith {null};
	

	private["_player"];
	_player = server getVariable _uid;
	[_player, "isGhost", true, true] call object_setVariable;
	
	diag_log format["%1,%2,%3 - disconnected saving start", _player, _name, _uid];
	[_player] call player_save_side_gear;
	[_player] call player_save_side_inventory;
	[_player] call player_save_side_position;
	[_player] call player_save_side_damage;
	[_player] call player_save_side_vehicle;
	[_player] call gang_player_disconnected;
	diag_log format["%1,%2,%3 - disconnected saving end", _player, _name, _uid];
	

	private["_vehicle"];
	_vehicle = (vehicle _player);
	if (not(_vehicle == _player)) then {
		[_vehicle] call vehicle_save_stats;
		[_vehicle] call vehicle_start_track;
	};
		
	private["_stats_uid"];
	_stats_uid =  [_player] call stats_get_uid;
	[_stats_uid] call unloadPlayerVariables;
};


stats_library_condition = 0;
stats_library_arguments = 1;
stats_library_file = 2;

stats_core_libraries =
[
	[{true}, [], "miscfunctions.sqf"],
	[{true}, [], "Awesome\Functions\quicksort.sqf"],
	[{true}, [], "Awesome\Functions\vector_functions.sqf"],
	[{true}, [], "Awesome\Functions\jip_functions.sqf"],
	[{true}, [], "Awesome\Functions\object_functions.sqf"],
	[{true}, [], "Awesome\Functions\hud_functions.sqf"],
	[{true}, [], "Awesome\Functions\oil_derrick_functions.sqf"],
	[{true}, [], "Awesome\Functions\limbo_base_functions.sqf"],
	[{true}, [], "Awesome\Functions\rig_functions.sqf"],
	[{true}, [], "Awesome\Functions\underwater_base_functions.sqf"],
	[{true}, [], "Awesome\Functions\bunker_functions.sqf"],
	[{true}, [], "Awesome\Functions\blue4_bunker_functions.sqf"],
	[{true}, [], "Awesome\Functions\pythos_base_functions.sqf"],
	[{true}, [], "Awesome\Functions\airfield_base_functions.sqf"],
	[{true}, [], "Awesome\Functions\shoothouse_functions.sqf"],
	[{true}, [], "Awesome\Functions\drag_functions.sqf"],
	[{true}, [], "Awesome\Functions\encodingfunctions.sqf"],
	[{true}, [], "Awesome\MyStats\persist.sqf"],
	[{true}, [], "Awesome\Functions\time_functions.sqf"],
	[{true}, [], "4422894.sqf"],
	[{true}, [], "Awesome\Functions\config_functions.sqf"],
	[{true}, [], "Awesome\Functions\vehicle_functions.sqf"],
	[{true}, [], "Awesome\Functions\player_functions.sqf"],
	[{true}, [], "Awesome\Functions\bis_expected.sqf"],
	[{true}, [], "Awesome\Functions\weapon_functions.sqf"],
	[{true}, [], "Awesome\Functions\server_functions.sqf"],
	[{true}, [], "Awesome\Functions\list_functions.sqf"],
	[{true}, [], "Awesome\Functions\vehicle_storage_functions.sqf"],
	[{true}, [], "Awesome\Functions\flag_pole_functions.sqf"],
	[{true}, [], "Awesome\Functions\inventory_functions.sqf"],
	[{true}, [], "Awesome\Functions\mine_functions.sqf"],
	[{true}, [], "Awesome\Functions\quarry_functions.sqf"],
	[{true}, [], "masterarray.sqf"]
];
	
stats_main_libraries = 
[
	[{true}, [], "Awesome\Functions\plant_functions.sqf"],
	[{true}, [], "Awesome\Functions\drug_functions.sqf"],
	[{true}, [], "Awesome\Functions\tree_functions.sqf"],
	[{true}, [], "Awesome\Scripts\optimize_1.sqf"],
	[{true}, ["init"], "bombs.sqf"],
	[{isServer}, ["server"], "bombs.sqf"],
	[{true}, [], "Awesome\Functions\interaction.sqf"],
	[{true}, [], "triggers.sqf"],
	[{true}, [], "broadcast.sqf"],
	[{true}, [], "customfunctions.sqf"],
	[{true}, [], "strfuncs.sqf"],
	[{true}, [], "1007210.sqf"],
	[{true}, [], "4422894.sqf"],
	[{true}, [], "INVvars.sqf"],
	[{true}, [], "Awesome\Functions\shop_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\bankfunctions.sqf"],
	[{true}, [], "bankexec.sqf"],
	[{true}, [], "initWPmissions.sqf"],
	[{true}, [], "gfx.sqf"],
	[{true}, [], "variables.sqf"],
	[{true}, [], "Awesome\Functions\money_functions.sqf"],
	[{true}, [], "Awesome\Functions\gang_functions.sqf"],
	[{true}, [], "Awesome\Functions\convoy_functions.sqf"],
	[{true}, [], "Awesome\Functions\factory_functions.sqf"],
	[{true}, [], "Awesome\Functions\license_functions.sqf"],
	[{true}, [], "Awesome\Functions\farming_functions.sqf"],
	[{true}, [], "Awesome\Functions\hunting_functions.sqf"],
	[{true}, [], "Awesome\Functions\inventory_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\main_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\bank_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\storage_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\police_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\lotto_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\prison_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\animations_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\frisk_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\legislation_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\economy_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\list_simple_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\arrest_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\ticket_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\yes_no_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\admin_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\camera_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\doors_modification.sqf"],
	[{true}, [], "Awesome\Functions\voting_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\mobile_menu_functions.sqf"],
	[{true}, [], "Awesome\Functions\speed_gun_functions.sqf"],
	[{isClient}, [], "briefing.sqf"]
];

stats_load_library_list = {
	ARGV(0,_list);
	ARGV(1,_title);
	
	{
		private["_library", "_condition", "_arguments", "_file"];
		_library = _x;
		_condition = _library select stats_library_condition;
		_arguments = _library select stats_library_arguments;
		_file = _library select stats_library_file;
		
		[format["%1 ... %2/%3", _title, (_forEachIndex + 1), (count(_list))]] call stats_client_update_loading_title;
		diag_log format["%1 ... %2/%3", _title, (_forEachIndex + 1), (count(_list))];
		
		if ((call _condition)) then {
			private["_h"];
			_h = _arguments execVM _file;
			waitUntil {scriptDone _h};
		};
	} forEach _list
};

stats_server_setup = {
	
	onPlayerDisconnected { [_id, _name, _uid] call stats_server_player_disconnected };
	
	//setup event listener for players trying to load their stats	
		
	stats_load_request_buffer =  " ";
	publicVariableServer "stats_load_request_buffer";
	"stats_load_request_buffer" addPublicVariableEventHandler { _this call stats_load_request_receive;};
	
	//setup event lister for players trying to save their stats
	stats_save_buffer = " ";
	publicVariableServer "stats_save_request_buffer";
	"stats_save_request_buffer" addPublicVariableEventhandler { _this call stats_save_request_receive; };
	
	
	
	//load the SERVER's own variables
	private["_data"];
	_data = [stats_server_uid] call stats_load_request_send;
	[_data, server] call stats_compile_sequential;
	
	
	//keep a count of how many times the server has restarted
	private["_restart_count"];
	_restart_count = server getVariable "restart_count";
	_restart_count = if (undefined(_restart_count)) then {0} else {_restart_count};
	_restart_count = if (typeName _restart_count != "SCALAR") then {0} else {_restart_count};
	_restart_count = _restart_count + 1;
	server setVariable ["restart_count", _restart_count, true];
	["restart_count", _restart_count] call stats_server_save;
	
	if (not(isClient)) then {
		//special case to avoid loading the client libraries twice
		[stats_main_libraries, "Loading client libraries"] call stats_load_library_list;
	};

	server setVariable ["stats_server_setup_complete", true, true];
};


stats_client_server_setup_wait = {
	private["_complete"];
	
	waitUntil {
		_complete = server getVariable "stats_server_setup_complete";
		_complete = if (undefined(_complete)) then {false} else { _complete};
		_complete = if (typeName _complete != "BOOL") then {false} else { _complete };
		if (_complete) exitWith {true};
		false
	};
	_complete
};

stats_compile_loading = {
	private["_data", "_object"];
	_data = _this select 0;
	_object = _this select 1;
	[_data, _object, true, true] call stats_compile;
};

stats_compile_sequential = {
	private["_data", "_object"];
	_data = _this select 0;
	_object = _this select 1;
	[_data, _object, true, false] call stats_compile;
};

stats_compile_parallel = {
	private["_data", "_object"];
	_data = _this select 0;
	_object = _this select 1;
	[_data, _object, false, false] call stats_compile;
};

stats_compile = {
	private["_data", "_object", "_sequential", "_loading"];
	_data = _this select 0;
	_object = _this select 1;
	_sequential = _this select 2;
	_loading = _this select 3;
	
	if (undefined(_data)) exitWith {null};
	if (typeName _data != "ARRAY") exitWith {null};
	
	if (undefined(_object)) exitWith {null};
	if (typeName _object != "OBJECT") exitWith {null};
	
	if (undefined(_sequential)) exitWith {null};
	if (typeName _sequential != "BOOL") exitWith {null};
	
	if (undefined(_loading)) exitWith {null};
	if (typeName _loading != "BOOL") exitWith {null};
	
	
	private["_i", "_count"];
	
	_count = count _data;
	_i = 0;
	while { _i < _count } do {
		private["_entry"];
		_entry = _data select _i;
		
		[_entry, _object] spawn stats_compile_entry;
		
		if (_loading) then {
			[format["Initializing %1/%2 client stats ... ", (_i + 1), (count _data)]] call stats_client_update_loading_title;
		};
		
		if (_sequential) then {
			//uses a time-out approach as opposed to just "CALLING" stats_compile_entry
			//this is so that compilation errors of a single stat entry do not affect compliation
			//of all other stats ... since the error happens in a separate thread
			[_entry, _object, 0.2] call stats_wait_entry;
		};
		_i = _i + 1;
	};
};


stats_wait_entry = {
	private["_entry", "_object", "_timeout"];
	_entry = _this select 0;
	_object = _this select 1;
	_timeout = _this select 2;
	
	if (undefined(_entry)) exitWith {null};
	if (typeName _entry !="ARRAY") exitWith {null};
	if (undefined(_object)) exitWith {null};
	if (typeName _object != "OBJECT") exitWith {null};
	if (isNull _object) exitWith {null};
	if (undefined(_timeout)) exitWith {null};
	if (typeName _timeout != "SCALAR") exitWith {null};
	
	private["_end_time"];
	_end_time = serverTime + 1;
	private["_variable_name"];
	_variable_name = _entry select 0;
	
	waitUntil {
		private["_variable_value"];
		_variable_value = [_object, _variable_name] call object_getVariable;
		if (not(undefined(_variable_value))) exitWith {true};
		if (_end_time < serverTime) exitWith {
			private["_message"];
			_message = format["WARNING: Time-out occurred while initializing %1", _variable_name];
			player groupChat _message;
			diag_log _message;
			true
		};
		false
	};
};

stats_update_variables_list = {
	private["_object", "_variable_name"];
	_object = _this select 0;
	_variable_name = _this select 1;
	
	if (undefined(_object)) exitWith {null};
	if (typeName _object != "OBJECT") exitWith {null};
	if (undefined(_variable_name)) exitWith {null};
	if (typeName _variable_name != "STRING") exitWith {null};
	
	private["_variables_list"];
	_variables_list = [_object] call stats_get_variables_list;
	
	if (not(_variable_name in _variables_list)) then {
		_variables_list = _variables_list + [_variable_name];
		[_object, _variables_list] call stats_set_variables_list;
	};
};

stats_set_variables_list = {
	private["_object", "_variables_list"];
	_object = _this select  0;
	_variables_list = _this select 1;
	
	if (undefined(_object)) exitWith {null};
	if (typeName _object != "OBJECT") exitWith {null};
	if (undefined(_variables_list)) exitWith {null};
	if (typeName _variables_list != "ARRAY") exitWith {null};

	[_object, "stats_variables_list", _variables_list] call object_setVariable;
};

stats_get_variables_list = {
	private["_player"];
	_player = _this select 0;
	if (undefined(_player)) exitWith {null};
	if (typeName _player != "OBJECT") exitWith {null};
	
	private["_variables_list"];
	_variables_list = [_player, "stats_variables_list"] call object_getVariable;
	_variables_list = if (undefined(_variables_list)) then {[]} else {_variables_list};
	_variables_list = if (typeName _variables_list != "ARRAY") then {[]} else {_variables_list};
	_variables_list	
};

stats_copy_variables = {
	private["_old_player", "_new_player"];
	_old_player = _this select 0;
	_new_player = _this select 1;
	
	if (undefined(_old_player)) exitWith {null};
	if (typeName _old_player != "OBJECT") exitWith {null};
	if (undefined(_new_player)) exitWith {null};
	if (typeName _new_player != "OBJECT") exitWith {null};
	
	private["_variables_list"];
	_variables_list = [_old_player] call stats_get_variables_list;

	{
		private["_variable_name", "_variable_value"];
		_variable_name = _x;
		_variable_value = [_old_player, _variable_name] call object_getVariable;
		[_new_player, _variable_name, _variable_value, true] call object_setVariable;
	} forEach _variables_list;
	
	[_new_player, _variables_list] call stats_set_variables_list;
};


stats_compile_entry = {
	//player groupChat format["stats_compile_entry %1", _this];
	private["_entry", "_object"];
	
	_entry = _this select 0;
	_object = _this select 1;
	
	if (undefined(_entry)) exitWith {null};
	if (typeName _entry != "ARRAY") exitWith {null};
	if (count _entry != 2) exitWith {null};
	
	if (undefined(_object)) exitWith {null};
	if (typeName _object != "OBJECT") exitWith {null};
	
	private["_name", "_value"];
	
	_name = _entry select 0;
	_value = _entry select 1;
	_value = (call compile _value) select 0;
	
	if (undefined(_value)) then {
		_value = null;
	};
	
	[_object, _name, _value] call stats_init_entry;
};



stats_init_entry = {
	private["_object", "_variable", "_value"];
	
	_object = _this select 0;
	_variable = _this select 1;
	_value = _this select 2;
	
	if (undefined(_object)) exitWith {null};
	if (typeName _object != "OBJECT") exitWith {null};
	if (undefined(_variable)) exitWith {null};
	if (typeName _variable != "STRING") exitWith {null};

	
	//check if it already has a value
	if ((_object == player) || (_object == server)) then {
		private["_current_value"];
		_current_value = missionNameSpace getVariable _variable;
		if (not(undefined(_current_value))) exitWith {null};
		missionNamespace setVariable [_variable, _value];
		[_object, _variable, _value, true] call object_setVariable;
	}
	else {
		[_object, _variable, _value, true] call object_setVariable;
	};
	
	//diag_log format["%1, %2 = %3", _object, _variable, _value];
	[_object, _variable] call stats_update_variables_list;
};


stats_init_variable = {
	private["_variable", "_value"];
	_variable = _this select 0;
	_value = _this select 1;
	[player, _variable, _value] call stats_init_entry;
};


stats_loading_progress = 0;
stats_loading_active = false;
stats_client_start_loading = {
	stats_loading_active = true;
	startLoadingScreen["" , "customLoadingScreen"];
};


stats_client_stop_loading = {
	endLoadingScreen;
	stats_loading_active = false;
};

stats_client_update_loading_title = {
	if (isServer) exitwith {};
	
	private["_title"];
	
	_title = _this select 0;
	if (undefined(_title)) exitWith {null};
	if (typeName _title != "STRING") exitWith {null};
	
	startLoadingScreen[_title , "customLoadingScreen"];
	[stats_loading_progress] call stats_client_update_loading_progress;
};


stats_client_update_loading_progress = {
	private["_progress"];
	
	_progress = _this select 0;
	
	if (undefined(_progress)) exitWith {null};
	if (typeName _progress != "SCALAR") exitWith {null};
	if (_progress < 0 || _progress > 1) exitWith {null};
	
	stats_loading_progress = _progress;
	progressLoadingScreen _progress;
};


stats_get_mission_variable = {
	private["_variableName"]; 
	_variableName = _this select 0;
	if (undefined(_variableName)) exitWith {null};
	if (typeName _variableName != "STRING") exitWith {null};
	private["_variable"];
	_variable = missionNamespace getVariable [_vehicle_name, null];
	if (undefined(_variable)) exitWith {null};
	_variable
};

stats_server_wipe_player_data = {
	private["_player_variable"]; 
	_player_variable = _this select 0;
	_player = [_player_variable] call stats_get_mission_variable;
	if (undefined(_player)) exitWith {null};
	
	private["_uid"];
	_uid = [_player] call stats_get_uid;
	if (undefined(_uid)) exitWith {null};
	[_uid] call wipePlayerVariables;
};

stats_server_wipe_all_data = {
	call wipeAllPlayerVariables;
};

stats_client_wait_uid = {
	private["_uid"];
	
	//work-around cannot do waitUtil in preloading screen
	waitUntil {
		_uid = [player] call stats_get_uid;
		if (_uid != "") exitWith {true};
		false
	};
	
	_uid
};


stats_client_setup = {

	call stats_client_start_loading;
	["Waiting for server initialization ... "] call stats_client_update_loading_title;
	[0.2] call stats_client_update_loading_progress;
	call stats_client_server_setup_wait;
	uiSleep 1;
	
	["Waiting for player uid ... "] call stats_client_update_loading_title;
	[0.4] call stats_client_update_loading_progress;
	uiSleep 1;
	
	private["_uid"];
	_uid = call stats_client_wait_uid;
	
	["Fetching client stats from server ... "] call stats_client_update_loading_title;
	[0.6] call stats_client_update_loading_progress;
	uiSleep 1;
	private["_data"];
	_data = [_uid] call stats_load_request_send;
	
	[format["Initializing %1 client stats ... ", (count _data)]] call stats_client_update_loading_title;
	[0.7] call stats_client_update_loading_progress;
	uiSleep 1;
	[_data, player] call stats_compile_loading;
	
	
	[format["Loading libraries ... "]] call stats_client_update_loading_title;
	[0.8] call stats_client_update_loading_progress;
	
	
	[stats_main_libraries, "Loading client libraries"] call stats_load_library_list;

	
	[format["Restoring client continuity ... "]] call stats_client_update_loading_title;
	[0.9] call stats_client_update_loading_progress;
	uiSleep 1;
	call player_continuity;
	call jip_load;

	["Client stats setup complete ... "] call stats_client_update_loading_title;
	[1] call stats_client_update_loading_progress;
	uiSleep 1;
	call stats_client_stop_loading;
};

stats_setup = {
	diag_log format["Stats_setup starting, server: %1", isServer];

	diag_log format["Stats_setup: Loading core"];
	[stats_core_libraries, "Loading core libraries"] call stats_load_library_list;
	
	if (isClient) then {
		diag_log format["Stats_setup: Loading client 1"];
		[player] call limbo_base_enter;
	};
	
	if (isServer) then {
		diag_log format["Stats_setup: Loading server"];
		[] call stats_server_setup;
	};
	
	if (isClient) then {
		diag_log format["Stats_setup: Loading client 2"];
		[] call stats_client_setup;
	};
	
	diag_log format["Stats_setup Complete"];
};

[] call stats_setup;

stats_functions_defined =  true;