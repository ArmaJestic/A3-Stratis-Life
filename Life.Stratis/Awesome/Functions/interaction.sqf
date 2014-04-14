#include "macro.h"
#include "constants.h"
#include "dikcodes.h"

if (not(undefined(interaction_functions_defined))) exitWith {null};


interact_frisk_handler = {
	ARGV(2,_this);
	ARGV(0,_player);
	ARGV(1,_target);
	[_player, _target] call interact_frisk_player;
};

interact_hint = {
	ARGV(0,_message);
	if (undefined(_message)) exitWith {};
	hint _message;
};

CHAT_GLOBAL = 0;
CHAT_SIDE = 1;
CHAT_GROUP = 2;
CHAT_VEHICLE = 3;
CHAT_COMMAND = 4;
CHAT_SYSTEM = 5;

interact_chat = {
	ARGV(0,_message);
	ARGV(1,_channel);
	ARGV(2,_speaker);
	
	if (undefined(_message)) exitWith {};
	if (typeName _message != "STRING") exitWith {};
	
	if (undefined(_speaker)) exitWith {
		_speaker = player;
	};
	
	if (undefined(_channel)) then {
		_channel = CHAT_GROUP;
	};
		
	if (_channel == CHAT_GLOBAL) exitWith {
		_speaker globalChat _message;
	};
	
	if (_channel == CHAT_SIDE) exitWith {
		_speaker sideChat _message;
	};
	
	if (_channel == CHAT_GROUP) exitWith {
		_speaker groupChat _message;
	};
	
	if (_channel == CHAT_VEHICLE) exitWith {
		_speaker vehicleChat _message;
	};
	
	if (_channel == CHAT_COMMAND) exitWith {
		_speaker commandChat _message;
	};
	
	if (_channel == CHAT_SYSTEM) exitWith {
		systemChat _message;
	};
};

interact_title_text = {
	ARGV(0,_message);
	ARGV(1,_type);
	ARGV(2,_speed);
	
	if (undefined(_message)) exitWith {};
	if (undefined(_type)) then {
		_type = "PLAIN";
	};
	
	if (undefined(_speed)) then {
		_speed = 1;
	};

	if (typeName _message != "STRING") exitWith {};	
	if (typeName _type != "STRING") exitWith {};
	if (typeName _speed != "SCALAR") exitWith {};
	
	titleText[_message, _type, _speed];
};


interact_arrest_handler = {
	ARGV(2,_this);
	ARGV(0,_player);
	ARGV(1,_target);
	
	[_player,_target] call arrest_menu_create;
};

interact_ticket_handler = {
	ARGV(2,_this);
	ARGV(0,_player);
	ARGV(1,_target);
	[_player,_target] call ticket_menu_create;
};


interact_civilian_menu = {
	ARGV(0,_player);
	ARGV(1,_target);
	
	private["_buttons"];
	_buttons = [
		["Rob Player", interact_rob_handler, [_player, _target]],
		["Frisk Player", interact_frisk_handler, [_player, _target]]
	];
	
	[toUpper("Interaction Menu"), _buttons] call main_menu_setup;
};


interact_police_menu = {
	ARGV(0,_player);
	ARGV(1,_target);
	
	private["_buttons"];
	_buttons = [
		["Disarm", interact_disarm_handler, [_player,_target]],
		["Drug Search", interact_search_handler, [_player,_target]],
		["Arrest", interact_arrest_handler, [_player,_target]],
		["Restrain/Release", interact_restrain_handler, [_player,_target]],
		["Ticket", interact_ticket_handler, [_player,_target]],
		["Heal", interact_heal_handler, [_player,_target]],
		["Frisk", interact_frisk_handler, [_player,_target]]
	];

	[toUpper("Interaction Menu"), _buttons] call main_menu_setup;
};

interact_human = {
	ARGV(0,_player);
	ARGV(1,_target);
	
	if (not([_player] call player_human)) exitWith {false};
	if (not([_target] call player_human)) exitWith {false};
	
	if (([_player] call player_cop) && (not([_target] call player_cop) || ([_player] call player_chief))) exitWith {
		[_player, _target] call interact_police_menu;
		true;
	};
	
	if (([_player] call player_civilian) || ([_player] call player_opfor)  || ([_player] call player_insurgent)) exitWith {
		[_player, _target] call interact_civilian_menu;
		true
	};
	false
};


interact_ai = {
	//player groupChat format["interact_ai %1", _this];
	ARGV(0,_player);
	ARGV(1,_target);
	
	if (undefined(_player)) exitWith {false};
	if (undefined(_target)) exitWith {false};
	
	if (not([_player] call player_human)) exitWith {false};
	if ([_target] call player_human) exitWith {false};
	if (not(_target in shopusearray)) exitWith {false};
	
	private["_id"];
	_id = _target call inventory_get_shop_number;
	
	if(([_player] call player_cop) and (_target in drugsellarray)) exitWith {
		[_id] spawn shop_drug_search;
		true;
	};
	
	private["_handled"];
	if((_target in pmc_shop_list)) exitWith {
		if (not([_player] call player_civilian)) exitWith {
			player groupChat "You cannot access PMC Shops, you are not a civilian";
			true
		};

		if (not([_player] call player_pmc_whitelist)) exitWith {
			player groupChat "You cannot access PMC Shops, the police chief has not added you to the whitelist";
			true
		};
		[_id] call shop_open_dialog;
		true
	};

	[_id] call shop_open_dialog;
	true
};


interact_atm = {
	ARGV(0,_player);
	ARGV(1,_target);
	
	if (undefined(_player)) exitWith {false};
	if (undefined(_target)) exitWith {false};
	
	if (not([_target] call object_atm)) exitWith {};
	
	if(!local_useBankPossible) exitWith {
		hint "The ATM rejected your card";
		false
	};
	
	call bank_menu_dialog;
	true
};





interact_arrest_player = { _this spawn {
	player groupChat format["interact_arrest_player %1", _this];
	ARGV(0,_player);
	ARGV(1,_victim);
	ARGV(2,_minutes);
	ARGV(3,_bail_percent);
	
	if (not([_player] call player_human)) exitWith {};
	if (not([_victim] call player_human)) exitWith {};
	if (undefined(_minutes)) exitWith {};
	if (undefined(_bail_percent)) exitWith {};
	
	
	if (typeName _minutes != "SCALAR") exitWith {};
	if (_minutes <= 0) exitWith {};
	
	if (typeName _bail_percent != "SCALAR") exitWith {};
	if (_bail_percent <= 0) exitWith {};
	
	
	if (not([_victim, "restrained"] call player_get_bool)) exitWith {
		player groupChat format["%1-%2 is not restrained!", _victim, (name _victim)];
	};
	
	if ([_victim] call player_get_arrest) exitWith {
		player groupChat format["%1 is already under arrest!", _victim];
	};
	
	private["_seconds", "_victim_side"];
	_minutes = if ([_victim] call player_civilian) then { _minutes } else { (15 max _minutes)};
	
	private["_message"];
	_message = format["%1-%2 was arrested by %3-%4", _victim, (name _victim), _player, (name _player)];
	format['server globalChat toString(%1);', toArray(_message)] call broadcast;
	

	[_player, "arrestsmade", 1] call player_update_scalar;
	
	private["_bounty"];
	_bounty = [_victim] call player_get_bounty;
	if (_bounty > 0) then {
		player groupChat format["%1-%2 had a bounty of $%3. You got that bounty!", _victim, (name _victim), _bounty];
		[_player, _bounty] call bank_transaction;
		[_victim, 0] call player_set_bounty;
	};
	
	closeDialog 0;
	[[_victim, _minutes], "player_prison_time", _victim] call BIS_fnc_MP;
	[[_victim,_bail_percent], "player_prison_bail", _victim] call BIS_fnc_MP;
	
	//wait until the bail setting is complete to call the convict function
	waitUntil {(([_victim] call player_get_bail) > 0)};
	[[_victim], "player_prison_convict", _victim] call BIS_fnc_MP;
};};

interact_pay_bail = {
	ARGV(0,_player);
	ARGV(1,_bail);

	if (undefined(_player)) exitWith {null};	
	if (undefined(_bail)) exitWith {null};

	_bail = [_bail] call parse_number;
	if (_bail <= 0) exitWith {null};

	private["_money"];
	_money = [_player] call player_get_total_money;

	if (_bail > _money) exitWith {
		player groupChat format["You do not have enough money to pay $%1 in bail", _bail];
	};

	private["_cop_count", "_cop_bail"];
	_cop_count = playersNumber west;
	_cop_bail = round(_bail/_cop_count);
	[_player, _bail] call player_lose_money;
	[_player, -(_bail)] call player_update_bail;
		
	player groupChat format ["You paid $%1 in bail", strM(_bail)];
	private["_message"];
	_message = format["Prisoner %1-%2 paid $%3 in bail", _player, (name _player), strM(_bail)];
	format['if(not(iscop)) then {server globalChat toString(%1);};', toArray(_message)] call broadcast;
		
	_message = format["You got $%1 because prisoner %2-%3 paid %4 in bail", _cop_bail, _player, (name _player), strM(_bail)];
	format['if (iscop) then {server globalChat toString(%1);};', toArray(_message)] call broadcast;
};


interact_restrain_handler = {
	ARGV(2,_this);
	ARGV(0,_player);
	ARGV(1,_target);
	
	[_player, _target] call interact_toggle_restrains;
	closeDialog 0;
};

interact_toggle_restrains = {
	ARGV(0,_player);
	ARGV(1,_victim);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_victim] call player_human)) exitWith {null};
	if (not(alive _victim)) exitWith {null};
	
	private["_inVehicle", "_victim_name"];
	_inVehicle = (vehicle _victim != _victim);
	_victim_name = (name _victim);
	
	if (_inVehicle) exitWith {
		player groupChat format["%1-%2 is in a vehicle!", _victim, _victim_name];
	};
	
	private["_message"];
	if ([_victim, "restrained"] call player_get_bool) then {
		[_victim, "restrained", false] call player_set_bool;
		_message = format["%1-%2 was unrestrained by %3", _victim, _victim_name, (name _player)];
		format['server globalChat toString(%1);', toArray(_message)] call broadcast;
	}
	else {
		if (not([_victim] call player_vulnerable)) exitWith {
			player groupChat format["%1-%2 cannot be restrained, he is not subdued.", _victim, _victim_name];
		};
		
		[_victim, "restrained", true] call player_set_bool;
		_message = format["%1-%2 was restrained by %3", _victim, _victim_name, (name _player)];
		format['server globalChat toString(%1);', toArray(_message)] call broadcast;
	};
};

interact_release_player = {
	ARGV(0,_player);
	ARGV(1,_victim);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_victim] call player_human)) exitWith {null};
	
	if (_victim == player) exitWith {
		player groupChat format["You cannot release yourself from prison"];
	};
	
	if (not([_victim] call player_get_arrest)) exitWith {
		player groupChat format["%1-%2 is not in prison", _victim,  (name _victim)];
	};
	
	private["_message"];
	_message = format["%1-%2 has been set free by %3-%4", _victim, (name _victim), _player, (name _player)];
	format['server globalChat toString(%1);', toArray(_message)] call broadcast;
	[_victim, false] call player_set_arrest;
};

interact_want_player = {
	ARGV(0,_player);
	ARGV(1,_victim);
	ARGV(2,_reason);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_victim] call player_human)) exitWith {null};
	if (undefined(_reason)) exitWith {null};
	if (typeName _reason != "STRING") exitWith {null};
	
	if (_victim == player) exitWith {
		player groupChat format["You cannot set yourself wanted"];
	};
	
	if ([_victim] call player_get_arrest) exitWith {
		player groupChat format["%1-%2 is in prison, cannot be set wanted", _victim,  (name _victim)];
	};
	
	if (not(alive _victim)) exitWith {
		player groupChat format["%1-%2 is not alive, cannot be set wanted", _victim,  (name _victim)];
	};
	
	if (_reason == "Description of crime") exitWith {
		player groupChat "You must enter a description of the crime!"
	};
	
	private["_message"];
	_message = format["%1-%2 has been set wanted by %3-%4 for %5", _victim, (name _victim), _player, (name _player), _reason];
	format['server globalChat toString(%1);', toArray(_message)] call broadcast;
	_reason = _reason + format[" by %1-%2", _player, (name _player)];
	[_victim, _reason, 0] call player_update_warrants;
};


interact_unwant_player = {
	ARGV(0,_player);
	ARGV(1,_victim);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_victim] call player_human)) exitWith {null};
	
	if (_victim == player) exitWith {
		player groupChat format["You cannot set yourself unwanted"];
	};
	
	if (not(([_victim] call player_get_wanted))) exitWith {
		player groupChat format["%1-%2 is not wanted", _victim, (name _victim)];
	};

	private["_message"];
	_message = format["%1-%2 has cleared %3-%4's warrants", _player, (name _player), _victim, (name _victim)];
	format['server globalChat toString(%1);', toArray(_message)] call broadcast;
	[_victim] call player_reset_warrants;
}; 



interact_president_change_laws = {
	ARGV(0,_number);
	ARGV(1,_text);
	
	if (undefined(_number)) exitWith {null};
	if (typeName _number != "SCALAR") exitWith {null};
	
	if (undefined(_text)) exitWith {null};
	if (typeName _text != "STRING") exitWith {null};
	
	if (_number == -1) exitWith {null};
	
	private["_text_length"];
	
	_text_length = [_text] call strlen;
	if (_text_length > 60) exitWith {
		player groupChat "The text for this law is too long";
	};
	
	legislation_laws set [_number, _text]; 
	publicVariable "legislation_laws";
	
	private["_message"];
	_message = format["Law #%1 has changed.\n%2", _number, _text];
	format['hint toString(%1);', toArray(_message)] call broadcast;
};


interact_president_change_taxes = {	
	itemtax = _this select 0;
	vehicletax = _this select 1;
	magazinetax = _this select 2;
	weapontax  = _this select 3;
	bank_tax = _this select 4;	
	publicVariable   "itemtax";
	publicVariable   "vehicletax";
	publicVariable   "magazinetax";
	publicVariable   "weapontax";
	publicVariable   "bank_tax";
	// Redefinition of array uses fewer chars than using array set 
	"economy_tax_data = [ [""Item"", ""Item"", itemtax], [""Vehicle"", ""Vehicle"",vehicletax], [""Magazine"",""Magazine"",vehicletax], [""Weapon"",""Weapon"",weapontax]];
	hint ""The President has changed the tax rates!"";" call broadcast;
};

civilian_camera_cost_per_second = 1000000;

interact_civilian_camera_menu = {_this spawn {
	if (!(createDialog "civcamdialog")) exitWith {hint "Dialog Error!";};
	
	[1] call DialogCivilianPlayersList;
	lbSetCurSel    [1, 0];
	sliderSetRange [2, 5, 30];
	sliderSetSpeed [2, 1, 5];

	while {ctrlVisible 1002} do {
		private["_seconds", "_cost"];
		_seconds =  round(sliderPosition 2);
		_cost = _seconds * civilian_camera_cost_per_second;
		ctrlSetText [3, strM(_cost)]; 
		ctrlSetText [5, str(_seconds)];
	};
};};


interact_simple_camera = { _this spawn {
	ARGV(0,_player);
	ARGV(1,_target);

	if (not(createDialog "free_camera")) exitWith {
		player groupChat format["ERROR: could not create camera dialog"];
	};
	
	private["_camera", "_zoom"];
	_camera = "camera" camCreate [(getPosATL _target select 0) + 40, (getPosATL _target select 1), 20];
	
	_zoom  = [10,30];
	
	buttonSetAction [free_camera_button_nv_on_idc, format["camUseNVG true;"] ];
	buttonSetAction [free_camera_butotn_nv_off_idc, format["camUseNVG false;"] ];
	buttonSetAction [free_camera_button_close_idc, format["closeDialog 0;"] ];
	sliderSetRange [free_camera_slider_light_idc, 0, 200];
	sliderSetSpeed [free_camera_slider_light_idc, 0.05, 20];
	

	ctrlShow [free_camera_slider_zoom_idc, false];
	ctrlShow [free_camera_button_left_idc, false];
	ctrlShow [free_camera_button_up_idc, false];
	ctrlShow [free_camera_button_down_idc, false];
	ctrlShow [free_camera_button_right_idc, false];
	ctrlShow [free_camera_button_stop_idc, false];

	_camera cameraEffect ["internal", "back"];
	_camera camSetPos [(getPosATL _target select 0)+40,(getPosATL _target select 1),20];
	_camera camSetTarget _target;
	_camera camSetFOV 0.700;
	_camera camPreload 5;
	_camera camCommit 0;
	
	private["_light_slider"];
	_light_slider = 0;
	waitUntil {
		if ( (sliderPosition free_camera_slider_light_idc) != _light_slider ) then {
			_light_slider = (sliderPosition free_camera_slider_light_idc);
			if (_light_slider < 600) then {
				setAperture _light_slider;
			}else{
				setAperture -1;
			};
		};
		not(ctrlVisible free_camera_button_close_idc)
	};

	_camera cameraEffect ["terminate","back"];
	titleCut [" ","Black in",1];
	camDestroy _camera;
};};


interact_player_camera = {_this spawn {
	ARGV(0,_target);
	ARGV(1,_watchtime);

	private["_tx", "_ty", "_tz", "_tpos"];
	_tpos = getPosATL _target;
	_tx = _tpos select 0;
	_ty = _tpos select 1;
	_tz = _tpos select 2;
	
	private["_camera"];
	_camera = "camera" camcreate [_tx, _ty, 15];
	
	if (not(createDialog "free_camera")) exitWith {
		player groupChat format["ERROR: could not create civilian camera dialog"];
	};
	

	_camera cameraEffect ["internal", "back"];
	_camera camSetPos [(getPosATL vehicle _target select 0),(getPosATL vehicle _target select 1), 10];
	_camera camSetTarget vehicle _target;
	_camera camSetFOV 0.700;
	_camera camPreload 5;
	_camera camCommit 0;
	waitUntil {camCommitted _camera};
	_camera camsetpos [_tx, _ty ,10];
	_camera camSetTarget vehicle _target;
	_camera camSetFOV 0.700;
	_camera camCommit 0;
	
	private["_endTime"];
	_endTime = time + _watchtime;

	
	buttonSetAction [free_camera_button_nv_on_idc, format["camUseNVG true;"]];
	buttonSetAction [free_camera_butotn_nv_off_idc, format["camUseNVG false;"]];
	buttonSetAction [free_camera_button_close_idc, format["closeDialog 0;"]];
	sliderSetRange [free_camera_slider_zoom_idc, 0, 50];
	sliderSetSpeed [free_camera_slider_zoom_idc, 100, 250];
	sliderSetPosition [free_camera_slider_zoom_idc, 10];
	sliderSetRange [free_camera_slider_light_idc, 0, 200];
	sliderSetSpeed [free_camera_slider_light_idc, 0.05, 20];
	
	ctrlShow [free_camera_button_left_idc, false];
	ctrlShow [free_camera_button_up_idc, false];
	ctrlShow [free_camera_button_down_idc, false];
	ctrlShow [free_camera_button_right_idc, false];
	ctrlShow [free_camera_button_stop_idc, false];

	private["_tx", "_ty", "_tpos", "_td", "_tz", "_dx", "_slider2"];
	_dx = -20;
	_slider2 = 0;
	
	waitUntil {
		_tpos = getPosATL (vehicle _target);
		_tx = _tpos select 0;
		_ty = _tpos select 1;
		_tz = _tpos select 2;
		_td = getDir (vehicle _target);
		
		_camera camSetTarget [(10 * sin(_td)+ _tx), (10*cos(_td)+_ty), _tz];
		_camera camSetPos [(_tx + _dx * sin(_td)), (_ty + _dx * cos(_td)), (_tz+(round(sliderPosition free_camera_slider_zoom_idc)))];
		_camera camSetFOV 0.700;
		_camera camCommit 0;
		waituntil {camCommitted _camera};
		
		if ((sliderPosition free_camera_slider_light_idc) != _slider2 ) then {
			_slider2 = (sliderPosition free_camera_slider_light_idc);
			if (_slider2 < 600) then {
				setAperture _slider2;
			}
			else{
				setAperture -1;
			};
		};

		(not(ctrlVisible free_camera_button_close_idc) || time > _endTime)
	};

	setAperture -1;
	_camera cameraEffect ["terminate","back"];
	titleCut [" ","Black in",1];
	camDestroy _camera;
	closeDialog 0;
};};


interact_civilian_camera = {
	ARGV(0,_player);
	ARGV(1,_target);
	ARGV(2,_watchtime);

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	
	if (_player != player) exitWith {};
	
	if (true) exitWith {
		player groupChat format["ERROR: Civilian camera is disabled"];
	};
	
	private["_cost"];
	_cost = _watchtime * civilian_camera_cost_per_second;
	
	private["_money"];
	_money = [_player] call player_get_total_money;
	
	if (_money < _cost) exitWith {
		player groupChat format["You do not have enough money to use civilian camera"];
	};
	
	[_player, _cost] call player_lose_money;
	
	
	if (not(([_target] call player_get_bounty) > 0)) exitWith {
		player groupChat format["%1-%2 cannot be watched, he is not wanted", _target, (name _target)];
	};
	
	private["_message"];
	_message = format["%1-%2 has paid $%3 to watch %4-%5 for %6 second/s in civilian camera!", _player, (name _player), strM(_cost), _target, (name _target), _watchtime];
	format['server globalChat toString(%1);', toArray(_message)] call broadcast;
	
	[_target, _watchtime] call interact_player_camera;
};

satellite_camera_move = {
	ARGV(0,_offset);
	private["_camera", "_commit_time"];
	
	_camera = [player, "satellite_camera"] call object_getVariable;
	_commit_time = [player, "satellite_camera_commit_time"] call object_getVariable;

	private["_position"];
	_position = getPos _camera;
	_position set [0, ((_position select 0) + (_offset select 0))];
	_position set [1, ((_position select 1) + (_offset select 1))];
	_position set [2, ((_position select 2) + (_offset select 2))];
	
	_camera camSetPos _position; 
	_camera camCommit _commit_time;
};

satellite_camera_keydown_handler = {
	//player groupChat format["satellite_camera_keydown_handler %1", _this];
	ARGV(1,_key);
	
	private["_offset"];
	_offset = [0,0,0];
	switch (_key) do {
		case DIK_W: { _offset = [0, 100,0];};
		case DIK_A: { _offset = [-100, 0, 0];};
		case DIK_D: { _offset = [100, 0, 0];};
		case DIK_S: { _offset = [0, -100, 0];};
		case DIK_F: { _offset = [0,0,0];};
	};
	
	[_offset] call satellite_camera_move;
};


interact_satellite_camera = {_this spawn {
	ARGV(0,_player);
	ARGV(1,_position);

	private["_camera", "_commit_time"];
	_commit_time = 1;
	_camera = "camera" camCreate _position;
	_camera cameraEffect ["internal", "back"];
	_camera camSetFOV 0.700;
	_camera camPreload 5;
	_camera camCommit 0;
	_camera setVectorUp [(sin 0)*(cos -89),-(sin -89),(cos 0)*(cos -89)];
	waitUntil {camCommitted _camera};
	
	[_player, "satellite_camera", _camera] call object_setVariable;
	[_player, "satellite_camera_commit_time", 1] call object_setVariable;

	if (!(createDialog "free_camera")) exitWith {
		player groupChat format["ERROR: could not create satellite camera dialog"];
	};

	(findDisplay free_camera_dialog_idd) displaySetEventHandler["KeyDown", "_this call  satellite_camera_keydown_handler"];

	buttonSetAction [free_camera_button_left_idc, "[[-100, 0, 0]] call satellite_camera_move"];
	buttonSetAction [free_camera_button_up_idc, "[[0, 100, 0]] call satellite_camera_move"];
	buttonSetAction [free_camera_button_down_idc, "[[0, -100, 0]] call satellite_camera_move"];
	buttonSetAction [free_camera_button_right_idc, "[[100, 0, 0]] call satellite_camera_move"];
	buttonSetAction [free_camera_button_nv_on_idc, "camUseNVG true;"];
	buttonSetAction [free_camera_butotn_nv_off_idc, "camUseNVG false;"];
	buttonSetAction [free_camera_button_stop_idc, "[[0, 0, 0]] call satellite_camera_move"];
	buttonSetAction [free_camera_button_close_idc, "closeDialog 0;"];
	sliderSetRange [free_camera_slider_zoom_idc, 175, 1500];
	sliderSetSpeed [free_camera_slider_zoom_idc, 100, 250];
	sliderSetRange [free_camera_slider_light_idc, 0, 200];
	sliderSetSpeed [free_camera_slider_light_idc, 0.05, 20];

	private["_slider1", "_slider2"];
	_slider1 = 0;
	_slider2 = 0;

	waitUntil {
		if ( (round(sliderPosition free_camera_slider_zoom_idc)) != _slider1 ) then {
			_slider1 = (round(sliderPosition free_camera_slider_zoom_idc));
			_camera camsetpos [(getpos _camera select 0), (getpos _camera select 1), _slider1]; 
			_camera camCommit _commit_time;
		};

		if ((sliderPosition free_camera_slider_light_idc) != _slider2 ) then {
			_slider2 = (sliderPosition free_camera_slider_light_idc);
			if (_slider2 < 600) then {
				setAperture _slider2;
			} 
			else {
				setAperture -1;
			};
		};
		
		not(ctrlVisible free_camera_button_close_idc)
	};

	_camera cameraEffect ["terminate", "back"];
	titleCut [" ","Black in", 0];
	camDestroy _camera;
};};

interact_warrants_menu = { _this spawn {
	if (!(createDialog "wantedrelease")) exitWith {hint "Dialog Error!";};
	[1] call DialogNotCopsList;
	lbSetCurSel [1, 0];
	[11] call DialogNotCopsList;
	lbSetCurSel [11, 0];
};};

interact_mobile_receive = {
	ARGV(0,_player);
	ARGV(1,_sender);
	ARGV(2,_text);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_sender] call player_human)) exitWith {null};
	if (_player != player) exitWith {null};
	
	private["_header"];
	_header = format["%1-%2 sent you a text message.", _sender, (name _sender)];
	
	titleText [_header + "\n" + _text, "PLAIN"];
	player groupChat (_header + " " + _text);
};


interact_mobile_send = {
	//player groupChat format["interact_mobile_send %1", _this];
	ARGV(0,_player);
	ARGV(1,_target);
	ARGV(2,_text);
	
	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (_player != player) exitWith {};
	
	if (undefined(_text)) exitWith {};
	if (typeName _text != "STRING") exitWith {};
	
	if (_text == "" || {_text == mobile_default_text}) exitWith {
		player groupChat format["You cannot send an empty message"];
	};
	
	private["_max_size"];
	_max_size = mobile_max_text;
	if (([_text] call strlen) > _max_size) then {
		_text = [_text, 0, 139] call substr;
		player groupChat format["Your text message was truncated to %1 characters", _max_size];
	};

	private["_money", "_cost"];
	_money  = [player, 'money'] call inventory_get_item_amount;
	_cost = INV_smscost;
	
	if (_money < _cost) exitWith {
		player groupChat format["Text messages cost %1, you do not have enough money on you.", strM(INV_smscost)];
	};
	
	[_player, 'money', -(_cost)] call inventory_add_item;
	
	if (not(([_target, "handy"] call inventory_get_item_amount) > 0)) exitWith {
		player groupChat format["%1-%2 does not have a mobile phone, your text message bounced", _target, (name _target)];
	};

	player groupChat format["You sent a text message to %1-%2 for $%3", _target, (name _target), strM(_cost)];
	
	private["_message"];
	_message = format["%1", _text];
	format['[%1, %2, toString(%3)] spawn interact_mobile_receive;', _target, _player, toArray(_message)] call broadcast;
};

interact_mobile_use = {
	[] call mobile_menu_setup;
	
	//populate the list of player
	{
		private["_variable_name", "_variable_value"];
		_variable_name = _x;
		_variable_value = missionNamespace getVariable [_variable_name, null];
		
		if ([_variable_value] call player_exists) then {
			player groupChat format["_variable_value = %1", _variable_value];
			private["_index"];
			_index = lbAdd[mobile_players_field_idc, format["%1 - (%2)", _variable_value, (name _variable_value)]];
			lbSetData [mobile_players_field_idc, _index, _variable_name];
			if (_index == 0) then {
				lbSetCurSel [mobile_players_field_idc, _index];
			};
		};
	} forEach playerstringarray;
};

interact_deposit_receive = {
	ARGV(0,_player);
	ARGV(1,_sender);
	ARGV(2,_amount);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_sender] call player_human)) exitWith {null};
	if (_player != player) exitWith {null};
	
	if (undefined(_amount)) exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	if (_amount <= 0) exitWith {null};
	
	[_player, _amount] call bank_transaction;
	
	player groupChat format["You received $%1 from %2-%3 on your bank account", strM(_amount), _sender, (name _sender)];
};

interact_deposit_other = {
	ARGV(0,_player);
	ARGV(1,_target);
	ARGV(2,_amount);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	if (_player != player) exitWith {null};
	
	if (undefined(_amount)) exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	if (_amount <= 0) exitWith {null};
	
	
	private["_player_variable", "_player_variable_name", "_bank_amount"];
	private["_tax_fee", "_total_due", "_bank_tax"];
	_bank_tax = ["Bank"] call economy_lookup_tax_value_type;
	_tax_fee = round(_amount * (_bank_tax/100));	
	_total_due = _tax_fee + _amount;
	_bank_amount = [_player] call bank_get_value;
	
	if (_bank_amount < _total_due) exitWith {
		player groupChat format["You do not have enough money in your account to send $%1, with tax fee $%2", strM(_amount), strM(_tax_fee)];
	};
	
	[_player, -(_total_due)] call bank_transaction;
	[_tax_fee] call shop_update_taxes;
	
	player groupChat format["You have sent $%1 to %2-%3, your tax fee was $%4", strM(_amount), _target, (name _target), strM(_tax_fee)];
	format['[%1, %2, %3] call interact_deposit_receive;', _target, _player, strN(_amount)] call broadcast;
};

interact_check_trx_minimum = {
	ARGV(0,_amount);
	private["_minimum"];
	_minimum = 10;
	if (_amount < _minimum) exitWith {
		player groupChat format["THe minimum about for a bank transaction is $%1", strM(_minimum)];
		true
	};
	false
};

interact_deposit_self ={
	ARGV(0,_player);
	ARGV(1,_target);
	ARGV(2,_amount);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	if (_player != player) exitWith {null};
	
	if (undefined(_amount)) exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	if (_amount <= 0) exitWith {null};
	
	if ([_amount] call interact_check_trx_minimum) exitWith {null};
	
	private["_money"];
	_money = [player, 'money'] call inventory_get_item_amount;
	
	if (_money < _amount) exitWith {
		player groupChat format["You do not have enough money in your inventory to deposit $%1", strM(_amount)];
	};
	
	player groupChat format["You have deposited $%1 into your bank account", strM(_amount)];
	[_player, _amount] call bank_transaction;
	[_player, 'money', -(_amount)] call inventory_add_item;
};

interact_deposit = {
	ARGV(0,_player);
	ARGV(1,_target);
	ARGV(2,_amount);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	
	if (_player != player) exitWith {null};
	
	if (undefined(_amount)) exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	if (_amount <= 0) exitWith {null};
	
	if ([_amount] call interact_check_trx_minimum) exitWith {null};
		
	if (_player == _target) exitWith {
		(_this call interact_deposit_self)
	};

	(_this call interact_deposit_other)	
};

interact_withdraw = { 
	ARGV(0,_player);
	ARGV(1,_amount);
	
	if (not([_player] call player_human)) exitWith {null};
	if (_player != player) exitWith {null};
	
	if (undefined(_amount)) exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	if (_amount <= 0) exitWith {null};
	
	if ([_amount] call interact_check_trx_minimum) exitWith {null};
	
	private["_bank_amount"];
	_bank_amount = [_player] call bank_get_value;
	
	if (_amount > _bank_amount) exitWith {
		player groupChat format["You do not have enough money on your bank account to withdraw $%1", strM(_amount)];
	};
	
	[_player, -(_amount)] call bank_transaction;
	[_player, 'money', (_amount)] call inventory_add_item;
	player groupChat format["You have withdrawn $%1 from your bank account", strM(_amount)];
};




interact_toggle_side_markers = {
	ARGV(0,_title);
	ARGV(1,_player);
	
	if (undefined(_player)) exitWith {null};
	if (_player != player) exitWith {null};
	
	private["_sidemarkers"];
	_sidemarkers = [_player, "sidemarkers"] call player_get_bool;
	_sidemarkers = not(_sidemarkers);
	[_player, "sidemarkers", _sidemarkers] call player_set_bool;
	
	if (not(_sidemarkers)) then {
		player groupChat format["Side markers disabled"];
	}
	else {
		player groupChat format["Side markers enabled"];
	};
};





interact_inventory_menu = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	if (!(createDialog "inventory_menu")) exitWith {hint "Dialog Error!";};
	
	[] call inventory_menu_setup;
	
	//populate the inventory list
	private["_i", "_inventory"];
	_i = 0;
	_inventory = [_player] call player_get_inventory;
	while { _i < (count _inventory) } do {if (true) then {
	
		private["_entry"];
		_entry = (_inventory select _i);
		
		private ["_item", "_number"];
		_item = (_entry select 0);
		_number = [(_entry select 1)] call decode_number;
		
		private["_data", "_type", "_class"];
		_data = ITEM_DATA(_item);
		

		if (_number > 0 && count(_data) > 0) then {
			private["_lbl_name"];
			_lbl_name = (ITEM_DATA_NAME(_data));
			private["_index"];
			_index = lbAdd[inventory_items_list_idc, _lbl_name];
			lbSetData [inventory_items_list_idc, _index, _item];
			
			_type = ITEM_DATA_TYPE(_data);
			_class = ITEM_DATA_CLASS(_data);
		
			private["_picture"];
			_picture = [_item, _class, _type] call object_icon;
			lbSetPicture [inventory_items_list_idc, _index,  _picture];
			//player groupChat format["_picture = %1", _picture];
		};
		
		_i = _i + 1;
	};};
	
	lbSetCurSel [inventory_items_list_idc, 0];

	//populate the player's list
	private["_c"];
	_c = 0;
	while { _c < (count playerstringarray) } do {
		private["_player_variable_name", "_player_variable"];
		_player_variable_name = playerstringarray select _c;
		_player_variable = missionNamespace getVariable [_player_variable_name, null];
		
		if ([_player_variable] call player_human) then {
			private["_player_name"];
			_player_name = (name _player_variable);
			_index = lbAdd [inventory_player_list_idc, format ["%1 - (%2)", _player_variable_name, _player_name]];
			lbSetData [inventory_player_list_idc, _index, format["%1", _player_variable_name]];
		};
		_c = _c + 1;
	};

	lbSetCurSel [inventory_player_list_idc, 0];
};


interact_check_distance = {
	ARGV(0,_player);
	ARGV(1,_target);
	ARGV(2,_interaction);

	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	if (undefined(_interaction)) exitWith {null};
	if (typeName _interaction != "STRING") exitWith {null};
	
	private["_distance"];
	_distance = _player distance _target;
	
	if ((_distance > 5)) exitWIth {
		player groupChat format["You cannot %1 %2-%3, you are too far", _interaction, _target, (name _target)];
		false
	};

	if (not(alive _target)) exitWith {
		player groupChat format["You cannot %1 %2-%3, he is dead", _interaction, _target, (name _target)];
		false
	};
	
	true	
};

interact_check_armed = {
	ARGV(0,_player);
	ARGV(1,_target);
	ARGV(2,_interaction);

	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	if (undefined(_interaction)) exitWith {null};
	if (typeName _interaction != "STRING") exitWith {null};

	
	if (not([player] call check_armed_player)) exitWith {
		player groupChat format["You cannot %1 %2-%3, you are not armed", _interaction, _target, (name _target)];
		false
	};
	
	true
};


/////////////// HEALING ///////////////

interact_heal_handler = {
	ARGV(2,_this);
	ARGV(0,_player);
	ARGV(1,_target);
	
	[_player, _target] call interact_heal_player;
};

interact_heal_player = {
	ARGV(0,_player);
	ARGV(1,_target);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	
	private["_interaction"];
	_interaction = "heal";
	if (not([_player, _target, _interaction] call interact_check_distance)) exitWith {null};
	
	player groupChat format["You healed %1-%2", _target, (name _target)];
	[[_player,_target], "interact_heal_receive", _target] call BIS_fnc_MP;
};

interact_heal_receive = {
	ARGV(0,_player);
	ARGV(1,_target);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	
	if (_target != player) exitWith {null};
	
	player setDamage 0;
	player groupChat format["%1-%2 healed you", _player, (name _player)];
};


//////////////////// CHECK INVENTORY ////////////////////

interact_frisk_player = {
	player groupChat format["interact_frisk_player %1", _this];
	ARGV(0,_player);
	ARGV(1,_target);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	
	if (_player != player) exitWith {null};
	
	private["_interaction"];
	_interaction = "search";
	if (not([_player, _target, _interaction] call interact_check_distance)) exitWith {null};
	if (not([_player, _target, _interaction] call interact_check_armed)) exitWith {null};
	

	if(!([_target] call player_vulnerable))exitwith{
		player groupChat format["%1-%2 does not have his hands up, or is subdued", _target, (name _target)];
	};
	
	private["_buttons"];
	_buttons = [
		["Inventory", frisk_show_inventory, [_target]],
		["Weapons", frisk_show_weapons, [_target]],
		["Licenses", frisk_show_licenses, [_target]],
		["Magazines", frisk_show_magazines, [_target]]
	];
	
	[toUpper("Frisk Player"), _buttons] call main_menu_setup;
};




//////////////////// ROBBING ////////////////////

interact_rob_player = {	
	ARGV(0,_player);
	ARGV(1,_target);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	
	if (_player != player) exitWith {null};
	
	private["_interaction"];
	_interaction = "rob";
	if (not([_player, _target, _interaction] call interact_check_distance)) exitWith {null};
	if (not([_player, _target, _interaction] call interact_check_armed)) exitWith {null};
	

	private["_near_cops"];
	if (([player, 40] call player_near_cops) && not([_target] call player_cop)) then {
		player groupChat format["You cannot rob %1-%2, there is a cop near", _target, (name _target)];
	};
	
	if (not([_target] call player_vulnerable)) exitWith {
		player groupChat format["%1-%2 does not have his hands up, or is not subdued", _target, (name _target)];
	};

	private["_recently_robbed"];
	_recently_robbed = [_target, "recently_robbed", false] call object_getVariable;
	if (_recently_robbed) exitWith {
		player groupChat format["%1-%2, this player has been recently robbed. You cannot mug him now.", (_player), (name _player)];
	};
	
	private["_money"];
	_money  = [_target, 'money'] call inventory_get_item_amount;
	
	private["_amount"];
	_amount = (floor(random _money));
	
	if ((_money <= 0) || (_amount <= 0)) exitwith {
		[_player, format["(failed-armed-robbery, %1-%2)", _target, (name _target)], 20000] call player_update_warrants;
		private["_message"];
		_message = format["%1-%2 attemted to rob %3-%4 but failed", _player, (name _player), _target, (name _target)];
		[[_message], "interact_hint", true] call BIS_fnc_MP;
	};
	
	[_target, "money", -(_amount)] call inventory_add_item;
	[_player, "money", _amount] call inventory_add_item;
	
	
	[_player, format["(armed-robbery, %1-%2)", _target, (name _target)], _amount] call player_update_warrants;
	
	private["_message"];
	_message = format["%1-%2 stole $%3 from %4-%5", _player, (name _player), strM(_amount), _target, (name _target)];
	[[_message], "interact_hint", true] call BIS_fnc_MP;
	[[_target, 300], "interact_rob_timeout", _target] call BIS_fnc_MP;
};


interact_rob_timeout = { _this spawn {
	ARGV(0,_target);
	ARGV(1,_timeout);
	
	if (not([_target] call player_exists)) exitWith {};
	if (_target != player) exitWith {};
	if (undefined(_timeout)) exitWith {};
	if (typeName _timeout != "SCALAR") exitWith {};
	
	
	private["_recently_robbed"];
	_recently_robbed = [_target, "recently_robbed", false] call object_getVariable;
	if (_recently_robbed) exitWith {};
	
	[_target, "recently_robbed", true, true] call object_setVariable;
	sleep _timeout;
	[_target, "recently_robbed", false, true] call object_setVariable;
};};


interact_rob_active = false;
interact_rob_handler = {
	ARGV(2,_this);
	ARGV(0,_player);
	ARGV(1,_target);
	
	if (interact_rob_active) exitWith {
		player groupChat format["%1-%2, you are already robbing a player", (_player), (name _player)];
	};
	interact_rob_active = true;
	[_player, _target] call interact_rob_player;
	interact_rob_active = false;
	closeDialog 0;
};


//////////////////// DRUG SEARCHING ////////////////////
interact_search_handler = {
	ARGV(2,_this);
	ARGV(0,_player);
	ARGV(1,_target);
	
	[_player,_target] call interact_search;
};

interact_search = {
	ARGV(0,_player);
	ARGV(1,_target);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	
	if (_player != player) exitWith {null};
	
	private["_interaction"];
	_interaction = "search";
	if (not([_player, _target, _interaction] call interact_check_distance)) exitWith {null};
	if (not([_player, _target, _interaction] call interact_check_armed)) exitWith {null};

	private["_amount"];
	_amount = [_target] call interact_search_count;
	
	if (_amount <= 0) exitWith {
		_player groupChat format["%1-%2 does not have any drugs", _target, (name _target)];
	};
	
	[_target, ([_target] call player_inventory_name), "drug"] call inventory_storage_remove_kind;
	[_target, "(drug-possession)", _amount] call player_update_warrants;
	
	//individual message to the cop
	private["_message"];
	_message = format["%1-%2 had drugs, you removed them. You should arrest %1-%2 or give him a ticket of $%3. ", _target, (name _target), strM(_amount/2)];
	_player groupChat _message;
	
	//global message announcing player had drugs
	_message = format["%1-%2 had $%3 worth of drugs.", _target, (name _target), strM(_amount)];
	[[_message], "interact_title_text", true] call BIS_fnc_MP;
	
	//individual message to the target
	_message = format["%1-%2 removed your drugs.", _player, (name _player)];
	[[_message], "interact_chat", _player] call BIS_fnc_MP;
};

interact_search_count = {
	ARGV(0,_target);
	if (not([_target] call player_human)) exitWith {0};

	private["_i", "_drugs_value"];
	_drugs_value = 0;
	_i = 0;
	
	private["_inventory"];
	_inventory = [_target] call player_get_inventory;
	
	while { _i <  (count _inventory) } do {
		private["_item", "_infos"];
		_item   = ((_inventory select _i) select 0);
		_infos  = _item call inventory_get_item_array;
		
		if(toLower(_item call inventory_get_item_kind) == "drug") then {
			private["_amount", "_price"];
			_amount = ([_target, _item] call inventory_get_item_amount);
			_price  = (_infos call inventory_get_item_buy_cost);
			_drugs_value = _drugs_value + (_price*_amount);
		};
		_i = _i + 1;
	};
	
	_drugs_value
};



//////////////////// DISARMING ////////////////////

interact_disarm_handler = {
	ARGV(2,_this);
	ARGV(0,_player);
	ARGV(1,_target);
	
	[_player,_target] call interact_disarm;
	
};

interact_disarm = {
	ARGV(0,_player);
	ARGV(1,_target);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	
	if (_player != player) exitWith {null};
	
	private["_interaction"];
	_interaction = "disarm";
	if (not([_player, _target, _interaction] call interact_check_distance)) exitWith {null};
	if (not([_player, _target, _interaction] call interact_check_armed)) exitWith {null};
	
	
	if(not([_target] call player_vulnerable)) exitWith {
		player groupChat format["You cannot disarm %1-%2, he is not subdued", _target, (name _target)];
	};
	
	private["_weapons"];
	_weapons = (weapons _target);
	if (count _weapons == 0) exitWith {
		player groupChat format["%1-%2 is not armed!", _target, (name _target)];
	};

	private["_message"];
	_message = format["%1-%2 disarmed %3-%4", _player, (name _player), _target, (name _target)];
	[[_message, CHAT_GLOBAL, server], "interact_chat", true] call BIS_fnc_MP;
	[[_player,_target], "interact_disarm_receive", _target] call BIS_fnc_MP;
};


interact_disarm_receive = {
	ARGV(0,_player);
	ARGV(1,_target);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	
	if (_target != player) exitWith {null};
	
	private["_weapons"];
	_weapons = (weapons _target) - nonlethalweapons;
	if (count _weapons > 0) then {
		{_target removeWeapon _x} forEach _weapons;
	};
	
	[_target] call inventory_remove_illegal;
};

//////////////////// TICKETING ////////////////////

interact_ticket = {
	ARGV(0,_player);
	ARGV(1,_target);
	ARGV(2,_amount);
	
	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (_amount <= 0) exitWith {};
	
	if (_player != player) exitWith {};
	
	_amount = round(_amount);
	
	private["_interaction"];
	_interaction = "ticket";
	if (not([_player, _target, _interaction] call interact_check_distance)) exitWith {};
	if (not([_player, _target, _interaction] call interact_check_armed)) exitWith {};
	
	private["_message"];
	_message = format["%1-%2 gave a %3-%4 a ticket of $%5", _player, (name _player), _target, (name _target), strM(_amount)];
	[[_message, CHAT_GLOBAL, server], "interact_chat", true] call BIS_fnc_MP;

	[[_player,_target,_amount], "interact_ticket_receive", _target] call BIS_fnc_MP;
	
};


interact_ticket_distribute = {
	ARGV(0,_player);
	ARGV(1,_target);
	ARGV(2,_amount);
	
	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (_amount <= 0) exitWith {};
	
	if (not([_player] call player_cop)) exitWith {
		_message = format["%1-%2 paid %3-%4's ticket of $%5", _target, (name _target), _player, (name _player), strM(_amount)];
		server globalChat _message;
	};
	
	private["_cop_count", "_cop_money"];
	_cop_count = playersNumber west;
	_cop_money = round(_amount / _cop_count);
	player groupChat format["You got $%1 because %2-%3 paid %4-%5's ticket of $%6", _cop_money, _target, (name _target), _player, (name _player), strM(_amount)];
	[_player, _cop_money] call bank_transaction;
};


interact_ticket_receive = { _this spawn {
	ARGV(0,_player);
	ARGV(1,_target);
	ARGV(2,_amount);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	if (_amount <= 0) exitWith {null};
	
	if (_target != player) exitWith {null};
	
	_amount = round(_amount);

	ticket_menu_response = false;
	private["_message"];
	_message = format["%1-%2 gave you a ticket for $%3. Do you agree to pay?", _player, (name _player), strM(_amount)];
	[toUpper("Ticket Confirmation"), "Yes", "No", _message, 0.14, 0.14, 0.40, 0.20] call yes_no_menu_setup;
	buttonSetAction [yes_no_menu_yes_button_idc, "ticket_menu_response = true; closeDialog 0;"];
	buttonSetAction [yes_no_menu_no_button_idc, "ticket_menu_response = false; closeDialog 0;"];
	waitUntil{(not(ctrlVisible yes_no_menu_yes_button_idc))};
	
	if (not(ticket_menu_response)) exitWith {
		private["_message"];
		_message = format["%1-%2 did not agree to pay %3-%4's ticket of $%5", _target, (name _target), _player, (name _player), strM(_amount)];
		[[_message, CHAT_GLOBAL, server], "interact_chat", true] call BIS_fnc_MP;
	};

	private ["_player_money"];
	_player_money = [_target] call player_get_total_money;
		
	if (_amount > _player_money ) exitWith {
		private["_message"];
		_message = format["%1-%2 did not have enough money to pay %3-%4's ticket of $%5", _target, (name _target), _player, (name _player), strM(_amount)];
		[[_message, CHAT_GLOBAL, server], "interact_chat", true] call BIS_fnc_MP;
	};

	[_target, _amount] call player_lose_money;
	[[_player,_target,_amount], "interact_ticket_distribute", true] call BIS_fnc_MP;
};};



interact_side_ai_magazines = {
	ARGV(0,_side);
	if (undefined(_side)) exitWith {[]};
	if (typeName _side != "SIDE") exitWith {[]};
	
	if (_side == west) exitWith { backup_cop_magazines };
	if (_side == east) exitWith { backup_opf_magazines };
	if (_side == resistance ) exitWith { backup_ins_magazines };
	
	[]
};

interact_side_ai_weapons = {
	ARGV(0,_side);
	if (undefined(_side)) exitWith {[]};
	if (typeName _side != "SIDE") exitWith {[]};
	
	if (_side == west) exitWith { backup_cop_weapons };
	if (_side == east) exitWith { backup_opf_weapons };
	if (_side == resistance ) exitWith { backup_ins_weapons };
	[]
};

interact_side_ai_class = {
	ARGV(0,_side);
	if (undefined(_side)) exitWith {""};
	if (typeName _side != "SIDE") exitWith {""};
	
	if (_side == west) exitWith {"UN_CDF_Soldier_EP1"};
	if (_side == east) exitWith {"TK_Soldier_EP1"};
	if (_side == resistance) exitWith {"TK_GUE_Soldier_EP1"};
	""
};

interact_ai_init_handler_persistent = {
	ARGV(0,_unit);
	ARGV(1,_unit_name);
	
	if (undefined(_unit)) exitWith {};
	if (undefined(_unit_name)) exitWith {};
	if (typeName _unit != "OBJECT") exitWith {};
	if (isNull _unit) exitWith {};
	if (typeName _unit_name != "STRING") exitWith {};
	
	_unit setVehicleVarName _unit_name;
	missionNamespace setVariable [_unit_name, _unit];
};

interact_recruit_ai_receive = {
	if (not(isServer)) exitWith {null};
	
	player groupChat format["interact_recruit_ai_receive %1", _this];
	
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};

	private["_class"];
	_class = [([_player] call player_side)] call interact_side_ai_class;
	
	private["_unit"];
	_unit = (group _player) createUnit [_class, position _player, [], 0, "FORM"];
	[_unit] joinSilent (group _player);
	
	private["_unit_name"];
	_unit_name = format["%1_Troop_%2_%3", str(_player), (count (units (group _player))), round(time)];


	//[[_unit,_unit_name], "interact_ai_init_handler_persistent", true,  true] spawn BIS_fnc_MP;
	[[_unit,_unit_name], "interact_ai_init_handler_persistent", true, true, _unit] spawn jip_register;
	waitUntil {not(isNil _unit_name)};
	
	_unit = missionNamespace getVariable [_unit_name, null];
	_backup = call compile (format["%1", _varName]);

	private["_side_ai_weapons", "_side_ai_magazines"];
	
	_side_ai_weapons = [([_player] call player_side)] call interact_side_ai_weapons;
	_side_ai_magazines = [([_player] call player_side)] call interact_side_ai_magazines;
	
	[_unit] call player_reset_gear;
	{ _unit addWeapon _x } forEach _side_ai_weapons;
	{ _unit addMagazine _x } forEach _side_ai_magazines;
	
	reload _unit;
	_unit addMPEventHandler ["MPKilled", { _this call player_handle_mpkilled }];
	format['[%1, %2] call interact_recruit_ai_complete;', _player, _unit] call broadcast;
};


interact_recruit_ai = { _this spawn {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	interact_recruit_ai_busy = if (undefined(interact_recruit_ai_busy)) then { false } else {interact_recruit_ai_busy};
	
	if (interact_recruit_ai_busy) exitWith {
		player groupChat format["Already recruiting AI"];
	};
	
	interact_recruit_ai_busy = true;
	
	private["_money"];
	_money = [_player, 'money'] call inventory_get_item_amount;

	if (_money < 200000) exitWith {
		player groupChat "Not Enough Money";
		interact_recruit_ai_busy = false;
	};

	if (count (units group player) >= 8) exitWith {
		player groupChat "Squad Is Full"; 
		interact_recruit_ai_busy = false;
	};

	[_player, 'money', -(200000)] call inventory_add_item;
	player groupChat "Recruiting soldier";

	format['[%1] call interact_recruit_ai_receive;', _player] call broadcast;
	sleep 1;
	interact_recruit_ai_busy = false;
};};

interact_recruit_ai_complete = {
	ARGV(0,_player);
	ARGV(1,_unit);
	if (not([_player] call player_human)) exitWith {null};
	if (not([_unit] call player_exists)) exitWith {null};
	if (_player != player) exitWith {null};
	
	[_unit] joinSilent (group _player);
};


interact_stranded_check = {
	ARGV(0,_player);
	if ([_player] call player_get_dead) exitWith {};
	if (not([_player] call player_stranded)) exitWith {};
	

	stranded_menu_response = false;
	private["_message"];
	_message = format["Hey there, looks like you are stranded. Do you want to quickly respawn? Note that as a penalty, you will lose your gear, and inventory."];
	[toUpper("Stranded Confirmation"), "Yes", "No", _message, 0.14, 0.14, 0.40, 0.25] call yes_no_menu_setup;
	buttonSetAction [yes_no_menu_yes_button_idc, "stranded_menu_response = true; closeDialog 0;"];
	buttonSetAction [yes_no_menu_no_button_idc, "stranded_menu_response = false; closeDialog 0;"];
	waitUntil{(not(ctrlVisible yes_no_menu_yes_button_idc))};
	
	if (stranded_menu_response) then {
		titleText ["", "BLACK OUT", 1];
		sleep 1;
		
		//[_player] call player_teleport_spawn;
		[5] call player_rejoin_choice;
		
		[_player] call player_reset_gear;
		[_player] call player_reset_side_inventory;
	
		titleText ["", "BLACK IN", 1];
	}
	else {
		player groupChat "Good luck, may the force be with you!";
	};
};



interact_vehicle_storage = {
	ARGV(0,_vehicle);
	ARGV(1,_item);
	ARGV(2,_amount);
	
	if (not([_vehicle] call vehicle_exists)) exitWith {null};
	
	if (undefined(_item)) exitWith {null};
	if (undefined(_amount)) exitWith {null};
	if (typeName _item != "STRING") exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	
	if (_amount == 0) exitWith {null};
	
	private["_class"];
	_class = typeOf _vehicle;
	
	private["_player", "_info", "_v_storage", "_p_storage"];
	_player = player;
	_info = _item call inventory_get_item_array;
	_v_storage = [_vehicle] call vehicle_storage_name;
	_p_storage = [_player] call player_inventory_name;
	
	private["_v_max_weight", "_v_cur_weight", "_own_weight", "_items_weight", "_p_cur_weight", "_p_max_weight", "_v_items_amount", "_p_items_amount" ];
	_v_max_weight = _class call inventory_get_vehicle_max_kg;
	_v_cur_weight = [_vehicle, _v_storage] call inventory_get_storage_weight;
	_p_max_weight = INV_CarryingCapacity;
	_p_cur_weight = (call inventory_get_own_weight);
	_items_weight =  ITEM_DATA_WEIGHT(_info) * abs(_amount);
	
	_v_items_amount = ([_vehicle, _item, _v_storage] call inventory_get_storage_amount);
	_p_items_amount = ([_player, _item, _p_storage] call inventory_get_storage_amount);
	
	private["_valid"];
	_valid = false;
	if (_amount > 0) then {
		//adding items to the vehicle
		if (_amount > _p_items_amount) exitWith {
			player groupChat format["You do not have that many items in your inventory"];
		};
		
		if (_v_max_weight > 0 && (_items_weight + _v_cur_weight) > _v_max_weight) exitWith {
			player groupChat format["The total weight of the items exceed the vehicle's capacity"];
		};
		player groupChat format["You put %1 item(s) into the vehicle", strM(_amount)];
		_valid = true;
	}
	else {
		//removing items from the vehicle
		if (abs(_amount) > _v_items_amount) exitWith {
			player groupChat format["The vehicle does not have that many items"];
		};
		
		if (_p_max_weight> 0 && (_items_weight + _p_cur_weight) > _p_max_weight) exitWith {
			player groupChat format["The total weight of the items exceed the your carrying capacity"];
		};
		
		player groupChat format["You took %1 item(s) out of the vehicle", strM(abs(_amount))];
		_valid = true;		
	};
	
	if (not(_valid)) exitWith {null};
	
	[_vehicle, _item, (_amount), _v_storage] call inventory_storage_add_item;
	[_player, _item, -(_amount), _p_storage] call inventory_storage_add_item;
	
	closeDialog 0;
	call shop_play_animation;
};


interact_factory_storage = {
	ARGV(0,_player);
	ARGV(1,_factory);
	ARGV(2,_item);
	ARGV(3,_amount);
	
	if (not([_player] call player_exists)) exitWith {null};
	
	if (undefined(_factory)) exitWith {null};
	if (undefined(_item)) exitWith {null};
	if (undefined(_amount)) exitWith {null};
	if (typeName _factory != "STRING") exitWith {null};
	if (typeName _item != "STRING") exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	
	if (_amount == 0) exitWith {null};
	
	private["_item_kind"];
	_item_kind = _item call inventory_get_item_kind;
	
	if (not(_item_kind in ["ressource", "ore", "drug", "money"]) && _amount > 0) exitWith {
		player groupChat format ["You can only store money, drugs, and ressources in factories"];
	};

	private["_info", "_f_storage", "_p_storage"];
	_info = _item call inventory_get_item_array;
	_f_storage = _factory;
	_p_storage = [_player] call player_inventory_name;
	
	private["_f_max_weight", "_f_cur_weight", "_items_weight", "_p_cur_weight", "_p_max_weight", "_f_items_amount", "_p_items_amount"];
	_f_cur_weight = [_player, _f_storage] call inventory_get_storage_weight;
	_f_max_weight = -1; //factories ulimited
	_p_max_weight = INV_CarryingCapacity;
	_p_cur_weight = (call inventory_get_own_weight);
	_items_weight = ITEM_DATA_WEIGHT(_info) * abs(_amount);
	
	_f_items_amount = ([_player, _item, _f_storage] call inventory_get_storage_amount);
	_p_items_amount = ([_player, _item, _p_storage] call inventory_get_storage_amount);
	
	private["_valid"];
	_valid = false;
	if (_amount > 0) then {
		//adding items to the factory
	
		if (_amount > _p_items_amount) exitWith {
			player groupChat format["You do not have that many items in your inventory"];
		};
		
		if (_f_max_weight > 0 && (_items_weight + _f_cur_weight) > _f_max_weight) exitWith {
			player groupChat format["The total weight of the items exceed the factory's capacity"];
		};
		_valid =  true;
	}
	else {
		//removing items from the factory
		if (abs(_amount) > _f_items_amount) exitWith {
			player groupChat format["The factory does not have that many item"];
		};
		
		if (_p_max_weight > 0 && (_items_weight + _p_cur_weight) > _p_max_weight) exitWith {
			player groupChat format["The total weight of the items exceed the your carrying capacity"];
		};
		_valid =  true;		
	};
	
	if (not(_valid)) exitWith {null};
	
	[_player, _item, _amount, _f_storage] call inventory_storage_add_item;
	[_player, _item, -(_amount), _p_storage] call inventory_storage_add_item;
	[_f_storage, ([_player, _f_storage] call object_getVariable)] call stats_client_save;
	
	closeDialog 0;
	call shop_play_animation;
};


interact_generic_storage = {
	ARGV(0,_player);
	ARGV(1,_storage);
	ARGV(2,_item);
	ARGV(3,_amount);
	
	if (not([_player] call player_exists)) exitWith {null};
	
	if (undefined(_storage)) exitWith {null};
	if (undefined(_item)) exitWith {null};
	if (undefined(_amount)) exitWith {null};
	if (typeName _storage != "STRING") exitWith {null};
	if (typeName _item != "STRING") exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	
	if (_amount == 0) exitWith {null};
	
	//player groupChat format["interact_generic_storage %1", _this];
	
	private["_item_kind"];
	_item_kind = _item call inventory_get_item_kind;

	private["_info", "_g_storage", "_p_storage"];
	_info = _item call inventory_get_item_array;
	_g_storage = _storage;
	_p_storage = [_player] call player_inventory_name;
	
	private["_g_max_weight", "_g_cur_weight", "_items_weight", "_p_cur_weight", "_p_max_weight", "_g_items_amount", "_p_items_amount"];
	_g_cur_weight = [_player, _g_storage] call inventory_get_storage_weight;
	_g_max_weight = -1; //factories ulimited weight
	_p_max_weight = INV_CarryingCapacity;
	_p_cur_weight = (call inventory_get_own_weight);
	_items_weight = ITEM_DATA_WEIGHT(_info) * abs(_amount);
	
	_g_items_amount = ([_player, _item, _g_storage] call inventory_get_storage_amount);
	_p_items_amount = ([_player, _item, _p_storage] call inventory_get_storage_amount);
	
	private["_valid"];
	_valid = false;
	if (_amount > 0) then {
		//adding items to the storage
		if (_amount > _p_items_amount) exitWith {
			player groupChat format["You do not have that many items in your inventory"];
		};
		
		if (_g_max_weight > 0 && ((_items_weight + _g_cur_weight) > _g_max_weight)) exitWith {
			player groupChat format["The total weight of the items exceed the storage's capacity"];
		};
		
		_valid = true;	
	}
	else {
		//removing items from the storage
		if (abs(_amount) > _g_items_amount) exitWith {
			player groupChat format["The storage does not have that many item(s)"];
		};
		
		if (_p_max_weight > 0 && (_items_weight + _p_cur_weight) > _p_max_weight) exitWith {
			player groupChat format["The total weight of the items exceed the your carrying capacity"];
		};
		_valid = true;
	};
	
	if (not(_valid)) exitWith {null};
	[_player, _item, (_amount), _g_storage] call inventory_storage_add_item;
	[_player, _item, -(_amount), _p_storage] call inventory_storage_add_item;
	[_g_storage, ([_player, _g_storage] call object_getVariable)] call stats_client_save;
	closeDialog 0;
	call shop_play_animation;
};


interact_vehicle_breakout = {
	ARGV(0,_player);
	ARGV(1,_vehicle);
	if (not([_player] call player_human)) exitWith {null};
	if (not([_vehicle] call vehicle_exists)) exitWith {null};
	
	if (_vehicle == _player) exitWith {null};
	
	breakingout = if (undefined(breakingout)) then {false} else {breakingout};
	
	if (breakingout) exitWith {
		player groupChat "You are already trying to get out";
	};
	
	if(speed _vehicle > 30) exitWith {
		player groupChat "The vehicle is moving too fast";
	};

	if (not((locked _vehicle) == 2) ||
	    ([_player] call player_armed) ||
		([_player, _vehicle] call vehicle_owner) ||
		(_vehicle isKindOf "Motorcycle") ||
		(_vehicle isKindOf "ATV_Base_EP1") 
		) exitWith {
		[_player,_vehicle, true] call player_exit_vehicle;
	};
	
	breakingout = true;
	player groupchat "Wait 10 seconds while you find a way out of this vehicle";	
	sleep 10; 
	if(speed _vehicle > 30) exitWith {
		player groupchat "The vehicle is moving too fast";
		breakingout = false;
	};
	
	if (_vehicle == _player) exitWith {
		breakingout = false;
	};
	
	[_player, _vehicle, true] call player_exit_vehicle;
	breakingout = false;
};


interact_gang_menu = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	if (not(createDialog "gang_menu")) exitWith {
		player groupChat format["ERROR: cannot create gang dialog"];	
	};

	private["_i", "_gangs_list"];
	_gangs_list = call gangs_get_list;
	_i = 0;
	while {_i < count (_gangs_list) } do {
		private["_gang"];
		_gang = _gangs_list select _i;
		private["_gang_id", "_gang_name", "_member_uids"];
		_gang_id = _gang select gang_id;
		_gang_name = _gang select gang_name;
		_gang_open = _gang select gang_open;
		_member_uids = _gang select gang_members;
		
		private["_member_names", "_open_str"];
		_member_names = [_member_uids] call gangs_uids_2_names;
		_open_str = if (_gang_open) then {"open"} else {"closed"};
		
		private["_index"];
		_index = lbAdd [202, format["%1 (%2) - Members: %3", _gang_name, _open_str, _member_names]];
		//player groupChat format["_index = %1, _gang_id = %2", _index, _gang_id];
		lbSetData[202, _index, _gang_id];
		_i = _i + 1;
	};
};

interact_gang_join = {
	//player groupChat format["interact_gang_join %1", _this];
	ARGV(0,_player);
	ARGV(1,_gang_id);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_gang_id)) exitWith {null};
	if (typeName _gang_id != "STRING") exitWith {null};
	
	if (_gang_id == "") exitWith {
		player groupChat format["%1-%2, you have not selected any gang to join", _player, (name _player)];
	};
	
	private["_gang"];
	_gang = [_gang_id] call gangs_lookup_id;
	if (undefined(_gang)) exitWith {
		player groupChat format["%1-%2, the selected gang does not exist",  _player, (name _player)];
	};
	
	private["_cgang", "_player_uid"];
	_player_uid = [_player] call gang_player_uid;
	//player groupChat format["_player_uid = %1", _player_uid];
	_cgang = [_player_uid] call gangs_lookup_player_uid;
	//player groupChat format["_cgang = %1", _cgang];
	
	if (not(undefined(_cgang))) exitWith {
		private["_cgang_name"];
		_cgang_name = _cgang select gang_name;
		player groupChat format["%1-%2, you are already in gang %3", _player, (name _player), _cgang_name];
	};

	private["_gang_name"];
	_gang_name = _gang select gang_name;
		
	private["_recruiting"];
	_recruiting = _gang select gang_open;
	
	if (not(_recruiting)) exitWith {
		player groupChat format["%1-%2, gang %3 is not recruiting at the moment", _player, (name _player), _gang_name];
	};
	
	player groupChat format["%1-%2, you have joined gang %3", _player, (name _player), _gang_name];
	format['["%1", %2] call gang_add_member;', _gang_id, _player] call broadcast;
};

interact_gang_leave = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	private["_player_uid", "_gang"];
	_player_uid = [_player] call gang_player_uid;
	_gang = [_player_uid] call gangs_lookup_player_uid;
	if (undefined(_gang)) exitWith {
		player groupChat format["%1-%2, you are not in any gang", _player, (name _player)];
	};
	
	private["_gang_id"];
	_gang_id = _gang select gang_id;
	format['["%1", "%2"] call gang_remove_member;', _gang_id, _player_uid] call broadcast;
	player groupChat format["%1-%2, you have left gang %3", _player, (name _player), (_gang select gang_name)];
};

interact_gang_manage_menu = {
	//player groupChat format["interact_gang_manage_menu %1", _this];
	ARGV(0,_player);
	ARGV(1,_gang_id);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_gang_id)) exitWith {null};
	if (typeName _gang_id != "STRING") exitWith {null};
	
	private["_gang"];
	_gang = [_gang_id] call gangs_lookup_id;
	if (undefined(_gang)) exitWith {null};
	
	private["_gang_name", "_gang_open", "_player_uid"];
	_gang_name = _gang select gang_name;
	_gang_open = _gang select gang_open;
	_player_uid = [_player] call gang_player_uid;
	
	if (not(([_gang_id] call gang_leader_uid) == _player_uid)) exitWith {
		player groupChat format["%1-%2, you are not allowed to manage gang %3, you are not the leader", _player, (name _player), _gang_name];
	};
	
	if (not(createDialog "manage_gang_menu")) exitWith {
		player groupChat format["ERROR: clould not create gang management dialog"];
	};
	
	ctrlSetText [101, format["Manage %1", _gang_name]];
	
	selected_gang_id = _gang_id;
	call interact_gang_update_open_cbox;

	private["_member_uids", "_members"];
	_member_uids = _gang select gang_members;
	_members = [_member_uids] call gangs_uids_2_players;
	
	{
		private["_member", "_member_name", "_member_uid"];
		_member = _x;
		_member_name = (name _member);
		_member_uid = [_member] call gang_player_uid;
		private["_index"];
		_index = lbAdd [102, (format ["%1 (%2)", _member_name, _member])];
		lbSetData [102, _index, str(_member)];
	} forEach _members;
	
};

gang_animation = false;
interact_play_gang_animation = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	gang_animation = true;
	player playmove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 5;
	waitUntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
	gang_animation = false;
};

interact_gang_area_neutralise = {
	ARGV(0,_player);
	ARGV(1,_gang_area);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_gang_area)) exitWith {null};
	if (typeName _gang_area != "OBJECT") exitWith {null};
	
	[_player] call interact_play_gang_animation;
	
	if ([_gang_area] call gang_flag_at_min) exitWith {null};
	[_gang_area, -0.5] call gang_flag_set_offset;
	if (not([_gang_area] call gang_flag_at_min)) exitWith {null};
	

	private["_gang", "_player_uid"];
	_player_uid = [_player] call gang_player_uid;
	_gang = [_player_uid] call gangs_lookup_player_uid;
	if (undefined(_gang)) exitWith {null};
	
	private["_gang_name"];
	_gang_name = _gang select gang_name;
	[_gang_area, ""] call gang_area_set_control;
	
	private["_message"];
	_message = format["%1 has been neutralised by %2!", _gang_area, _gang_name];
	format['hint toString(%1);', toArray(_message)] call broadcast;
};

interact_gang_area_capture = {
	ARGV(0,_player);
	ARGV(1,_gang_area);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_gang_area)) exitWith {null};
	if (typeName _gang_area != "OBJECT") exitWith {null};
	
	[_player] call interact_play_gang_animation;
		
	if ([_gang_area] call gang_flag_at_max) exitWith {null};
	[_gang_area, 0.5] call gang_flag_set_offset;
	if (not([_gang_area] call gang_flag_at_max)) exitWith {null};
	
	private["_gang", "_player_uid"];
	_player_uid = [_player] call gang_player_uid;
	_gang = [_player_uid] call gangs_lookup_player_uid;
	if (undefined(_gang)) exitWith {null};

	private["_gang_id", "_gang_name"];
	_gang_id = _gang select gang_id;
	_gang_name = _gang select gang_name;
	[_gang_area, _gang_id] call gang_area_set_control;
		
	private["_message"];
	_message = format["%1 has been captured by %2!", _gang_area, _gang_name];
	format['hint toString(%1);', toArray(_message)] call broadcast;
};

interact_gang_create_menu = {
	//player groupChat format["interact_gang_create_menu"];
	
	if (not(createDialog "gilde_gruenden")) exitWith {
		player groupChat format["ERROR: could not create gang creation dialog"];
	};
	
	private["_info"];
	_info = format["Note: Gang creation fee is $%1.", strM(gangcreatecost)] +
			format["If you leave and rejoin the game, you must rejoin the gang (there is no join fee)."] +
			format["The gang will be deleted after %1 minutes if there are no members in the gang.", round(gangdeltime/60)];
			
	ctrlSetText[5, _info];
};

interact_gang_create = {
	//player groupChat format["interact_gang_create %1", _this];
	ARGV(0,_player);
	ARGV(1,_text);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_text)) exitWith {null};
	if (typeName _text != "STRING") exitWith {null};
	
	//check that player is not in a gang
	private["_gang", "_player_uid"];
	_player_uid = [_player] call gang_player_uid;
	_gang = [_player_uid] call gangs_lookup_player_uid;
	if (not(undefined(_gang))) exitWith {
		private["_gang_name"];
		_gang_name = _gang select gang_name;
		player groupChat format["%1-%2, you are already a member of gang %3", _player, (name _player), _gang_name];
	};
	
	//check that there is no other gang with the same name
	private["_cgang"];
	_cgang = [_text] call gangs_lookup_name;
	if (not(undefined(_cgang))) exitWith {
		private["_cgang_name"];
		_cgang_name = _cgang select gang_name;
		player groupChat format["%1-%2, there is already a gang named %3", _player, (name _player), _cgang_name];
	};
	

	//check that the gang meets the naming requirements
	private["_text_length"];
	_text_length = [_text] call strlen;
	player groupChat format["_text_length = %1", _text_length];
	private["_max_length", "_min_length"];
	_max_length = 30;
	_min_length = 3;
	
	if (_text_length < _min_length) exitWith {
		player groupChat format["%1-%2, the gang name you entered is less than %3 characters long", _player, (name _player), _min_length];
	};
	if (_text_length > _max_length) exitWith {
		player groupChat format["%1-%2, the gang name you entered is more than %3 characters long", _player, (name _player), _max_length];
	};

	//check that player has enough money to create the gang
	private["_money"];
	_money = [_player, 'money'] call inventory_get_item_amount;
	if (_money < gangcreatecost) exitWith {
		player groupChat format["%1-%2, you do not have enough money to create a gang", _player, (name _player)];
	};
	
	[player, 'money', -(gangcreatecost)] call inventory_add_item;
	format['[%1, toString(%2)] call gang_create;', _player, toArray(_text)] call broadcast;
	player groupChat format["%1-%2, you have created a new gang called %3", _player, (name _player), _text];
};

interact_gang_kick = { _this spawn {
	ARGV(0,_player);
	ARGV(1,_member_variable);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_member_variable)) exitWith {null};
	if (typeName _member_variable != "STRING") exitWith {null};
	
	_member = missionNamespace getVariable [_member_variable, null];
	if (not([_member] call player_human)) exitWith {null};
	
	private["_player_uid", "_member_uid"];
	_player_uid = [_player] call gang_player_uid;
	_member_uid = [_member] call gang_player_uid;
	
	private["_gang"];
	_gang = [_player_uid] call gangs_lookup_player_uid;
	if (undefined(_gang)) exitWith {
		player groupChat format["%1-%2, you are no in a gang", _player, (name _player)];
	};
	
	private["_gang_id"];
	_gang_id = _gang select gang_id;
	if (not(([_gang_id] call gang_leader_uid) == _player_uid)) exitWith {
		player groupChat format["%1-%2, you are not the leader of this gang", _player, (name _player)];
	};
	
	if (_player_uid == _member_uid) exitWith {
		player groupChat format["%1-%2, you cannot kick yourself from the gang", _player, (name _player)];
	};
	
	private["_members"];
	_members = _gang select gang_members;
	if (not(_member_uid in _members)) exitWith {
		player groupChat format["%1-%2, %3-%4 is not a member of your gang", _player, (name _player), _member, (name _member)];
	};
	
	player groupChat format["%1-%2, you have kicked %3-%4 from your gang!", _player, (name _player), _member, (name _member)];
	
	format['["%1", "%2"] call gang_remove_member;', _gang_id, _member_uid] call broadcast;
	sleep 1;  //sleep a second to give enought time for the changes to take effect
	
	private["_message"];
	_message = format["%1-%2, you have been kicked out of your gang!", _member, (name _member)];
	format['if (player == %1) then {player groupChat toString(%2);};', _member, toArray(_message)] call broadcast;
};};

interact_gang_make_leader = { _this spawn {
	ARGV(0,_player);
	ARGV(1,_member_variable);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_member_variable)) exitWith {null};
	if (typeName _member_variable != "STRING") exitWith {null};
	
	_member = missionNamespace getVariable [_member_variable, null];
	if (not([_member] call player_human)) exitWith {null};
	
	private["_player_uid", "_member_uid"];
	_player_uid = [_player] call gang_player_uid;
	_member_uid = [_member] call gang_player_uid;
	
	private["_gang"];
	_gang = [_player_uid] call gangs_lookup_player_uid;
	if (undefined(_gang)) exitWith {
		player groupChat format["%1-%2, you are no in a gang", _player, (name _player)];
	};
	
	private["_gang_id"];
	_gang_id = _gang select gang_id;
	if (not(([_gang_id] call gang_leader_uid) == _player_uid)) exitWith {
		player groupChat format["%1-%2, you are not the leader of this gang", _player, (name _player)];
	};
	
	if (_player_uid == _member_uid) exitWith {
		player groupChat format["%1-%2, you are already the leader of this gang", _player, (name _player)];
	};
	
	private["_members"];
	_members = _gang select gang_members;
	if (not(_member_uid in _members)) exitWith {
		player groupChat format["%1-%2, %3-%4 is not a member of your gang", _player, (name _player), _member, (name _member)];
	};
	
	player groupChat format["%1-%2, you have made %3-%4 the leader of your gang!", _player, (name _player), _member, (name _member)];
	
	format['["%1", "%2"] call gang_make_leader;', _gang_id, _member_uid] call broadcast;
	sleep 1;  //sleep a second to give enought time for the changes to take effect
	
	private["_message"];
	_message = format["%1-%2, you have been made the leader of your gang!", _member, (name _member)];
	format['if (player == %1) then { player groupChat toString(%2);};', _member, toArray(_message)] call broadcast;
};};



interact_gang_update_open_cbox = {
	private["_gang"];
	_gang = [selected_gang_id] call gangs_lookup_id;
	if (undefined(_gang)) exitWith {null};
	
	private["_open"];
	_open = _gang select gang_open;
	
	private["_text"];
	_text = if (_open) then { format["[x] Gang open"] } else {format["[ ] Gang open"]};
	ctrlSetText [202, _text];
};

interact_gang_toggle_open = {
	//player groupChat format["interact_gang_toggle_open %1", _this];
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	private["_player_uid", "_gang"];
	_player_uid = [_player] call gang_player_uid;
	_gang = [_player_uid] call gangs_lookup_player_uid;
	
	private["_gang_id"];
	_gang_id = _gang select gang_id;
	if (not(([_gang_id] call gang_leader_uid) == _player_uid)) exitWith {
		player groupChat format["%1-%2, you are not the leader of this gang", _player, (name _player)];
	};
	
	private["_open"];
	_open = _gang select gang_open;
	_open = not(_open);
	_gang set [gang_open, _open];
	[_gang] call gangs_update_list;
	
	if (not(_open)) then {
		player groupChat format["%1-%2, you have closed your gang", _player, (name _player)];
	}
	else {
		player groupChat format["%1-%2, you have opened your gang", _player, (name _player)];
	};
};

interact_gang_open = {
	//player groupChat format["interact_gang_open %1", _this];
	ARGV(0,_player);
	ARGV(1,_open);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_open)) exitWith {null};
	if (typeName _open != "BOOL") exitWith {null};
	
	private["_player_uid", "_gang"];
	_player_uid = [_player] call gang_player_uid;
	_gang = [_player_uid] call gangs_lookup_player_uid;

	private["_gang_id"];
	_gang_id = _gang select gang_id;
	if (not(([_gang_id] call gang_leader_uid) == _player_uid)) exitWith {
		player groupChat format["%1-%2, you are not the leader of this gang", _player, (name _player)];
	};
	
	_gang set [gang_open, _open];
	[_gang] call gangs_update_list;
	
	if (not(_open)) then {
		player groupChat format["%1-%2, you have closed your gang", _player, (name _player)];
	}
	else {
		player groupChat format["%1-%2, you have opened your gang", _player, (name _player)];
	};
};

interact_item_process = {
	//player groupChat format["interact_item_process %1", _this];
	ARGV(0,_player);
	ARGV(1,_input_item);
	ARGV(2,_output_item);
	ARGV(3,_input_amount_required);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_input_item)) exitWith {null};
	if (undefined(_output_item)) exitWith {null};
	if (undefined(_input_amount_required)) exitWith {null};
	if (typeName _input_item != "STRING") exitWith {null};
	if (typeName _output_item != "STRING") exitWith {null};
	if (typeName _input_amount_required != "SCALAR") exitWith {null};
	if (_input_amount_required <= 0) exitWith {null};
	
	private["_input_item_name", "_output_item_name"];
	_input_item_name = (MASTER_ARRAY_ITEM_NAME(_input_item));
	_output_item_name = (MASTER_ARRAY_ITEM_NAME(_output_item));
	
	if ([_player] call player_cop) exitWith {
		player groupChat format["%1-%2, only civilians are allowed to process %3", _player, (name _player), _input_item_name];
	};
	
	private["_input_amount"];
	_input_amount = [_player, _input_item] call inventory_get_item_amount;
	
	if (_input_amount < _input_amount_required) exitWith {
		player groupChat format["%1-%2, you require at least %3 %4 to produce %5 %6", _player, (name _player), _input_amount_required, _input_item_name, 1, _output_item_name];
	};

	private["_output_amount"];
	_output_amount = floor(_input_amount/_input_amount_required);
	
	private["_input_amount_used"];
	_input_amount_used = round(_input_amount_required * _output_amount);
	
	[_player, _input_item, -(_input_amount_used)] call inventory_add_item;
	[_player, _output_item, _output_amount, ([_player] call player_inventory_name)] call INV_CreateItem;

	player groupChat format["%1-%2, you porcessed %3 %4 into %5 %6", _player, (name _player), _input_amount_used, _input_item_name, _output_amount, _output_item_name];
};

interact_admin_menu = {
	ARGV(0,_player);
	[_player] call admin_menu_create;
};

interact_admin_menu_selected_action = {
	(lbData[admin_menu_command_field_idc, lbCurSel admin_menu_command_field_idc])
};

interact_admin_menu_input_text = {
	(ctrlText admin_menu_input_field_idc)
};

interact_admin_menu_selected_player = {
	(missionNamespace getVariable [(lbData [admin_menu_player_field_idc, lbCurSel admin_menu_player_field_idc]), null])
};

interact_play_pickup_animation = {
	private["_animation"];
	
	if ([player] call object_in_water) exitWith {};
	sleep 1;
	_animation = if((primaryWeapon player) == "" && (secondaryWeapon player) == "") then{ "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"} else { "AinvPknlMstpSlayWrflDnon"};
	//player playMove _animation;
	//format['%1 playMove "%2;"', player, _animation] call broadcast;
	player playMoveNow _animation;
	sleep 1;
};


interact_object_put_active = false;
interact_object_put = { _this spawn {
	//player groupChat format["interact_object_put %1", _this];
	
	[] call interact_play_pickup_animation;
	
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_object);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_object)) exitWith {null};
	if (typeName _object != "OBJECT") exitWith {null};
	
	if (interact_object_put_active) exitWith {
		player groupChat format["WARNING: interact_object_put already active"];
	};
	interact_object_put_active = true;
	
	private["_item", "_amount", "_data"];
	_item = [_object, "item"] call object_getVariable;
	_amount = [_object, "amount"] call object_getVariable;
	_amount = [_amount] call decode_number;
	_data = [_object, "data", null] call object_getVariable;
	
	private["_remaining"];
	_remaining = [_player, _item, _amount, _data] call interact_item_put_inventory;
	
	if (undefined(_remaining)) exitWith {
		interact_object_put_active = false;
	};
	
	if (_remaining <= 0) exitWith {
		detach _object;
		deleteVehicle _object;
		interact_object_put_active = false;
	};
	
	_remaining = [_remaining] call encode_number;
	[_object, "amount", _remaining, true] call object_setVariable;
	interact_object_put_active = false;
};};

player_inventory_space = {
	//player groupChat format["player_inventory_space %1", _this];
	ARGV(0,_player);
	ARGV(1,_item);
	ARGV(2,_amount);
	
	if (not([_player] call player_human)) exitWith {0};
	if (undefined(_item)) exitWith {0};
	if (undefined(_amount)) exitWith {0};
	if (typeName _item != "STRING") exitWith {0};
	if (typeName _amount != "SCALAR") exitWith {0};
	
	if (_amount <= 0) then {0};
	
	
	private["_item_info","_item_weight", "_player_weight", "_item_total_weight", "_available_weight"];
	_item_info = _item call inventory_get_item_array;
	_item_weight = ITEM_DATA_WEIGHT(_item_info);
	_player_weight = [_player] call inventory_get_player_weight;
	_item_total_weight = _item_weight * _amount;
	_available_weight = INV_CarryingCapacity - _player_weight;

	private["_pickup_amount"];
	_pickup_amount = _amount;
	
	if ((_available_weight < _item_total_weight) && _item_weight > 0) then {
		_pickup_amount = floor(_available_weight / _item_weight);
	};
	
	//player groupChat format["_amount = %1, _pickup_amount = %2", _amount, _pickup_amount];
	(_pickup_amount)
};


interact_item_put_active = false;
interact_item_put_inventory = {
	//player groupChat format["interact_item_put_inventory %1", _this];
	ARGV(0,_player);
	ARGV(1,_item);
	ARGV(2,_amount);
	ARGV(3,_data);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_item))exitWith {null};
	if (undefined(_amount)) exitWith {null};
	
	if (typeName _item != "STRING") exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	
	if (_amount <= 0) exitWith {null};
	
	if (interact_item_put_active) exitWith {
		player groupChat format["WARNING: interact_item_put_inventory already active"];
	};
	interact_item_put_active = true;
	
	private["_pickup_amount"];
	_pickup_amount = [_player, _item, _amount] call player_inventory_space;
	
	if (_pickup_amount <= 0) exitWith {
		interact_item_put_active = false;
		player groupChat "Max weight reached, you cannot take any more items";
		null
	};

	private["_item_name"];
	_item_name = (MASTER_ARRAY_ITEM_NAME(_item));
	
	if (_item == "keychain") then {
		if (isNil "_data" || {typeName _data != "ARRAY"}) exitWith {};
		private["_vehicle_name"];
		_vehicle_name = _data select 0;
		[_player, _vehicle_name] call vehicle_add_name;
		player groupChat format["You put the key for %1 in your inventory ", _vehicle_name];
	}
	else {
		[_player, _item, _pickup_amount, ([player] call player_inventory_name)] call INV_CreateItem;
		player groupchat format["You put %1 %2(s) in your inventory", strM(_pickup_amount), _item_name];
	};

	interact_item_put_active = false;
	(_amount - _pickup_amount)
};






interact_item_take_inventory = { _this spawn {
	//player groupChat format["interact_item_take_inventory %1", _this];
	ARGV(0,_player);
	ARGV(1,_item);
	ARGV(2,_amount);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_item)) exitWith {null};
	if (undefined(_amount)) exitWith {null};
	if (typeName _item != "STRING") exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	
	if (_amount <= 0) exitWith {null};
	
	
	private["_inside_vehicle"];
	_inside_vehicle = ((vehicle player) != player);
	if (_inside_vehicle) exitWith {
		player groupChat format["You cannot take items while inside a vehicle"];
	};
	

	if (([_player] call drag_object_active)) exitWith {
		player groupChat format["You already have another item in your hands"];
	};
	
	//[] call interact_play_pickup_animation;
	
	if (_amount > ([_player, _item] call inventory_get_item_amount)) exitWith {
		player groupChat format["You do not have that many items to take"];
	};
	
	if (not([_player] call interact_inventory_actions_allowed)) then {
		player groupChat "You cannot take from your inventory now.";
	};
	
	if (not(_item call inventory_get_item_droppable)) exitWith {
		player groupChat format["You are not allowed to take this item."];
	};
	
	if (_item == "keychain") then {
		//special processing for keys
		private["_vehicles_name_list"];
		_vehicles_name_list = [_player] call vehicle_list;
				
		private["_vehicle_name"];
		_vehicle_name = [_vehicles_name_list] call interact_select_vehicle_wait;
		if (undefined(_vehicle_name)) exitWith {null};
		
		[_player, _vehicle_name] call vehicle_remove_name;
		private["_object"];
		_object = [_player, _item, 1, [_vehicle_name]] call player_drop_item;
		if (undefined(_object)) exitWith {};
		[_player, _object] spawn drag_take_object;
		player groupChat format["You took the key for %1", _vehicle_name];
		
	}
	else {
		//regular processing for other items
		[_player, _item, -(_amount)] call inventory_add_item;
		
		private["_object"];
		_object = [_player, _item, _amount] call player_drop_item;
		if (undefined(_object)) exitWith {};
		[_player, _object] spawn drag_take_object;
		player groupChat format["You took %1 %2(s)", strM(_amount), (MASTER_ARRAY_ITEM_NAME(_item))];
	};
};};





interact_item_use_inventory = {
	//player groupChat format["interact_item_use_inventory %1", _this];
	ARGV(0,_player);
	ARGV(1,_item);
	ARGV(2,_amount);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_item)) exitWith {null};
	if (undefined(_amount)) exitWith {null};
	if (typeName _item != "STRING") exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	if (_amount <= 0) exitWith {null};
	
	if (_amount > ([_player, _item] call inventory_get_item_amount)) exitWith {
		player groupChat format["You do not have that many items to use"];
	};
	
	if (not([_player] call interact_inventory_actions_allowed)) then {
		player groupChat "You cannot use your inventory now";
	};
	
	private["_script"];
	_script = _item call inventory_get_item_file;
	_script = if (undefined(_script)) then {""} else { _script };
	_script = if (typeName _script != "STRING") then { "" } else {_script};
	
	if (_script == "") exitWith {
		player groupChat "You cannot use this item";
	};
	
	//legacy, check if the the use action is tied to a script
	if ([".sqf", _script] call BIS_fnc_inString) exitWith {
		["use", _item, _amount, []] execVM _script;
	};
	
	private["_function"];
	_function = missionNamespace getVariable [_script, {}];
	[_player, _item, _amount] call _function;
};

interact_inventory_actions_allowed = {
	ARGV(0,_player);
	(not([_player] call player_vulnerable))
};

interact_item_give = { _this spawn {
	//player groupChat format["interact_item_give %1", _this];
	ARGV(0,_player);
	ARGV(1,_item);
	ARGV(2,_amount);
	ARGV(3,_target);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_item)) exitWith {null};
	if (undefined(_amount)) exitWith {null};
	if (typeName _item != "STRING") exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	if (_amount <= 0) exitWith {null};
	
	if (not(_item == "keychain")) then {
		[] call interact_play_pickup_animation;
	};

	if (_amount > ([_player, _item] call inventory_get_item_amount)) exitWith {
		player groupChat format["You do not have that many items to give"];
	};
	
	private["_space_available"];
	_space_available = [_target, _item, _amount] call player_inventory_space;
	if (_space_available <= 0) exitWith {
		player groupChat format["The target player does not have enough inventory space to receive the items"];
	};
	
	if (_amount > _space_available) then {
		_amount = _space_available;
	};
	
	if (not([_player] call interact_inventory_actions_allowed)) then {
		player groupChat "You cannot use your inventory now";
	};
	
	if (not(_item call iventory_get_item_giveable)) exitWith {
		player groupChat format["You are not allowed to give this type of item to other players"];
	};
	
	if (_player == _target) exitWith {
		player groupChat format["You cannot give an item to yourself"];
	};
	
	private["_item_name"];
	_item_name = (MASTER_ARRAY_ITEM_NAME(_item));

	private["_near_players", "_minimum_distance"];
	_minimum_distance = 20;
	_near_players = nearestObjects [getPos _player, ["LandVehicle", "Air", "Man"], _minimum_distance];

	if (not(_target in _near_players) and (_player distance _target > _minimum_distance)) exitWith {
		player groupChat format["You have to be within at least %1 meters from the selected player", _minimum_distance];
	};
	
	if (_item == "keychain") then {
		//special processing for keys
		private["_vehicles_name_list"];
		_vehicles_name_list = [_player] call vehicle_list;
		
		private["_vehicle_name"];
		_vehicle_name = [_vehicles_name_list] call interact_select_vehicle_wait;
		if (undefined(_vehicles_name_list)) exitWith {null};
		
		private["_vehicle"];
		_vehicle = missionNamespace getVariable [_vehicle_name, null];
		if (undefined(_vehicle)) exitWith {
			player groupChat format["%1-%2, you cannot give keys to a vehicle that does not exist", (_player), (name _player), _vehicle_name];
		};
		
		player groupChat format["You gave %1-%2 a copy of the key for %3", _target, (name _target), _vehicle];
		format["[%1, %2, %3] call interact_keychain_give_receive;", _player, _target, _vehicle] call broadcast;
	}
	else {
		//generic processing for all other items
		[_player, _item, -(_amount)] call inventory_add_item;
		player groupChat format["You gave %1-%2 %3 units of %4", _target, (name _target), strN(_amount), _item_name];
		format["[%1, %2, ""%3"", %4] call interact_item_give_receive;", _player, _target, _item, strN(_amount)] call broadcast;
	};
};};

interact_keychain_give_receive = {_this spawn {
	//player groupChat format["interact_keychain_give_receive %1", _this];
	ARGV(0,_player);
	ARGV(1,_target);
	ARGV(2,_vehicle);

	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	if (not([_vehicle] call vehicle_exists)) exitWith {null};
	
	if (_target != player) exitWith {null};
	
	[_target, _vehicle] call vehicle_add;
	player groupChat format["%1-%2, you received the key for %3 from %4-%5", _target, (name _target), _vehicle, _player, (name _player)];
};};

interact_item_give_receive = { _this spawn {
	//player groupChat format["interact_item_give_receive %1", _this];
	ARGV(0,_player);
	ARGV(1,_target);
	ARGV(2,_item);
	ARGV(3,_amount);
	
	if (not([_player] call player_human)) exitWith {null};
	if (not([_target] call player_human)) exitWith {null};
	if (_target != player) exitWith {null};
	if (undefined(_item)) exitWith {null};
	if (undefined(_amount)) exitWith {null};
	if (typeName _item != "STRING") exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	if (_amount < 0) exitWith {null};
	
	[] call interact_play_pickup_animation;
	
	private["_item_name"];
	_item_name = (MASTER_ARRAY_ITEM_NAME(_item));
	
	[_target, _item, (_amount)] call inventory_add_item;
	player groupChat format["%1-%2 gave you %3 units of %4", (_player), (name _player), strN(_amount), _item_name];
};};

interact_select_vehicle = {
	ARGV(0,_vehicle_name);
	if (undefined(_vehicle_name)) exitWith {null};
	if (typeName _vehicle_name != "STRING") exitWith {null};
	
	interact_selected_vehicle = _vehicle_name;
	closeDialog 0;
	_vehicle_name
};

interact_select_vehicle_wait = {
	//player groupChat format["interact_select_vehicle_wait %1", _this];
	disableSerialization;
	ARGV(0,_vehicle_names_list);
	
	private["_dialog"];

	if (undefined(_vehicle_names_list)) exitWith {null};
	if (typeName _vehicle_names_list != "ARRAY") exitWith {null};
	
	private["_controls", "_list", "_submit"];
	_controls = [toUpper("Owned Vehicles"), 0.14, 0.14, 0.55, 0.45] call list_simple_menu_setup;
	_list = _controls select list_simple_menu_list;
	_submit = _controls select list_simple_menu_submit;
	
	_submit ctrlSetText "Select";
	
	buttonSetAction [(ctrlIDC _submit), '[([] call list_simple_menu_label_data)] call interact_select_vehicle;'];

	_submit ctrlCommit 0;
	
	private["_i"];
	_i = 0;
	interact_selected_vehicle = null;
	while { _i < count(_vehicle_names_list) } do {
		private["_index", "_vehicle_name"];
		_vehicle_name = _vehicle_names_list select _i;
		private["_vehicle", "_info"];
		_vehicle = missionNamespace getVariable [_vehicle_name, null];
		
		private["_name", "_picture"];
		
		_picture= "";
		if ([_vehicle] call vehicle_exists) then {
			private["_class"];
			_class = typeOf _vehicle;
			_name = getText(configFile >> "CfgVehicles" >> _class >> "displayName");
			_picture = [_class] call generic_picture_path;	
			_info = format["(%1)",_name];
		}
		else { if (["impound_lot", _vehicle_name] call vehicle_storage_contains) then {
			private["_impund_data", "_class"];
			_impound_data = ["impound_lot", _vehicle_name] call vehicle_storage_get;
			_class = _impound_data select vehicle_storage_data_entry_class;
			_name = getText(configFile >> "CfgVehicles" >> _class >> "displayName");
			_picture = [_class] call generic_picture_path;
			_info = format["(%1 - impounded)", _name];
		}
		else {
			_info = "(destroyed)";
		};};
		
		_index = _list lbAdd format["%1 %2", _vehicle_name, _info];
		_list lbSetData [_index, _vehicle_name];
		_list lbSetPicture [_index, _picture];
		_i = _i + 1;
	};
	
	_list lbSetCurSel 0;
	waitUntil {not(ctrlShown _list)};
	
	private["_vehicle_name"];
	_vehicle_name = interact_selected_vehicle;
	interact_selected_vehicle = null;
	_vehicle_name
};

interact_keychain_drop = {
	//player groupChat format["interact_keychain_drop %1", _this];
	ARGV(0,_player);
	ARGV(1,_vehicle);
	if (not([_player] call player_human)) exitWith {null};
	if (not([_vehicle] call vehicle_exists)) exitWith {null};
	
    [_player, _vehicle] call vehicle_remove;
    player groupChat format["You dropped the key for %1", _vehicle];
};

interact_buy_insurance = {
	ARGV(0,_player);
	([_player, "bankinsurance"] call interact_buy_item)
};

interact_buy_item_active = false;
interact_buy_item = {
	ARGV(0,_player);
	ARGV(1,_item);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_item)) exitWith {null};
	if (typeName _item != "STRING") exitWith {null};
	
	if (interact_buy_item_active) exitWith {
		player groupChat format["ERROR: You are already buying an item"];
	};
	interact_buy_item_active = true;
	
	private["_player_money", "_item_cost", "_item_name", "_infos"];
	_infos = _item call inventory_get_item_array;
	_item_cost = _infos call inventory_get_item_buy_cost;
	_item_name = (MASTER_ARRAY_ITEM_NAME(_infos));
	_player_money = [_player, "money"] call inventory_get_item_amount;
	
	if (_player_money < _item_cost) exitWith {
		player groupChat format["%1-%2, you do not have enough money to buy %3", (_player), (name _player), _item_name];
		interact_buy_item_active = false;
	}; 
	
	private["_space_available"];
	_space_available = [_player, _item, 1] call player_inventory_space;
	if (_space_available <= 0) exitWith {
		player groupChat format["%1-%2, you do not have enough space in your inventory for %3",  (_player), (name _player), (_item_name)];
		interact_buy_item_active = false;
	}; 

	[_player, "money", -(_item_cost)] call inventory_add_item;
	[_player, _item, 1] call inventory_add_item;
	player groupChat format["%1-%2, you bought one %3 for $%4", (_player), (name _player), _item_name, _item_cost];
	sleep 3;
	
	interact_buy_item_active = false
};

interact_teleport_player = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	openMap true; 
	onMapSingleClick format["%1 setPos _pos; %1 setVelocity [0,0,0]; openMap false; onMapSingleClick """"; true", (vehicle _player)];
};


animation_script_name = 0;
animation_display_name = 1;
animation_type = 2;
animation_hands_state = 3;

animation_hands_with_weapon = 0;
animation_hands_with_no_weapon = 1;
animation_hans_any = 2;

animation_list = [
	["", "Return to normal", "switchMove", animation_hans_any],
	["DeadState", "Play dead (face down)", "switchMove", animation_hans_any],
	["UnaErcPoslechVelitele4", "Hands Behind Back", "switchMove", animation_hans_any],
	["AmovPercMstpSnonWnonDnon_Salute", "Salute (no weapon)", "switchMove", animation_hans_any],
	["InBaseMoves_table1", "Lean on Table", "switchMove", animation_hans_any],
	["KIA_gunner_standup01", "Play dead (on side)", "switchMove", animation_hans_any],
	["KIA_passenger_flatground", "Relaxed Prayer", "switchMove", animation_hans_any],
	["InBaseMoves_SittingRifle2", "Sit on chair", "switchMove", animation_hans_any],
	["passenger_flatground_crosslegs", "Sit Cross Legs", "switchMove", animation_hans_any]
];


interact_animations_menu = {
	ARGV(0,_player);
	
	if (not([_player] call player_human)) exitWith {null};
	
	private["_list"];
	
	_list = [] call animations_menu_setup;

	{
		private["_animation", "_name"];
		_animation = _x;
		_name = _animation select animation_display_name;
		_list lbAdd _name;
	} forEach animation_list;

	buttonSetAction [animations_menu_select_button_idc, '[(lbCurSel animations_menu_list_idc)] call interact_animation_play; closedialog 0;'];
	buttonSetAction [animations_menu_close_button_idc, 'closedialog 0;'];
};

interact_animation_play = {
	player groupChat format["interact_animation_play %1", _this];
	ARGV(0,_index);
	if (undefined(_index)) exitWith {null};
	if (typeName _index != "SCALAR") exitWith {null};
	if (_index < 0) exitWith {null};
	

	if ((vehicle player) != player) exitWith {
		player groupChat format["You must be on foot to peform this animation"];
	};
	
	if (_index >= count(animation_list)) exitWith {
		player groupChat format["ERROR: Animation index out of bounds"];
	};
	
	private["_animation"];
	_animation = animation_list select _index;
	
	if (undefined(_animation)) exitWith {null};
	if (typeName _animation != "ARRAY") exitWith {null};
	
	private["_animation_script_name", "_animation_type"];
	
	_animation_script_name = _animation select animation_script_name;
	_animation_type = _animation select animation_type;
	
	format["%1 %2 ""%3"";", player, _animation_type, _animation_script_name] call broadcast;
};



interact_main_menu = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	if (not(createDialog "WeaponModifications")) exitWith {
		player groupChat format["ERROR: cannot create weapon modifications menu"];	
	};
	
	private["_camera"];
	_camera = [_player] call player_camera_create;
	
	private["_target", "_origin"];
	_target = _player;
	_origin = _player selectionPosition "righthand";
	_relative = _origin;
	_relative = [(_origin select 0) - 1, (_origin select 1) + 1, (_origin select 2) + 0.5];
    
	private["_heading", "_vectors"];
	_heading = [145,-20,0];
	_vectors = [_heading] call camera_heading2vectors;
	_camera attachTo [_target, _relative];
	_camera setVectorDirAndUp _vectors;

	[player] call weapon_modifications_dialog_setup;
};

interact_weapon_modifications_menu = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	if (not(createDialog "WeaponModifications")) exitWith {
		player groupChat format["ERROR: cannot create weapon modifications menu"];	
	};
	
	private["_camera"];
	_camera = [_player] call player_camera_create;
	
	private["_target", "_origin"];
	_target = _player;
	_origin = _player selectionPosition "righthand";
	_relative = _origin;
	_relative = [(_origin select 0) - 1, (_origin select 1) + 1, (_origin select 2) + 0.5];
    
	private["_heading", "_vectors"];
	_heading = [145,-20,0];
	_vectors = [_heading] call camera_heading2vectors;
	_camera attachTo [_target, _relative];
	_camera setVectorDirAndUp _vectors;

	[player] call weapon_modifications_dialog_setup;
};

interact_weapon_modifications_menu_close = {
	private["_player"];
	_player = player;
	[_player] call player_camera_destroy;
};




vehicle_item_speed_upgrade = { _this spawn {
	player groupChat format["interact_vehicle_speed_upgrade %1", _this];
	ARGV(0,_player);
	ARGV(1,_item);
	ARGV(2,_amount);
	
	if (not([_player] call player_human)) exitWith {};
	if (undefined(_item)) exitWith {};
	if (typeName _item != "STRING") exitWith {};
	if (undefined(_amount)) exitWith {};
	if (_amount <= 0) exitWith {};
	
	private["_vehicle"];
	_vehicle = (vehicle _player);
	
	if (_player == _vehicle) exitWith {
		player groupChat format["You must the inside a vehicle"];
	};
	
	if(not(_vehicle isKindOf "car"))exitWith {
		player groupChat "You cannot tune this vehicle."
	};

	[_player, _item, -1] call inventory_add_item;

	private["_level"];
	_level = 0;
	_level = if (_item == "supgrade1") then {0.12} else {_level};
	_level = if (_item == "supgrade2") then {0.14} else {_level};
	_level = if (_item == "supgrade3") then {0.16} else {_level};
	_level = if (_item == "supgrade4") then {0.18} else {_level};
	_level = if (_item == "supgrade5") then {0.20} else {_level};

	if (_level <= 0) exitWith {};

	player groupchat "Tuning vehicle ..."; 
	_vehicle setfuel 0; 
	sleep (5 + _level); 
	_vehicle setfuel 1; 
	
	[_vehicle, "tuning", _level, true] call object_setVariable; 
	player groupchat "Vehicle tuned!";
	
};};

vehicle_item_speed_gun_upgrade = { _this spawn {
	player groupChat format["vehicle_item_speed_gun_upgrade %1", _this];
	ARGV(0,_player);
	ARGV(1,_item);
	ARGV(2,_amount);
	
	if (not([_player] call player_human)) exitWith {};
	if (undefined(_item)) exitWith {};
	if (typeName _item != "STRING") exitWith {};
	if (undefined(_amount)) exitWith {};
	if (_amount <= 0) exitWith {};
	
	private["_vehicle"];
	_vehicle = (vehicle _player);
	
	if (_player == _vehicle) exitWith {
		player groupChat format["You must the inside a vehicle"];
	};
	
	if(not(_vehicle isKindOf "LandVehicle"))exitWith {
		player groupChat "You cannot install a speed gun on this vehicle."
	};

	[_player, _item, -1] call inventory_add_item;

	player groupchat "Installing speed gun on vehicle ..."; 
	sleep 5; 
	[_vehicle, "speedgun", true, true] call object_setVariable; 
	player groupchat "Installation complete. Use Control + G to activate the speed gun!";
};};

interact_admin_list_menu = {_this spawn {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	if (not(createDialog "ListMenu")) exitWith {
		player groupChat format["ERROR: cannot create admin list menu"];	
	};
	
	[_player, "admin_list"] call list_menu_setup;
};};

interact_pmc_whitelist_menu = {_this spawn {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	if (not(createDialog "ListMenu")) exitWith {
		player groupChat format["ERROR: cannot create PMC Whitelist menu"];	
	};
	
	private["_list_name"];
	_list_name = "pmc_whitelist";
	
	if (not([_list_name] call list_exists)) then {
		//create the PMC White-List
		[_list_name, "PMC Whitelist"] call list_create;
	};
	
	[_player, _list_name] call list_menu_setup;
};};

interact_cop_blacklist_menu = {_this spawn {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	if (not(createDialog "ListMenu")) exitWith {
		player groupChat format["ERROR: cannot create Cop Blacklist menu"];	
	};
	
	private["_list_name"];
	_list_name = "cop_blacklist";
	
	if (not([_list_name] call list_exists)) then {
		//create the PMC White-List
		[_list_name, "Cop Blacklist"] call list_create;
	};
	
	[_player, _list_name] call list_menu_setup;
};};

interact_kick_to_lobby = {
	//player groupChat format["interact_kick_to_lobby %1", _this];
	ARGV(0,_target);
	if (not([_target] call player_human)) exitWith {null};
	if (player != _target) exitWith {null};
	endMission "LOSER";
};

interact_impound_vehicle_menu = {
	disableSerialization;
	//player groupChat format["interact_impound_vehicle_menu %1", _this];
	ARGV(0,_player);
	ARGV(1,_logic);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_logic)) exitWith {null};
	
	
	private["_impound_lot_data"];
	_impound_lot_data = ["impound_lot"] call vehicle_storage_data;
	if (undefined(_impound_lot_data)) exitWith {
		player groupChat format["ERROR: The impound lot has not been initialized"];
	};
	
	private["_vehicles_name_list"];
	_vehicles_name_list = [_player, "vehicles_name_list"] call player_get_array;
	
	private["_impounded_vehicles_name_list", "_impounded_vehicles_data"];
	_impounded_vehicles_name_list = _impound_lot_data select vehicle_storage_data_keys;
	_impounded_vehicles_entry_list = _impound_lot_data select vehicle_storage_data_entries;
	
	private["_controls", "_list"];
	_controls = [toUpper("Impount Lot"), 0.14, 0.14, 0.55, 0.45] call list_simple_menu_setup;
	_list = _controls select list_simple_menu_list;
	_select = _controls select list_simple_menu_submit;
	
	
	_select ctrlSetText "Retrieve";
	_select ctrlCommit 0;
	
	buttonSetAction[(ctrlIDC _select), '[' + str(_player) + ',' + str(_logic) + ', ([] call list_simple_menu_label_data)] spawn interact_impound_vehicle_retrieve;'];
	
	lbClear (ctrlIDC _list);

	{if (true) then {
		private["_vehicle_name"];
		_vehicle_name = _x;
		private["_index"];
		_index = _impounded_vehicles_name_list find _vehicle_name;
		if (_index < 0) exitWith {null};
		
		private["_vehicle_entry"];
		_vehicle_entry = _impounded_vehicles_entry_list select _index;
		
		private["_vehicle_class", "_picture"];
		_vehicle_class = _vehicle_entry select vehicle_storage_data_entry_class;
		_picture = [_vehicle_class] call generic_picture_path;
		_index = _list lbAdd format["%1 (%2)", _vehicle_name, _vehicle_class];
		_list lbSetData [_index, format["%1", _vehicle_name]];
		_list lbSetPicture[_index, _picture];
	};} forEach _vehicles_name_list;
};


interact_impound_vehicle_retrieve = {
	//player groupChat format["interact_impound_vehicle_retrieve %1", _this];
	ARGV(0,_player);
	ARGV(1,_logic);
	ARGV(2,_vehicle_name);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_logic)) exitWith {null};
	if (undefined(_vehicle_name)) exitWith {null};
	if (typeName _vehicle_name != "STRING") exitWith {null};
	
	//check that the impound spawn is clear
	if(count (nearestobjects [getpos _logic, ["Ship","car","motorcycle","truck"], 3]) > 0) exitWith {
		player groupChat format["WARNING: Unable to retrieve vehicle, there is a vehicle blocking the spawn"];
	};
	

	//make sure player has needed money
	private["_money", "_cost"];
	_cost = impoundpay;
	_money = [_player, "money"] call inventory_get_item_amount;

	if(_money < _cost) exitWith {
		player groupChat format["%1-%2, you do not have enough money to retrieve the vehicle", _player, (name _player)];
	};
	
	player groupChat format["Please wait while your vehicle is retrieved ..."];
	
	//do the transaction
	[player, "money", -(_cost)] call inventory_add_item;
	
	//actually retrieve the vehicle
	private["_storage"];
	_storage = "impound_lot";
	
	if (not([_storage, _vehicle_name] call vehicle_storage_contains)) exitWith {
		player groupChat format["ERROR: The vehicle '%1' was not found in the impound lot", _vehicle_name];
	};
	
	private["_vehicle_entry"];
	_vehicle_entry = [_storage, _vehicle_name] call vehicle_storage_get;
	if (undefined(_vehicle_entry)) exitWith {
		player groupChat format["ERROR: THe vehicle '%1' could not be retrived form the impound lot", _vehicle_name];
	};
	
	private["_vehicle_class"];
	_vehicle_class = _vehicle_entry select vehicle_storage_data_entry_class;
	
	private["_vehicle"];
	_vehicle = [_vehicle_name, _vehicle_class] call vehicle_recreate;
	[_storage, _vehicle_name] call vehicle_storage_remove;
	
	_vehicle enableSimulation false;
	_vehicle setPos getPos _logic;
	_vehicle setDir getDir _logic;
	_vehicle enableSimulation true;
	
	[_vehicle] call vehicle_unload_stats; //no need to keep the vehicle stats in memory anymore
	player groupchat format["You paid the $%1 fine and retrieved your vehicle!", _cost];
};



interact_impound_vehicle_seize = {
	player groupChat format["interact_impound_vehicle_seize %1", _this];
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_vehicle);

	if (not([_player, _vehicle] call vehicle_seize_available)) exitWith {};
	
	
	private["_storage"];
	_storage = "impound_lot";
	
	if ((count crew _vehicle) > 0) exitWith {
		player groupChat format["%1-%2, you cannot impound this vehicle. It's not empty", _player, (name _player)];
	};

	[_storage, _player, _vehicle] call vehicle_storage_put;

	
	[_vehicle] call vehicle_save_stats;	
	[[_vehicle], "vehicle_unload_stats", false] call BIS_fnc_MP; //no need to keep the vehicle stats in memory anymore
	
	deleteVehicle _vehicle;
	player groupChat format["%1-%2, you have impounded this vehicle", _player, (name _player)];
	
	private["_message"];
	_message = format["%1-%2 has impounded vehicle (%3)", _player, (name _player), str(_vehicle)];
	[[_message], "interact_hint", true, false] call BIS_fnc_MP;
};

interact_item_refuel = { _this spawn {
	ARGV(0,_player);
	ARGV(1,_item);
	ARGV(2,_amount);

    if (_player == (vehicle _player))  exitWith {
		player groupChat format["%1-%2, you cannot use the refuel can now. You are not in a vehicle.", _player, (name _player)];
	};

	if (not(_player == (driver vehicle _player))) exitWith {
		player groupChat format["%1-%2, you cannot use the refuel can now. You are not the vehicle driver.", _player, (name _player)];
	};

	if ((fuel vehicle player) == 1)  exitWith {
		player groupChat format["%1-%2, your vehicle's fuel tank is already full.", _player, (name _player)];
	};

	player groupchat "Refueling vehicle now.";
	sleep 15;
	(vehicle _player) setFuel 1;
	player groupChat format["%1-%2, your vehicle is now refueled.", _player, (name _player)];
	[_player, _item, -1] call inventory_add_item;
};};


interact_vehicle_unflip = { _this spawn {
	player groupChat format["interact_vehicle_unflip %1", _this];
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_vehicle);
	
	if (not([_player] call player_exists)) exitWith {};
	if (not([_vehicle] call vehicle_exists)) exitWith {};
	
	player grouPChat format["adadas!"];
	if (not([player, _vehicle] call vehicle_owner)) exitWith {
		player groupchat "You need the keys to unflip a vehicle.";
	};
	
	if ((count crew _vehicle) > 0) exitWith {
		player groupChat "The vehicle must be empty to be unflipped.";
	};

	player groupChat "Turning your vehicle over, wait 10 seconds within 10 meters.";
	sleep 10;

	if ((_player distance _vehicle) > 10) exitWith {
		player groupchat "Could not unflip vehicle, you must stay within 10 meters.";
	};
	
	[[_vehicle,[0,0,1]], "object_setVectorUp", true, false] call BIS_fnc_MP;
	player groupchat "Your vehicle has been unflipped";
};};







interact_use_knife_active = false;
interact_use_knife = { _this spawn {
	if (dialog) exitWith {};
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_object);
	if (not([_player] call player_human)) exitWith {false};
	if (undefined(_object)) exitWith {false};
	
	if (interact_use_knife_active) exitWith {};
	interact_use_knife_active = true;
	player groupChat format["interact_use_knife %1", _this];
	
	private["_exit_clean"];
	_exit_clean = {
		sleep 0.8;
		interact_use_knife_active = false;
	};
	
	_player playActionNow "PutDown";
	sleep 0.2;
	
	private["_target"];
	_target = nearCursorTarget;
	
	if (isNull _target) exitWith { call _exit_clean;};
	if (not(_target isKindOf "Animal" || _target isKindOf "Man")) exitWith { call _exit_clean;};
	if (_target == _player) exitWith { call _exit_clean;};
	private["_distance"];
	player grouPChat format["_target = %1", _target];
	
	private["_position"];
	_position = getPos _target;
	if (_target isKindOf "Man") then {
		_position = _target modelToWorld (_target selectionPosition "spine3");
		
	};
	_distance = (_position distance _object);
	player groupChat format["_distance = %1", _distance];

	if (_distance > 1)  exitWith { call _exit_clean;};

	
	if (not(alive _target)) exitWith {
		player groupChat format["The knife target is not alive."];
		 call _exit_clean;
	};
	
	_target = [_target] call object_nonNetwork_convert;
	if (underwater _target) then {
		[[_target, 10], "object_underwater_bleed", true, false] call BIS_fnc_MP;
	};
	
	private["_damage"];	
	_damage = damage _target;
	_damage = _damage + 0.5;
	_target setDamage _damage;
	
	if (_target isKindOf "Man" && not(_target isKindOf "Animal")) then {
		playSound3D [format["a3\sounds_f\characters\human-sfx\Person0\P0_hit_0%1.wss", (floor(random 8) + 1)], _target];
	};

	call _exit_clean;
};};






interact_use_axe_active = false;
interact_use_axe = { _this spawn {
	if (dialog) exitWith {};
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_object);
	if (not([_player] call player_human)) exitWith {};
	if (undefined(_object)) exitWith {};
	
	if (interact_use_axe_active) exitWith {};
	interact_use_axe_active = true;
	
	private["_exit_clean"];
	_exit_clean = {
		sleep 1;
		interact_use_axe_active = false;
	};
	
	private["_class"];
	_class = typeName _object;
	
	_player playActionNow "PutDown";
	
	
	private["_left_hand_pos", "_pos1", "_pos2"];
	_left_hand_pos = _player selectionPosition "LeftHand";
	_pos1 = player modelToWorld _left_hand_pos;
	_pos2 = player modelToWorld [(_left_hand_pos select 0), (_left_hand_pos select 1) + 2, (_left_hand_pos select 2)];
	
	_object_intersect = lineIntersectsWith [ATLtoASL(_pos1), ATLtoASL(_pos2), objNull, objNull, true];
	if (count(_object_intersect) == 0) exitWith {call _exit_clean;};

	private["_intersects_tree", "_intersects_stone", "_tree_or_stone"];
	_tree_or_stone = _object_intersect select 0;
	_intersects_tree = false;
	_intersects_stone = false;
	
	if ([": t_", str(_tree_or_stone)] call BIS_fnc_inString) then {
		_intersects_tree = true;
	}
	else { if (["stone", str(_tree_or_stone)] call BIS_fnc_inString) then {
		_intersects_stone = true;
	}};
	
	if (not(_intersects_tree || _intersects_stone)) exitWith {call _exit_clean;};
	
	
	if (_intersects_tree) exitWith {
		[_player, _object, _tree_or_stone] call interact_tree_hit;
		call _exit_clean;
	};
	
	//cannot use regular axe to hit stone
	if (_intersects_stone && not(_class == "Land_Axe_F")) exitWith {
		[_player,_object, _tree_or_stone] call interact_stone_hit;
		call _exit_clean;
	};
	
	call _exit_clean;
};};
	

interact_stone_hits = 0;
interact_stone_hit = {
	//player groupChat format["interact_stone_hit %1", _this];
	ARGV(0,_player);
	ARGV(1,_object);
	ARGV(2,_stone);
	
	
	sleep 0.4;
	private["_sound", "_axe_sounds"];
	_axe_sounds = [
		"sounds\pickaxe1.ogg",
		"sounds\pickaxe2.ogg",
		"sounds\pickaxe3.ogg",
		"sounds\pickaxe4.ogg"
	];
	_sound = MISSION_ROOT + (_axe_sounds select (floor random (count(_axe_sounds))));
	playSound3d [_sound, _player, true];
	
	private["_position"];
	_position = getPos _stone;
	
	//check if we are near a mine
	private["_near_mine"];
	 _near_mine = [_stone] call mine_player_near;
	 if (undefined(_near_mine)) exitWith {};
	 

 	interact_stone_hits = interact_stone_hits + 1;
	//player groupChat format["interact_stone_hits = %1", interact_stone_hits];
	if (interact_stone_hits < 10) exitWith {};
	interact_stone_hits = 0;

	 //spawn the ore 
	 private["_item", "_data", "_item_max"];
	 _item = _near_mine select mine_data_item_id;
	 _item_max = _near_mine select mine_data_item_max;
	 
	 _data = ITEM_DATA(_item);
	 if (count(_data) == 0) exitWith {};
	 if (not(ITEM_DATA_ORE(_data))) exitWith {};
	 
	[_item, ceil(random _item_max), (getPos _stone), 0.1] call mine_ore_spawn;
};




interact_tree_hit = {
	//player groupChat format["interact_tree_hit %1", _this];
	ARGV(0,_player);
	ARGV(1,_object);
	ARGV(2,_tree);
	
	sleep 0.4;
	private["_sound", "_slash_sounds"];
	_slash_sounds = [
		"a3\sounds_f\vehicles\soft\noises\crash_mix_wood_01.wss",
		"a3\sounds_f\vehicles\soft\noises\crash_mix_wood_02.wss",
		"a3\sounds_f\vehicles\soft\noises\crash_mix_wood_03.wss",
		"a3\sounds_f\vehicles\soft\noises\crash_mix_wood_05.wss",
		"a3\sounds_f\vehicles\soft\noises\crash_mix_wood_06.wss"
	];
	_sound = _slash_sounds select (floor random (count(_slash_sounds)));
	playSound3d [_sound, _player, true];
	
	if (not(alive _tree)) exitWith {
		player groupChat format["This tree is already down"];
	};
	
	private["_damage"];
	_damage = damage _tree;
	_damage = _damage + 0.1;

	if (_damage >= 1) then {
		playSound3d ["a3\sounds_f\vehicles\soft\noises\crash_mix_wood_04.wss", _player, true];

		private["_tree_id"];
		_tree_id = netId _tree;
		[_tree_id] call tree_register;
		[_tree, true] call tree_hide;
		
		last_tree = _tree;
		[getPos _player] call tree_create_item;
		[getPos _player] call tree_create_item;
		[getPos _player] call tree_create_item;
	}
	else {
		_tree setDamage _damage;
	};
	

	player groupChat format["_damage = %1", _damage];
};	

interact_use_bucket_active = false;
interact_use_bucket = { _this spawn {
	if (dialog) exitWith {};
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_object);
	if (not([_player] call player_human)) exitWith {};
	if (undefined(_object)) exitWith {};
	
	if (interact_use_bucket_active) exitWith {};
	interact_use_bucket_active = true;
	
	private["_exit_clean"];
	_exit_clean = {
		sleep 1;
		interact_use_bucket_active = false;
	};
	
	private["_class"];
	_class = typeName _object;
	
	_player playActionNow "PutDown";
	
	
	private["_left_hand_pos", "_pos1", "_pos2"];
	_left_hand_pos = _player selectionPosition "LeftHand";
	_pos1 = player modelToWorld _left_hand_pos;
	_pos2 = player modelToWorld [(_left_hand_pos select 0), (_left_hand_pos select 1) + 1, (_left_hand_pos select 2) - 0.5];
	
	_object_intersects = lineIntersectsWith [ATLtoASL(_pos1), ATLtoASL(_pos2), objNull, objNull, true];
	if (count(_object_intersects) == 0) exitWith {call _exit_clean;};

	
	
	private["_intersects_tree", "_object_intersect"];
	_object_intersect = _object_intersects select 0;
	
	//player scooping out crude 
	if ([_object_intersect, "isPumpBarrel", false] call object_getVariable) exitWith {
		[_player, _object, _object_intersect] call interact_pump_barrel_hit;
		call _exit_clean;
	};
	
	private["_item"];
	_item = [_object_intersect, "item", ""] call object_getVariable;
	
	//player pouring crude onto empty barrel, or onto crude oil barrel
	if (_item == "emptybarrel" || {_item == "crudeoil"}) exitWith {
		[_player, _object, _object_intersect] call interact_cude_oil_barrel_hit;
		call _exit_clean;
	};
	
	
	call _exit_clean;
};};

interact_crude_oil_barrel_hit_max = 50;
interact_cude_oil_barrel_hit = {
	ARGV(0,_player);
	ARGV(1,_object);
	ARGV(2,_barrel);
	sleep 0.4;
	
	if (interact_pump_barrel_hits <= 0) exitWith {
		player groupChat format["You do not have any crude oil in the bucket to pour into the barrel"];
	};
	
	if (([_barrel, "item", ""] call object_getVariable) == "emptybarrel") then {
		//convert the empty barrel into an oil barrel
		[_barrel, "crudeoil", 0] call object_item_set_data;
	};
	
	private["_amount"];
	_amount = [([_barrel, "amount", 0] call object_getVariable)] call decode_number;
	if (_amount  >= interact_crude_oil_barrel_hit_max) exitWith {
		player groupChat format["This crude oil barrel is already at maximum capacity."];
	};
	
	
	private["_sound", "_slosh_sounds"];
	_slosh_sounds = [
		"sounds\splash1.ogg",
		"sounds\splash2.ogg",
		"sounds\splash3.ogg"
	];
	_sound = MISSION_ROOT + (_slosh_sounds select (floor random (count(_slosh_sounds))));
	playSound3d [_sound, _player, true];
	
	player groupChat format["You have poured %1 crude oil onto this barrel", interact_pump_barrel_hits];
	[_barrel, (_amount + interact_pump_barrel_hits)] call object_item_update_amount;
	interact_pump_barrel_hits = 0;
};

interact_pump_barrel_hits_max = 5;
interact_pump_barrel_hits = 0;
interact_pump_barrel_hit = {
	//player groupChat format["interact_barrel_hit %1", _this];
	ARGV(0,_player);
	ARGV(1,_object);
	ARGV(2,_barrel);
	sleep 0.4;
	
	private["_amount"];
	_amount = [_barrel, "amount", 0] call object_getVariable;
	
	if (_amount <= 0) exitWith {
		player groupChat format["There is no crude oil to scoop from this pump barrel"];
	};
	
	if (interact_pump_barrel_hits >= interact_pump_barrel_hits_max) exitWith {
		player groupChat format["You have %1/%2 crude oil in the bucket", interact_pump_barrel_hits, interact_pump_barrel_hits_max];
	};
	
	
	private["_sound", "_slosh_sounds"];
	_slosh_sounds = [
		"sounds\slosh1.ogg",
		"sounds\slosh2.ogg",
		"sounds\slosh3.ogg"
	];
	_sound = MISSION_ROOT + (_slosh_sounds select (floor random (count(_slosh_sounds))));
	playSound3d [_sound, _player, true];
	
	interact_pump_barrel_hits = interact_pump_barrel_hits + 1;
	[_barrel, (_amount - 1)] call oil_derrick_barrel_update;
	player groupChat format["You have %1/%2 crude oil in the bucket", interact_pump_barrel_hits, interact_pump_barrel_hits_max];
	
};

interaction_functions_defined = true;