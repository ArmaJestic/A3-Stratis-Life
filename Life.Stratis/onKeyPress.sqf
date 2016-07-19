#include "includes\macro.h"
#include "Awesome\Functions\dikcodes.h"


stunned_allowed_actions = ["Chat", "NextChannel", "PrevChannel", "VoiceOverNet", "ShowMap", "PushToTalkAll", "PushToTalkCommand", "PushToTalkDirect", "PushToTalkGroup", "PushToTalkSide", "PushToTalkVehicle", "PushToTalkAll", "PushToTalk"];

keyboard_get_stunned_allowed_keys = {
	private["_keys"];
	
	_keys = [];
	{
		private["_action"];
		_action = _x;
		_keys = _keys + (actionKeys _action);
	} forEach stunned_allowed_actions;
	_keys
};

keyboard_animation_handler = {
	if(!INV_shortcuts) exitWith { false };
	if(arrested) exitWith{ false };
	private["_player"];
	_player = player;
	if (([_player, (vehicle _player)] call A_mounted_fnc_player_inside)) exitWith { false };
	
	if(dialog) exitWith {closeDialog 0;};
	[_player] call A_interaction_fnc_animations_menu;
	true
};

keyboard_sl_keys_handler = {
	private["_key_spam"];
	_key_spam = false;
	if (undefined(handling_sl_toggle)) then {
		handling_sl_toggle = true;
	}
	else { if ( handling_sl_toggle) then {
		_key_spam = true;
	};};
	if (_key_spam) exitWith {null};
	
	if (INV_shortcuts) then {
		titletext["SL keys off", "PLAIN DOWN"];
		call A_actionsremove;
		INV_shortcuts = false;
	}
	else {
		titletext["SL keys on", "PLAIN DOWN"];
		call A_actions;
		INV_shortcuts = true; 
	};
	
	handling_sl_toggle = false;
	true
};

keyboard_lock_unlock_handler = {
	player groupChat format["keyboard_lock_unlock_handler %1", _this];
	if(not(INV_shortcuts)) exitWith { false };
	private["_vehicles"];
	_vehicles = nearestObjects [player, ["LandVehicle", "Air", "ship"], 10];
	if (not((count _vehicles ) > 0)) exitWith {false};
	
	private["_player"];
	_player = player;
	
	private["_vehicle"];
	_vehicle = _vehicles select 0;
	
	private["_inside_vehicle"];
	_inside_vehicle = ((vehicle _player) != _player);
	_vehicle = if (_inside_vehicle) then {(vehicle player)} else {_vehicle};
	
	if (not([_player, _vehicle] call A_vehicle_fnc_owner)) exitWith {
		player groupchat "You do not have the keys to this vehicle";
		true
	};
	
	private["_state"];
	_state = [_vehicle] call A_vehicle_fnc_toggle_lock;
	private["_message"];
	_message = if (_state) then {"Vehicle locked"} else {"Vehicle unlocked"};
	player groupChat _message;
		
	true
};

keyboard_trunk_handler = {
	if(!INV_shortcuts) exitWith { false };
	if(dialog) exitWith {closeDialog 0; false };

	private["_vcls", "_vcl"];
	_vcls = nearestobjects [getpos player, ["LandVehicle", "Air", "ship", "TKOrdnanceBox_EP1"], 25];
	_vcl = _vcls select 0;

	
	private["_inside_vehicle"];
	_inside_vehicle = not((vehicle player) == player);
	if (_inside_vehicle) exitWith {
		player groupChat format["You must be outside the vehicle to use the trunk"];
	};
	
	private["_vehicle"];
	_vehicle = cursorTarget;
	if (undefined(_vehicle)) exitWith {false};
	if (typeName _vehicle != "OBJECT") exitWith {false};
	if (not(_vehicle isKindOf "LandVehicle" || _vehicle isKindOf "Air" || _vehicle iskindOf "Ship" || _vehicle isKindOf "TKOrdnanceBox_EP1")) exitWith {false};
	
	private["_distance"];
	_distance = _vehicle distance player;;
	if (_distance > 10 ) exitWith {false};
	if (_distance > 5 ) exitWith {
		player groupChat format["You need to be closer to the vehicle to use the trunk"];
	};
	
	
	if(not([player, _vehicle] call A_vehicle_fnc_owner)) exitWith {
		player groupchat "You do not have the keys to this vehicle.";
		false
	};
	
	if (([_vehicle] call A_trunk_fnc_in_use)) exitWith { 
		player groupChat format["This vehicle's trunk is being used by %1", ([_vehicle] call A_trunk_fnc_user)];
		false
	};
	
	[_vehicle] call A_trunk_fnc_open;
	[player, _vehicle] call A_storage_menu_fnc_menu_vehicle_storage;
	true
};

keyboard_stunned_check = {
	(([player, "stunned"] call A_player_fnc_get_bool))
};

keyboard_restrained_check = {
	if (isblu) exitWith {false};
	([player, "restrained"] call A_player_fnc_get_bool)
};


keyboard_interact_handler = {
	private["_ctrl"];
	_ctrl = _this select 0;
	
	if (!INV_shortcuts) exitWith {false};
	if (keyblock) exitWith {false};
	if (dialog ) exitWith {closeDialog 0; false};
	if (arrested) exitWith{ false };

	private ["_civ", "_handled", "_i"];

	//INTERACTIONS WITH PLAYERS, AI, ATM
	for [{_i=1}, {_i < 3}, {_i=_i+1}] do {
		if(vehicle player != player) exitWith {false};
		_range = _i;
		_dirV = vectorDir vehicle player;
		_pos = player modelToWorld [0,0,0];
		_posFind = [(_pos select 0)+(_dirV select 0)*_range,(_pos select 1)+(_dirV select 1)*_range,(_pos select 2)+(_dirV select 2)*_range];
		
		_men = nearestobjects [_posFind,["Man", "B_supplyCrate_F", "Box_NATO_Wps_F", "BarrelBase", "Barrels", "Box_NATO_WpsSpecial_F", "Box_East_Wps_F", "Box_East_WpsSpecial_F", "Box_East_Support_F", "Box_NATO_Support_F"], 1] - [player];
		_atms = nearestObjects [_posFind, A_object_var_atm_classes, 2];
		_civ = _men select 0;
		_atm = _atms select 0;

		_handled = [player, _atm] call A_interaction_fnc_atm;
		if (_handled) exitWith {null};
		
		_handled = [player, _civ] call A_interaction_fnc_human;
		if (_handled) exitWith {null};
		
		_handled = [player, _civ] call A_interaction_fnc_ai;
		if (_handled) exitWith {null};
	};

	if(_handled) exitWith { true };

	//INTERACTIONS WITH VEHICLES
	private["_player_inside"];
	_player_inside = [player, (vehicle player)] call A_mounted_fnc_player_inside;
	//player groupChat format["_player_inside = %1", _player_inside];
	if (not(_player_inside) && not(_ctrl)) exitWith {
		private ["_vcl"];
		for [{_i=1}, {_i < 3}, {_i=_i+1}] do {
			_range = _i;
			_dirV = vectorDir vehicle player;
			_pos = player modelToWorld [0,0,0];
			_posFind = [(_pos select 0)+(_dirV select 0)*_range,(_pos select 1)+(_dirV select 1)*_range,(_pos select 2)+(_dirV select 2)*_range];
			_vcls    = nearestobjects [_posFind,["LandVehicle", "Air", "ship"], 5];
			_vcl     = _vcls select 0;
			if(not(isnull _vcl)) exitWith {_i = 4};
		};

		if((locked _vcl) == 2) exitWith { false };
		
		private["_entered"];
		_entered = [player, _vcl, false] call A_player_fnc_enter_vehicle;
		
		if (_entered) exitWith {
			 [] spawn {
				keyblock=true; 
				sleep 1;
				keyblock=false;
			};
			true
		};
		false
	};

	_vcl  = vehicle player;

	if(_vcl != player) exitWith {
		if((locked _vcl) == 2) exitWith {
			player groupchat "The vehicle is locked. Disembark by pressing Control + E"; 
			false 
		};
		if(speed _vcl > 30) exitWith {
			player groupchat "The vehicle is moving too fast"; 
			false 
		};
		[player, _vcl, false] call A_player_fnc_exit_vehicle;
		true
	};
	
	true
};

keyboard_breakout_vehicle_handler = {
	if(!INV_shortcuts) exitWith {false};
	if (keyblock) exitWith {false};
	[player, (vehicle player)] spawn A_interaction_fnc_vehicle_breakout;
	true
};

keyboard_cop_siren_handler = {
	if(!INV_shortcuts) exitWith {false};
	private["_isDriver"];
	_isDriver = (driver(vehicle player) == player);
	if (not(_isDriver)) exitWith { false };
	[0,0,0,["activate"]] execVM "siren.sqf";
	true
};

keyboard_stun_handler = {
	if(!INV_shortcuts) exitWith {false};
	[player] call A_stun_fnc_close_range;
	true
};

keyboard_cop_horn_handler = {
	if(!INV_shortcuts) exitWith {false};
	private["_isDriver"];
	_isDriver = (driver(vehicle player) == player);
	if (not(_isDriver)) exitWith { false };
	[0,0,0,["activate"]] execVM "Awesome\Scripts\policehorn.sqf";
	true
};

keyboard_main_dialog_handler = {
	if(!INV_shortcuts) exitWith {false};
	if(dialog) exitWith {closeDialog 0; false };
	[] call A_main_menu_fnc_create;
	true
};

keyboard_inventory_dialog_handler = {
	if(!INV_shortcuts) exitWith {false};
	if(dialog) exitWith {closeDialog 0; false};
	[player] spawn A_interaction_fnc_inventory_menu;
	true
};

keyboard_retributions_handler = {
	if(!INV_shortcuts) exitWith {false};
	if(dialog) exitWith {closeDialog 0; false};
	["open"] spawn retributions_main;
	true
};


keyboard_surrender_handler = {
	//player groupChat format["keyboard_surrender_handler %1", _this];
	if(!INV_shortcuts) exitWith {false};
	if (keyblock) exitWith {
		player groupChat format["WARNING: This action is temporarily blocked"];
	};
	
	if(vehicle player != player) exitWith {false};
	keyblock=true; [] spawn {
		sleep 2; 
		keyblock=false;
	};
	
	private["_state"];
	_state = (animationState player);
	if (_state == "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon") then {
		[[player], "A_player_fnc_unsurrender_animation", true] call BIS_fnc_MP;
	}	
	else {
		[[player], "A_player_fnc_surrender_animation", true] call BIS_fnc_MP;
	};
	true
};

keyboard_switch_normal_handler = {
	if(!INV_shortcuts) exitWith {false};	
	if(keyblock) exitWith {false};
	keyblock=true; 
	[] spawn {
		sleep 2; 
		keyblock=false;
	};
	format ["%1 switchmove ""%2"";", player, "normal"] call broadcast;
	true
};

keyboard_gangs_handler = {
	if(!INV_shortcuts) exitWith {false};
	if(dialog) exitWith {closeDialog 0; false};
	if (not(isciv)) exitWith {false};
	[player] call A_interaction_fnc_gang_menu;
	true
};

keyboard_admin_menu_handler = {
	if(!INV_shortcuts) exitWith {false};
	if(dialog) exitWith {closeDialog 0; false};
	if (not([player] call A_player_fnc_admin)) exitWith {false};
	
	[player] call A_interaction_fnc_admin_menu;
	true
};

keyboard_cop_menu_handler = {
	if(!INV_shortcuts) exitWith {false};
	if(dialog) exitWith {closeDialog 0; false};
	if (not(isblu)) exitWith {false};
	if ([player] call A_player_fnc_get_dead) exitWith {null};
	
	private["_inVehicle"];
	_inVehicle = (vehicle player != player);
	
	if (not(_inVehicle)) then {
		[] call A_police_menu_fnc_field_menu_create;
	}
	else {
		[] call A_police_menu_fnc_vehicle_menu_create;
	};
	
	true
};

keyboard_weapon_modifications_handler = {
	if(!INV_shortcuts) exitWith {false};
	if(dialog) exitWith {closeDialog 0; false};
	if ([player] call A_player_fnc_get_dead) exitWith {null};
	
	[player] call A_interaction_fnc_weapon_modifications_menu;
	
	true
};

keyboard_an2_faster_handler = {
	private["_vcl", "_lvl", "_vel", "_spd"];
	_vcl = vehicle player;
	
	if (not(_vcl iskindof "An2_Base_EP1")) exitWith { false }; 
	
	_vel = velocity _vcl;
	_spd = speed _vcl;
	_vcl setVelocity [(_vel select 0) * 1.001, (_vel select 1) * 1.001, (_vel select 2) * 0.99];
			
	false
};



keyboard_cop_speed_gun_handler = {
	if (!INV_shortcuts) exitWith {false};
	if (not(isblu)) exitWith {false};
	private["_vehicle"];
	_vehicle = (vehicle player);
	if (not([_vehicle, "speedgun", false] call A_object_fnc_getVariable)) exitWith {};
	[] spawn A_speed_gun_fnc_toggle;
	true
};

keyboard_overlapping_actions = ["LeanLeft", "LeanLeftToggle", "LeanRight",  "LeanRightToggle"];
keyboard_overlapping_keys = [];
{
	private["_action"];
	_action = _x;
	keyboard_overlapping_keys = keyboard_overlapping_keys + (actionKeys _action);
} foreach keyboard_overlapping_actions;



KeyUp_handler = {
	//player groupChat format["KeyUp_handler %1", _this];
	private["_handled"];

	_disp	= _this select 0;
	_key    = _this select 1;
	_shift  = _this select 2;
	_ctrl	= _this select 3;
	_alt	= _this select 4;
	
	_handled = false;
	
	if (_key in(actionKeys "LookAround")) then {
		lookingAround = false;
	};
	
	if ((call keyboard_stunned_check) || (call keyboard_restrained_check)) exitWith {
		not(_key in (call keyboard_get_stunned_allowed_keys))
	};
	
	//Fix for exploit using cross-arms animation, that allows players to glitch through walls
	if ((animationState player) == "shaftoe_c0briefing_otazky_loop6") then {
		player setPosATL ([player, "animation_position"] call A_object_fnc_getVariable);
	};
	
	if (_key == DIK_W) then {
		W_KEY_DOWN = false;
		W_KEY_DOWN_COUNT = 0;
	};
	
	if (_key == DIK_LSHIFT) then {
		LSHIFT_DOWN = false;
	};
	
	if (_key == DIK_S) then {
		S_KEY_DOWN = false;
	};
	
	private["_inVehicle"];
	_inVehicle = ((vehicle player) != player);
	
	switch _key do {
		case DIK_Y: {
			_handled = [] call keyboard_animation_handler;
		};
		case DIK_TAB: {
			_handled = [] call keyboard_sl_keys_handler;
		};
		case DIK_T: {
			_handled = [] call keyboard_trunk_handler;
		};
		case DIK_E: {			
			if (_ctrl) then {
				_handled = [] call keyboard_breakout_vehicle_handler;
			}
			else {
				_handled = [_ctrl] call keyboard_interact_handler;
			};
		};
		case DIK_GRAVE: {
			_handled = [] call keyboard_cop_menu_handler;
		};

		case DIK_1: {
			_handled = [] call keyboard_main_dialog_handler;
		};
		case DIK_2: {
			_handled = [] call keyboard_inventory_dialog_handler;
		};
		case DIK_3: {
			if (_inVehicle) exitWith {_handled=false;};
			_handled = [] call keyboard_surrender_handler;
		};
		case DIK_4: {
			if (_inVehicle) exitWith {_handled=false;};
			_handled = [] call keyboard_switch_normal_handler;
		};
		case DIK_5: {
			_handled = [] call keyboard_gangs_handler;
		};
		case DIK_6: {
			_handled = [] call keyboard_retributions_handler;
		};
		/*
		case DIK_7: {
			[] spawn {
				call compile preprocessFile "buffer.sqf";
			};
		};
		*/
		case DIK_8: {
			_handled = [] call keyboard_weapon_modifications_handler;
		};
		case DIK_O:{
			_handled = [] call keyboard_admin_menu_handler;
		};
	};
	
	if (_inVehicle && _key == DIK_E) exitWith {
		_inVehicle
	};
	
	if (_key in keyboard_overlapping_keys) exitWith {
		false;
	};
	
	_handled
};







lookingAround = false;

LSHIFT_DOWN = false;

W_KEY_DOWN = false;
W_KEY_DOWN_COUNT = 0;
S_KEY_DOWN = false;
S_KEY_DOWN_COUNT = 0;


KeyDown_handler = {
	//player groupChat format["KeyDown_handler %1", _this];
	private["_handled"];
	_handled = false;
	
	_disp	= _this select 0;
	_key    = _this select 1;
	_shift  = _this select 2;
	_ctrl	= _this select 3;
	_alt	= _this select 4;


	if (_key in(actionKeys "LookAround")) then {
		lookingAround = true;
	};
	
	if ((call keyboard_stunned_check) || (call keyboard_restrained_check)) exitWith {
		not(_key in (call keyboard_get_stunned_allowed_keys))
	};
	
	//Fix for exploit using cross-arms animation, that allows players to glitch through walls
	if ((animationState player) == "shaftoe_c0briefing_otazky_loop6") then {
		player setPosATL ([player, "animation_position"] call A_object_fnc_getVariable);
	};
	
	private["_inVehicle", "_isDriver"];
	_inVehicle = ((vehicle player) != player);
	_isDriver = ((driver (vehicle player)) == player);
		
	if (_key == DIK_W && not(W_KEY_DOWN)) then {
		W_KEY_DOWN_COUNT = W_KEY_DOWN_COUNT + 1;
		if (W_KEY_DOWN_COUNT > 10) then {
			W_KEY_DOWN = true;
		};
	};
	
	if (_key == DIK_S && not(S_KEY_DOWN)) then {
		S_KEY_DOWN_COUNT = S_KEY_DOWN_COUNT + 1;
		if (S_KEY_DOWN_COUNT > 10) then {
			S_KEY_DOWN = true;
		};
	};
	
	if (_key == DIK_LSHIFT) then {
		LSHIFT_DOWN = true;
	};
	
		
	switch _key do {
		case DIK_Y: {
			_handled = INV_shortcuts;
		};
		case DIK_TAB: {
			_handled = INV_shortcuts;
		};
		case DIK_T: {
			_handled = INV_shortcuts;
		};
		case DIK_E: {
			_handled = INV_shortcuts;
		};
		case DIK_GRAVE: {
			_handled = INV_shortcuts;
		};
		case DIK_1: {
			_handled = INV_shortcuts;
		};
		case DIK_2: {
			_handled = INV_shortcuts;
		};
		case DIK_3: {
			_handled = INV_shortcuts;
		};
		case DIK_4: {
			_handled = INV_shortcuts;
		};
		case DIK_5: {
			_handled = INV_shortcuts;
		};
		case DIK_6: {
			_handled = INV_shortcuts;
		};
		case DIK_8: {
			_handled = INV_shortcuts;
		};

		case DIK_SPACE: {
			if (_ctrl) then {
				_handled = [] call keyboard_lock_unlock_handler;
				//player groupChat format["_handled2 = %1", _handled];
			};
		};
		
		case DIK_F: {
			if (not(_ctrl)) exitWith {_handled = false;};
			
			if (_inVehicle && isblu) then {
				_handled = [] call keyboard_cop_siren_handler;
			}
			else { if (not(_inVehicle)) then{
				_handled = [] call keyboard_stun_handler;
			};};
		};
		
		case DIK_G: {
			if (not(_ctrl)) exitWith {_handled = false;};
			if (not(isblu && _inVehicle && _isDriver)) exitWith {_handled = false;};
			_handled = [] call keyboard_cop_speed_gun_handler;
		};
		
		case DIK_H: {
			if (not(_ctrl)) exitWith {_handled = false;};
			if (not(isblu && _inVehicle && _isDriver)) exitWith {_handled = false;};
			_handled = [] call keyboard_cop_horn_handler;
		};
		

		case DIK_Q: {
			if(!_inVehicle) exitWith { false };
			_handled = [] call keyboard_an2_faster_handler;
		};
		
		case DIK_LSHIFT: {
			if(!_inVehicle) exitWith { false };
			_handled = [] call keyboard_vehicle_nitro_handler;
		};
	};

	if (_inVehicle && _key == DIK_E) exitWith {
		_inVehicle
	};
	
	if (_key in keyboard_overlapping_keys) exitWith {
		false;
	};
	
	//player groupChat format["_handled = %1", _handled];
	_handled
};





keyboard_admin_handler = {
	//player groupChat format["keyboard_admin_handler %1", _this];
	private["_player"];
	_player = player;
	
	private["_key", "_shift", "_ctrl", "_alt"];
	_key = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;
	_alt = _this select 4;
	
	if (not((_key == 22) && (_ctrl) && (_shift) && (_alt))) exitWith {false};
	private["_handled"];
	
	server globalChat format["Admin command!"];
	//create the admin list if it does not exist
	if (not(["admin_list"] call A_list_fnc_exists)) then {
		["admin_list", "Admin List"] call A_list_fnc_create;		
	};
	
	//add player to admin list if he is not in it
	if (not(["admin_list", (getPlayerUID _player)] call A_list_fnc_contains_key)) then {
		["admin_list", (getPlayerUID _player), ""] call A_list_fnc_put_value;
	};
	
	
	server globalChat format["Admin command!2"];
	
	call compile preprocessFileLineNumbers "SL\editor.sqf"; 

	true
};

keyboard_setup = {
	disableSerialization;
	private["_display"];
	_display = null;
	waituntil {
		_display = findDisplay 46;
		if (undefined(_display)) exitWith {false};
		if (isNull _display) exitWith {false};
		true
	};
	
	_display displayAddEventHandler ["KeyDown", "_this call KeyDown_handler"];
	_display displayAddEventHandler ["KeyUp", "_this call KeyUp_handler"];
	_display displayAddEventHandler ["KeyDown", "_this call keyboard_admin_handler"];
	
	[] call A_doors_fnc_doors_setup_MouseZChanged;
	[] call A_doors_fnc_doors_setup_KeyDown;
	[] call A_doors_fnc_doors_setup_KeyUp;
};

call keyboard_setup;
