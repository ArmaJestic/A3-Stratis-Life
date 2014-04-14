#include "macro.h"
#include "dikcodes.h"

if (not(undefined(mounted_vehicles_functions))) exitWith {null};

mounted_classes = 0;
mounted_slots = 1;

mounted_slot_id = 0;
mounted_slot_text = 1;
mounted_slot_offset = 2;
mounted_slot_heading = 3;
mounted_slot_exit = 4;
mounted_slot_blocked_actions = 5; // Prone, Crouch, Stand  (these are the names returned by actionKeys command)
mounted_slot_default_action = 6;  // Lying, Crouch, Stand  (these are strings passed to playActioNow command)
mounted_slot_direction_min = 7;
mounted_slot_direction_max = 8;
mounted_slot_pitch_min = 9;
mounted_slot_pitch_max = 10;
mounted_slot_requires_weapon = 11;

mounted_slot_offset_name = 0;
mounted_slot_offset_data = 1;

mounted_slot_heading_name = 0;
mounted_slot_heading_data = 1;

mounted_slot_exit_name = 0;
mounted_slot_exit_data = 1;


#define CROUCH_SEQ ["AdjustB", "AdjustB", "AdjustB", "AdjustB"]
#define SITUP_SEQ ["AdjustB", "AdjustB"]
#define STANDUP_SEQ ["AdjustB"]

mounted_vehicle_slots = [

	[	["O_Truck_02_covered_F", "I_Truck_02_covered_F"],
		[
			["shooter1", ", ride on flat-bed front", ["offset",  [0.01,-0.3,-0.6]], ["heading", [0,346,0]], ["exit", [-0.24,-3.89,-1.93]], ["Stand", "moveUp", "getOver", "Prone", "moveDown"], CROUCH_SEQ, -1, 361, -10, 35, true],
			["shooter2", ", ride on flat-bed back", ["offset",  [0.04,-2.81,-0.67]], ["heading", [129,8,0]], ["exit", [-0.24,-3.89,-1.93]], ["Stand", "moveUp", "getOver", "Prone", "moveDown"], CROUCH_SEQ, -1, 361, -10, 35, true]
		]
	],
	[	["O_Truck_02_transport_F", "I_Truck_02_transport_F"],
		[
			["shooter1", ", ride on flat-bed front", ["offset",  [0.01,-0.3,-0.6]], ["heading", [0,346,0]], ["exit", [-0.24,-3.89,-1.93]], ["Prone", "moveDown"], CROUCH_SEQ, -1, 361, -10, 35, false],
			["shooter2", ", ride on flat-bed back", ["offset",  [0.04,-2.81,-0.67]], ["heading", [129,8,0]], ["exit", [-0.24,-3.89,-1.93]], ["Prone", "moveDown"], CROUCH_SEQ, -1, 361, -10, 35, false]
		]
	],
	[	["B_Truck_01_covered_F"],
		[
			["shooter1", ", ride on flat-bed front", ["offset",  [0.01,-0.3,-0.6]], ["heading", [0,346,0]], ["exit", [-0.24,-5.89,-1.93]], ["Prone", "moveDown"], CROUCH_SEQ, -1, 361, -10, 35, false],
			["shooter2", ", ride on flat-bed back", ["offset",  [0.04,-2.91,-0.67]], ["heading", [129,8,0]], ["exit", [-0.24,-5.89,-1.93]], ["Prone", "moveDown"], CROUCH_SEQ, -1, 361, -10, 35, false]
		]
	],
	[	["B_Truck_01_transport_F"],
		[
			["shooter1", ", ride on flat-bed front", ["offset",  [0.01,-0.3,-0.6]], ["heading", [0,346,0]], ["exit", [-0.24,-5.89,-1.93]], ["Prone", "moveDown"], CROUCH_SEQ, -1, 361, -10, 35, false],
			["shooter2", ", ride on flat-bed back", ["offset",  [0.04,-2.91,-0.67]], ["heading", [129,8,0]], ["exit", [-0.24,-5.89,-1.93]], ["Prone", "moveDown"], CROUCH_SEQ, -1, 361, -10, 35, false]
		]
	],
	[	["B_Heli_Light_01_F"],
		[
			["shooter1", ", ride on left side", ["offset",  [-0.52,1.27,0.3]], ["heading", [285,350,0]], ["exit", [-1.77,1.05,-2.05]], ["Stand", "moveUp", "getOver", "Prone", "moveDown"], CROUCH_SEQ, 199, 319, -35, 22, true],
			["shooter2", ", ride on right side", ["offset",  [0.6,1.27,0.3]], ["heading", [84,360,0]], ["exit", [2.21,0.55,-1.8]], ["Stand", "moveUp", "getOver", "Prone", "moveDown"], CROUCH_SEQ, 30, 160, -30, 22, true]
		]
	],
	[	["MH60S"],
		[
			["shooter1", ", ride on left side", ["offset", [-0.8,1.2,-1.95]], ["heading", [291,360,0]], ["exit", [-2.31,1.34,-2.55]], ["Stand", "moveUp", "getOver", "Prone", "moveDown"], CROUCH_SEQ, -1, 361, -60, 45, true]
		]
	],
	[	["LandRover_ACR", "LandRover_TK_CIV_EP1", "LandRover_CZ_EP1", "BAF_Offroad_D", "BAF_Offroad_W"],
		[
			["shooter1", ", ride on the back", ["offset", [1.49012e-008,-1.5,-0.9]], ["heading", [191,360,0]], ["exit", [0.1,-3.1,-1.7]], ["Stand", "moveUp", "getOver", "Prone", "moveDown"], CROUCH_SEQ, -1, 361, -60, 45, true]
		]
	],
	[	["Ikarus_TK_CIV_EP1", "Ikarus"],
		[
			["shooter1", ", ride on the back", ["offset", [-0.3,-4.6,-0.8]], ["heading", [161,0,0]], ["exit", [2.1,-4.7,-1.7]], ["Prone", "moveDown"], STANDUP_SEQ, -1, 361, -60, 45, false],
			["shooter2", ", ride on the hallway", ["offset", [-0.39,0,-0.83]], ["heading", [0,0,0]], ["exit", [1.77,0,-1.78]], ["Prone", "moveDown"], STANDUP_SEQ, -1, 361, -60, 45, false],
			["shooter3", ", ride on the front", ["offset", [-0.1,3.2,-0.9]], ["heading", [349,0,0]], ["exit", [2,3.5,-1.8]], ["Prone", "moveDown"], STANDUP_SEQ, -1, 361, -60, 45, false]
		]
	],
	[	["C_Offroad_01_F"],
		[
			["shooter1", ", ride on the back", ["offset", [-0.1,-1.3,-0.8]], ["heading", [1,0,0]], ["exit", [-0.1,-3.2,-1.6]], ["getOver", "Prone", "moveDown"], STANDUP_SEQ, -1, 361,  -10, 35, false]
		]
	],
	/*
	[	["B_Quadbike_01_F"],
		[
			["shooter1", ", ride on the back", ["offset", [-0.52,-1,-1]], ["heading", [180,0,0]], ["exit", [-0.1,-3.2,-1.6]], ["Stand", "moveUp", "getOver", "Prone", "moveDown"], SITUP_SEQ, 155, 195,  -10, 7, true]
		]
	],
	*/
	
	[	["datsun1_civil_2_covered"],
		[
			["shooter1", ", ride on the back", ["offset", [0.1,-1.29,-1]], ["heading", [180,360,0]], ["exit", [0.13,-3.01,-1.47]], ["Stand", "moveUp", "getOver", "Prone", "moveDown"], CROUCH_SEQ, -1, 361, -60, 45, false]
		]
	]
];



mounted_disallowed_actions = [ "MoveBack", "MoveDown", "MoveFastForward", "MoveForward", "MoveLeft", "MoveRight", "MoveSlowForward", 
							   "CommandBack", "CommandLeft", "CommandRight", "CommandForward", "CommandFast", "CommandSlow"];	   
mounted_diallowed_keys = [];

{
	private["_action"];
	_action = _x;
	mounted_diallowed_keys = mounted_diallowed_keys + (actionKeys _action);
} foreach mounted_disallowed_actions;


mounted_passthrough_actions = ["LeanLeft", "LeanLeftToggle", "LeanRight",  "LeanRightToggle"];
mounted_passthrough_keys = [];

{
	private["_action"];
	_action = _x;
	mounted_passthrough_keys = mounted_passthrough_keys + (actionKeys _action);
} foreach mounted_passthrough_actions;


mounted_set_heading = {
	ARGV(0,_object);
	ARGV(1,_data);
	
	private["_direction", "_angle", "_pitch"];
	
	_direction = _data select 0;
	_angle = _data select 1;
	_pitch = _data select 2;
	
	_vecdx = sin(_direction) * cos(_angle);
	_vecdy = cos(_direction) * cos(_angle);
	_vecdz = sin(_angle);

	_vecux = cos(_direction) * cos(_angle) * sin(_pitch);
	_vecuy = sin(_direction) * cos(_angle) * sin(_pitch);
	_vecuz = cos(_angle) * cos(_pitch);

	[_object, "heading", _data] call object_setVariable;
	_object setVectorDirAndUp [ [_vecdx,_vecdy,_vecdz], [_vecux,_vecuy,_vecuz] ];
};

mounted_attach = {
	ARGV(0,_player);
	ARGV(1,_vehicle);
	ARGV(2,_offset);
	
	_player attachTo [_vehicle, _offset];
	[_player, [(getDir _player),0,0]] call mounted_set_heading;
};

mounted_lookup_class = {
	ARGV(0,_class);
	if (undefined(_class)) exitWith {null};
	if (typeName _class != "STRING") exitWith {null};
	
	private["_entry"];
	_entry = null;
	
	{
		private["_centry", "_cclass", "_cslot_name", "_clots"];
		_centry = _x;
		_cclass = _centry select mounted_classes;
		if (_class in (_cclass) ) exitWith {
			_entry = _centry;
		};
	} forEach mounted_vehicle_slots;
	
	_entry
};

mounted_lookup_class_slot = {
	ARGV(0,_class);
	ARGV(1,_slot_id);
	
	private["_entry"]; 
	_entry = [_class] call mounted_lookup_class;
	if (undefined(_entry)) exitWith {null};
	
	if (undefined(_slot_id)) exitWith {null};
	if (typeName _slot_id != "STRING") exitWith {null};
	
	private["_slot_entry"];
	_slot_entry = null;
	
	{
		private["_cslot_entry", "_cslot_name"];
		_cslot_entry = _x;
		_cslot_name = _cslot_entry select mounted_slot_id;
		if (_cslot_name == _slot_id) exitWith {
			_slot_entry = _cslot_entry;
		};
	} forEach (_entry select mounted_slots);
	
	_slot_entry
};

mounted_get_occupants = {
	ARGV(0,_vehicle);
	
	private["_class"]; 
	_class = (typeOf _vehicle);
	private["_entry"];
	_entry = [_class] call mounted_lookup_class;
	if (undefined(_entry)) exitWith {[]};
	
	private["_occupants"];
	_occupants = [];
	
	{
		private["_slot", "_slot_id", "_occupant"];
		_slot = _x;
		_slod_id = _slot select mounted_slot_id;
		_occupant = [_vehicle, _slod_id] call mounted_get_slot_occupant;
		if (not(undefined(_occupant))) then {
			_occupants = _occupants + [_occupant];
		};
	} forEach (_entry select mounted_slots);
	
	_occupants
};

mounted_slot_wait = {
	_this spawn {
		ARGV(0,_player);
		ARGV(1,_vehicle);
		ARGV(2,_slot_id);
		
		//player groupChat format["Waiting for death"];
		waitUntil { not(alive _player) || not([_player, "inMountedSlot"] call object_getVariable)};

		[_player, "inMountedSlot", false, true] call object_setVariable;
		[_player, "mountedVehicle", nil, true] call object_setVariable;
		
		private["_occupant"];
		_occupant = [_vehicle, _slot_id] call mounted_get_slot_occupant;
		if (_occupant == _player) then {
			[_vehicle, _slot_id, null] call mounted_set_slot_occupant;
		};
		
		[] call mounted_remove_keyDown;
		[] call mounted_remove_keyUp;
		[] call mounted_remove_mouseMoving;
		
		if (alive _player) then {
			private["_class", "_slot_entry"];
			_class = typeOf _vehicle;
			_slot_entry = [_class, _slot_id] call mounted_lookup_class_slot;
			if (not(undefined(_slot_entry))) then {
				private["_exit"];
				_exit = (_slot_entry select mounted_slot_exit) select mounted_slot_exit_data;
				[_player, _vehicle, _exit] call mounted_attach;
			};
			
			[_player] spawn { ARGV(0,_player); detach _player;};
			
			titleText ["", "BLACK OUT", 0.1];
			titleText ["", "BLACK IN", 2];
		} 
		else {
			detach _player;
			hideBody _player;
		};
	};
};


mounted_set_stance_handler = {
	ARGV(0,_player);
	ARGV(1,_sequence);
	player groupChat format["_player = %1, _sequence = %2", _player, _sequence];
	
	private["_i"];
	_i = 10;
	while {_i > 0 } do {
		_player switchAction "AdjustF";
		_i = _i - 1;
	};
	
	{
		_player switchAction _x;
	} forEach _sequence;
};


mounted_set_stance = {
	ARGV(0,_player);
	ARGV(1,_stance_sequence);
	[_this, "mounted_set_stance_handler", true, false] call BIS_fnc_MP;
};

mounted_board_slot = {
	ARGV(0,_player);
	ARGV(1,_vehicle);
	ARGV(2,_slot_id);
	
	private["_class", "_slot_entry"];
	
	_class = typeOf _vehicle;
	
	_slot_entry = [_class, _slot_id] call mounted_lookup_class_slot;
	if (undefined(_slot_entry)) exitWith {null};
	
	private["_offset", "_heading", "_blocked_actions", "_blocked_keys", "_default_action"];
	_offset = ((_slot_entry select mounted_slot_offset) select mounted_slot_offset_data);
	_heading = ((_slot_entry select mounted_slot_heading) select mounted_slot_heading_data);
	_blocked_actions = (_slot_entry select mounted_slot_blocked_actions);
	_blocked_keys = [_blocked_actions] call mounted_keysForActions;
	_default_action = _slot_entry select mounted_slot_default_action;
	_direction_min = _slot_entry select mounted_slot_direction_min;
	_direction_max = _slot_entry select mounted_slot_direction_max;
	_pitch_min = _slot_entry select mounted_slot_pitch_min;
	_pitch_max = _slot_entry select mounted_slot_pitch_max;
	
	
	player groupChat format["_blocked_keys = %1", _blocked_keys];
	[_player, _vehicle, _offset] call mounted_attach;
	[_player, _heading] call mounted_set_heading;
	

	[_player, _default_action] call mounted_set_stance;
	
	_player groupChat format["You have boarded a mounted slot in this vehicle. Use Control + E to exit"];
	
	[_player, "inMountedSlot", true, true] call object_setVariable;
	[_player, "mountedVehicle", _vehicle, true] call object_setVariable;
	[_vehicle, _slot_id, _player] call mounted_set_slot_occupant;
	
	titleText ["", "BLACK OUT", 0.1];
	[_player, _vehicle, _slot_id, _blocked_keys, _default_action] call mounted_setup_keyDown;
	[_player, _vehicle, _slot_id, _blocked_keys, _default_action] call mounted_setup_keyUp;
	[_player, _vehicle, _slot_id, _direction_min, _direction_max, _pitch_min, _pitch_max] call mounted_setup_mouseMoving;
	[_player, _vehicle, _slot_id] call mounted_slot_wait;
	titleText ["", "BLACK IN", 2];
	
};

mounted_unboard_slot = {
	ARGV(0,_player);
	ARGV(1,_vehicle);
	ARGV(2,_slot_id);
	
	private["_unlocked"];
	_unlocked = [_vehicle] call mounted_vehicle_unlocked;
	
	if (not(_unlocked)) exitWith {
		player groupChat format["This vehicle is locked"];
	};
	
	[_player, "inMountedSlot", false, true] call object_setVariable;
	[_player, "mountedVehicle", nil, true] call object_setVariable;

};



mounted_get_slot_occupant = {
	ARGV(0,_vehicle);
	ARGV(1,_slot_id);
	
	if (undefined(_slot_id)) exitWith {null};
	if (typeName _slot_id != "STRING") exitWith {null};
	if (undefined(_vehicle)) exitWith {null};
	
	private["_occupant"];
	_occupant = [_vehicle, _slot_id] call object_getVariable;
	if (typeName _occupant == "OBJECT") then {
		_occupant = if (isNull _occupant) then { nil } else { _occupant };
	};
	
	_occupant
};

mounted_set_slot_occupant = {
	//player groupChat format["_this = %1", _this];
	ARGV(0,_vehicle);
	ARGV(1,_slot_id);
	ARGV(2,_occupant);

	if (undefined(_slot_id)) exitWith {null};
	if (typeName _slot_id != "STRING") exitWith {null};
	if (undefined(_vehicle)) exitWith {null};
	
	private["_occupant"];
	//player groupChat format["typeName _occupant = %1", (typeName _occupant)];
	if (typeName _occupant == "OBJECT") then {
		_occupant = if (isNull _occupant) then { nil } else { _occupant };
	};
	
	//player groupChat format["_vehicle = %1, _slot_id = %2, _occupant = %3", _vehicle, _slot_id, _occupant];
	[_vehicle, _slot_id, _occupant, true] call object_setVariable;
};



mounted_player_inside = {
	//player groupChat format["Checking player inside"];
	ARGV(0,_player);
	ARGV(1,_vehicle);
	if (undefined(_player)) exitWith {false};
	if (undefined(_vehicle)) exitWith {false};
	
	if (((vehicle _player) == _vehicle) && (_vehicle != _player)) exitWith {true};
	
	private["_inMountedSlot"];
	_inMountedSlot = [_player, "inMountedSlot"] call object_getVariable;
	if (undefined(_inMountedSlot)) exitWith {false};
	if (typeName _inMountedSlot != "BOOL") exitWith {false};
	_inMountedSlot
};

mounted_player_get_vehicle = {
	ARGV(0,_player);
	
	private["_vehicle"];
	_vehicle = [_player, "mountedVehicle"] call object_getVariable;

	if (typeName _vehicle == "OBJECT") then {
		_vehicle = if (isNull _vehicle) then { nil } else { _vehicle };
	};
	_vehicle
};

mounted_slot_open = {
	//player groupChat format["_this = %1", _this];
	ARGV(0,_vehicle);
	ARGV(1,_slot_id);
	
	private["_slot_occupant", "_result"];
	_slot_occupant = [_vehicle, _slot_id] call mounted_get_slot_occupant;
	//player groupChat format["_slot_occupant = %1", _slot_occupant];
	_result = (undefined(_slot_occupant));
	_result
};


mounted_vehicle_unlocked = {
	ARGV(0,_vehicle);
	if (undefined(_vehicle)) exitWith {false};
	not((locked _vehicle) == 2)
};


mounted_show_action = {
	ARGV(0,_player);
	ARGV(1,_target);
	ARGV(2,_slot_id);
	ARGV(3,_requires_weapon);
	
	if (not([_target] call mounted_vehicle_unlocked)) exitWith {false};
	if (not([_target, _slot_id] call mounted_slot_open)) exitWith {false};
	if ([_player, _target] call mounted_player_inside) exitWith {false};
	
	private["_has_weapon_hands"];
	
	//some of the slots requrie that the player have either a primary or hand-gun weapon in his hands (otherwise they can't get into the needed stance)
	private["_current_weapon"];
	_current_weapon = currentWeapon _player;
	_has_weapon_hands = ((_current_weapon != "") && {_current_weapon == (primaryWeapon player) || {_current_weapon == (handgunWeapon player)}});
	if (_requires_weapon && not(_has_weapon_hands)) exitWith {false};
	true
};

mounted_add_actions = {
	//player groupChat format["mounted_add_actions %1", _this];
	ARGV(0,_vehicle);
	//player groupChat format["Adding actions!"];
	if (undefined(_vehicle)) exitWith {null};
	
	private["_class"];
	_class =  typeOf _vehicle;
	
	private["_entry"];
	_entry = [_class] call mounted_lookup_class;
	if (undefined(_entry)) exitWith {null};
	
	
	private ["_has_mounted_actions"];
	private["_actions_variable"];
	_actions_variable = format["has_mounted_actions_%1", (getPlayerUID player)]; 
	
	_has_mounted_actions = [_vehicle, _actions_variable] call object_getVariable;
	if (undefined(_has_mounted_actions)) then { _has_mounted_actions = false;}; 
	if (_has_mounted_actions) exitWith {null};
	
	private["_display_name"];
	_display_name =  getText (configFile >> "CfgVehicles" >> _class >> "displayName");
	//player groupChat format["_display_name = %1", _display_name];
	
	private["_slots"];
	
	_slots = _entry select mounted_slots;
	
	{
		private["_slot_id", "_slot_name", "_slot", "_requires_weapon"];
		_slot = _x;
		_slot_id = _slot select mounted_slot_id;
		_slot_name = _slot select mounted_slot_text;
		_requires_weapon = _slot select mounted_slot_requires_weapon;
		//player groupChat format["_slot_id = %1, _slot_name = %2", _slot_id, _slot_name];
		_vehicle addAction [format['<t color="#dddd00">Get in %1%2</t>', _display_name, _slot_name], "noscript.sqf", format['[_this select 1, _this select 0, "%1"] call mounted_board_slot;', _slot_id], 1, false, true,"", format['private["_show"]; _show = [_this, _target, "%1", %2] call mounted_show_action; _show', _slot_id, _requires_weapon]];
	} foreach _slots;
	

	_has_mounted_actions = true;
	[_vehicle, _actions_variable, _has_mounted_actions] call object_setVariable;
};

mounted_keysForActions = {
	ARGV(0,_actions);
	if (undefined(_actions)) exitWith {[]};
	if (typeName _actions != "ARRAY") exitWith {[]};
	
	private["_keys"];
	_keys = [];
	{
		private["_action"];
		_action = _x;
		if (true) then {
			if (undefined(_action)) exitWith {null};
			if (typeName "_action" != "STRING") exitWith {null};
			_keys = _keys + (actionKeys _action);
		};
	} foreach _blocked_actions;
	_keys
};

mounted_keyUpHandler = {
	//player groupChat format["mounted_keyUpHandler %1", _this];
	ARGV(1,_data);
	ARGV(0,_this);
	
	ARGV(0,_display);
	ARGV(1,_key);
	ARGV(2,_shift);
	ARGV(3,_control);
	ARGV(4,_alt);
	
	private["_player", "_vehicle", "_slot_id"];
	
	_player = _data select 0;
	_vehicle = _data select 1;
	_slot_id = _data select 2;
	_blocked_keys = _data select 3;

	_data = [_player, _vehicle, _slot_id];
		
	if (_key in _blocked_keys) exitWith {
		true
	};
	
	if (_key in mounted_diallowed_keys) exitWith {
		true
	};
	
	false
};


mounted_keyDownHandler = {
	//player groupChat format["_this = %1", _this];
	ARGV(1,_data);
	ARGV(0,_this);
	
	ARGV(0,_display);
	ARGV(1,_key);
	ARGV(2,_shift);
	ARGV(3,_control);
	ARGV(4,_alt);
	
	private["_player", "_vehicle", "_slot_id", "_same_key", "_same_key_time_difference", "_default_stance"];
	
	_player = _data select 0;
	_vehicle = _data select 1;
	_slot_id = _data select 2;
	_blocked_keys = _data select 3;
	_default_stance = _data select 4;
	
	_data = [_player, _vehicle, _slot_id];
		
	if (_key in _blocked_keys) exitWith {
		true
	};
	
	if (_key == DIK_E && _control) then {
		if (speed _vehicle > 30) exitWith {
			player groupChat format["%1-%2, you cannot exit the vehicle. It's moving too fast", _player, (name _player)];
		};
		_data call mounted_unboard_slot;
	};
	
	if (_key in (actionKeys "ReloadMagazine")) then {
		reload _player;
	};
	
	if (_key in mounted_passthrough_keys) exitWith {
		false;
	};
	
	if (_key in mounted_diallowed_keys) exitWith {
		true
	};
	
	false
};


mounted_setup_keyDown = {
	private["_data"];
	_data = _this;
	
	disableSerialization;
    _display = findDisplay 46;
	if ( undefined(mounted_keyDownHandler_id) ) then {
		mounted_keyDownHandler_id = _display displayAddEventHandler  ["keyDown", format["[_this, %1] call mounted_keyDownHandler", _data]];
	};
};

mounted_remove_keyDown = {
	disableSerialization;
    _display = findDisplay 46;
	if (not(undefined(mounted_keyDownHandler_id))) then {
		_display displayRemoveEventHandler  ["keyDown", mounted_keyDownHandler_id];
		mounted_keyDownHandler_id = null;
	};
};





mounted_setup_keyUp = {
	private["_data"];
	_data = _this;
	
	disableSerialization;
    _display = findDisplay 46;
	if ( undefined(mounted_keyUpHandler_id) ) then {
		mounted_keyUpHandler_id = _display displayAddEventHandler  ["keyUp", format["[_this, %1] call mounted_keyUpHandler", _data]];
	};
};

mounted_remove_keyUp = {
	disableSerialization;
    _display = findDisplay 46;
	if (not(undefined(mounted_keyUpHandler_id))) then {
		_display displayRemoveEventHandler  ["keyUp", mounted_keyUpHandler_id];
		mounted_keyUpHandler_id = null;
	};
};


mounted_mouseMoving_handler = {
	ARGV(1,_data);
	ARGV(0,_this);
	
	ARGV(1,_mouse_delta);
	ARGV(2,_mouse_y_delta);
	
	//player groupChat format["_mouse_y_delta = %1", _mouse_y_delta];
	private["_player", "_vehicle", "_slot_id", "_r_delta", "_y_delta"];
	_r_delta = abs(_mouse_delta);
	_y_delta = abs(_mouse_y_delta);
	_player = _data select 0;
	
	if (dialog) exitWith {null};
	if (lookingAround) exitWith {null};
	
	if ([_player] call camera_enabled) exitWith {null};
	
	private ["_direction", "_heading", "_direction_min", "_direction_max", "_angle_min", "_angle_max"];
	
	_direction_min = _data select 3;
	_direction_max = _data select 4;
	_pitch_min = _data select 5;
	_pitch_max = _data select 6;
		
	_heading = [_player, "heading"] call object_getVariable;
	if (undefined(_heading)) then {
		_heading = [(getDir _player),0,0];
		[_player, "heading", _heading] call object_setVariable;
	};

	_direction = _heading select 0;
	//player groupChat format["_direction = %1", _direction];

	private["_changed"];
	_changed = false;
	
	if (_mouse_delta >= 0) then {
		_direction = _direction + _r_delta;
		
		if (_direction >= _direction_max) then {
			_direction = _direction_max;
		};
		
		if (_direction > 360 ) then {
			_direction = (_direction - 360);
		};
		_heading set[0, _direction];
		[_player, "heading", _heading] call object_setVariable;
		_changed = true;
	};
	
	if (_mouse_delta <= 0) then {
		_direction = _direction - _r_delta;
		
		if (_direction <= _direction_min) then {
			_direction = _direction_min;
		};
		
		if ( _direction < 0 ) then {
			_direction = 360 + _direction;
		};
		_heading set [0, _direction];
		[_player, "heading", _heading] call object_setVariable;
		_changed = true;
	};

	
	private["_pitch"];
	_pitch = _heading select 1;
	if (undefined(_pitch)) then {
		_pitch = 45;
	};
	
	if (_mouse_y_delta < 0) then {
		_pitch = _pitch + abs(_mouse_y_delta);
		
		if (_pitch >= _pitch_max) then {
			_pitch = _pitch_max;
		};
		
		_heading set [1, _pitch];
		[_player, "heading", _heading] call object_setVariable;
		_changed = true;
	};
	
	if (_mouse_y_delta > 0) then {
	
		if (_pitch <= _pitch_min) then {
			_pitch = _pitch_min;
		};
		
		_pitch = _pitch - abs(_mouse_y_delta);
		_heading set [1, _pitch];
		[_player, "heading", _heading] call object_setVariable;
		_changed = true;
	};
	
	if (_changed) then {
		[_player, _heading] call mounted_set_heading;
	};
	
	false
};

	   
mounted_setup_mouseMoving = {
	private["_data"];
	_data = _this;
	disableSerialization;
    _display = findDisplay 46;
	if ( undefined(mounted_mouseMoving_id) ) then {
		mounted_mouseMoving_id = _display displayAddEventHandler  ["mouseMoving", format["[_this, %1] call mounted_mouseMoving_handler", _data]];
	};
};

mounted_remove_mouseMoving = {
	disableSerialization;
    _display = findDisplay 46;
	if (not(undefined(mounted_mouseMoving_id))) then {
		_display displayRemoveEventHandler  ["mouseMoving", mounted_mouseMoving_id];
		mounted_mouseMoving_id = null;
	};
};

mounted_actions_init = if (undefined(mounted_actions_init)) then { [] } else {mounted_actions_init};

//player groupChat format["mounted_actions_init = %1", mounted_actions_init];
{
	private["_vehicle_name", "_vehicle"];
	_vehicle_name = _x;
	_vehicle = missionNamespace getVariable [_vehicle_name, null];
	if ([_vehicle] call vehicle_exists) then {
		[_vehicle] call mounted_add_actions;
	};
} forEach mounted_actions_init;


mounted_vehicles_functions = false;
