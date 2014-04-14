#include "Awesome\Functions\macro.h"

if (not(undefined(client_loop_functions_defined))) exitWith {null};

liafu = true;

player_is_armed = false;
check_armed_player = {
	ARGV(0,_player);

	if ((primaryWeapon _player) != "") exitWith {true};
	if ((secondaryWeapon _player) != "") exitWith {true};
	
	//check if player is gunner
	private["_vehicle", "_in_vehicle", "_is_commander", "_is_driver", "_is_gunner"];
	_vehicle = (vehicle _player);
	_is_driver = (driver(_vehicle) == _player);
	_in_vehicle = (_vehicle != _player);
	_is_commander = (commander(_vehicle) == _player) && not(_is_driver);
	_is_gunner = (gunner(_vehicle) == _player);
	if (_in_vehicle && (_is_gunner || _is_commander))  exitWith { true };
	
	//Check if player has a suicide vest or similar bomb
	private["_armed_items"];
	//Remote bomb, timed bomb, activated bomb (ied), speed bomb, suicide vest, lighter
	_armed_items = ["fernzuenderbombe", "zeitzuenderbombe", "aktivierungsbombe", "geschwindigkeitsbombe", "selbstmordbombe", "lighter"];
	if([_player, _armed_items] call inventory_has_item) exitWith { true };
	
	//check if player has pistol
	private["_weapon"];
	_weapon = (currentWeapon _player);
	if ([_weapon, "GrenadeLauncher"] call shop_weapon_inherits_from) exitWith { true }; //Throw (Grenades), Put (IEDs)
	if ([_weapon, "PistolCore"] call shop_weapon_inherits_from) exitWith { true };
	if (call holster_pistol_in_inventory) exitWith { true };
	false;
};

check_armed_mounted = {
	ARGV(0,_vehicle);
	
	//check if the vehicle has a mounted player with a weapon
	private["_occupants"];
	_occupants = [_vehicle] call mounted_get_occupants;
	//player groupChat format["_occupants = %1", _occupants];
	private["_armed_occupant"];
	_armed_occupant = null;
	
	{
		private["_occupant"];
		_occupant = _x;
		if (([_occupant] call check_armed_player)) exitWith {
			_armed_occupant = _occupant;
		};
	} forEach _occupants;
	
	not(undefined(_armed_occupant))
};


check_armed_vehicle = {	
	ARGV(0,_player);
	
	private["_in_vehicle", "_horns", "_vehicle"];
	_vehicle = (vehicle _player);
	_in_vehicle = (_vehicle != _player);
	
	if (not(_in_vehicle)) then {
		_vehicle = [_player] call mounted_player_get_vehicle;
	};
	
	if (undefined(_vehicle)) exitWith {false};
	
	//check if the vehicle has a weapon
	private["_weapon"];
	_weapon = currentWeapon _vehicle;
	if ([(currentWeapon _vehicle), "CarHorn"] call shop_weapon_inherits_from) exitWith { false };
	
	([_vehicle] call check_armed_mounted)
};

check_armed_stunning = {
	ARGV(0,_player);
	
	if (undefined(was_stunning_count)) then { was_stunning_count = 0; };
	if (undefined(stunning) ) then { stunning = false;};
	if (undefined(was_stunning)) then { was_stunning = false;};
	
	private["_delay"];
	_delay = 30;
	//Delayed check for player stunning within the last X seconds
	if (stunning) then 	{ 
		was_stunning = true; 
		was_stunning_count = 0;
	}
	else { if ( !stunning && was_stunning) then {
		if (was_stunning_count < _delay) then { was_stunning_count = was_stunning_count + 1;};
		if (was_stunning_count >= _delay) then { was_stunning = false; was_stunning_count = 0;};
	};};
	
	//player groupChat format["STUNNING: %1, WAS STUNNING: %2", stunning, was_stunning];
	was_stunning
};

check_armed = {
	ARGV(0,_player);
	
	if (undefined(_player)) exitWith { false };
	if (not(alive _player)) exitWith {false};
	
	private["_armed_vehicle", "_armed_player"];
	_armed_vehicle = ([_player] call check_armed_vehicle);
	_armed_player =  ([_player] call check_armed_player);
	_was_stunning = ([_player] call check_armed_stunning);
	
	//player groupChat format["_armed_vehicle = %1, _armed_player = %2, _was_stunning = %3", _armed_vehicle, _armed_player, _was_stunning];
	
	private["_armed"];
	_armed = _armed_vehicle || _armed_player || _was_stunning;
	[_player, _armed] call player_update_armed;
	[_player, "armed", _armed] call object_setVariable;
	_armed
};



compare_array = {
	ARGV(0,_a);
	ARGV(1,_b);
	if (undefined(_a)) exitWith { false };
	if (undefined(_b)) exitWith { false };
	if (typeName _a != "ARRAY") exitWith {false};
	if (typeName _b != "ARRAY") exitWith {false};
	if (count _a != count _b) exitWith {false};
	
	private["_i"];
	_i = (count _a) - 1;
	while {_i >= 0} do {
		if (str(_a select _i) != str(_b select _i)) exitWith { false };
		_i = _i - 1;
	};
	
	(_i == -1)
};


check_keychain = {
	private["_player"];
	_player = player;
	if (([_player, "keychain"] call inventory_get_item_amount) == 1) exitWith {null};	
	[_player, "keychain", 1] call inventory_set_item_amount;
};

check_inventory = {
	if (not(alive player)) exitWith {null};
	
	private["_player"];
	_player = player;
	
	call check_keychain;
};


cop_stun_gun_modify = {
	if (!iscop) exitWith {null};
	if((player ammo (currentWeapon player)) <= 0) exitWith {null};
	if (not(alive player)) exitWith {null};
	
	if ((((currentWeapon player) == "M9" || (currentWeapon player) == "M9SD")) && ((currentMagazine player) == ("15Rnd_9x19_M9SD"))) then {	
		_magazines = magazines player;
		_magazines_count = {_x == "15Rnd_9x19_M9SD"} count (_magazines);
		_ammo = player ammo (currentWeapon player);
				
		if (_ammo > stunshotsmax) then {
			{
				if (_x == "15Rnd_9x19_M9SD") then {
					player removeMagazine _x;
				};
			} forEach _magazines;
						
			for [{_c=0}, {_c < (_magazines_count)}, {_c=_c+1}] do {
				player addMagazine ["15Rnd_9x19_M9SD", stunshotsmax];
			};
		};
	};	
};

check_money = {
	private ["_player", "_money"];
	_player = player;
	
	_money = [player, 'money'] call inventory_get_item_amount;
	if (_money < 0) then {
		[_player, 'money', 0] call inventory_set_item_amount; 
		_money = 0;
	};
		
	if (_money > money_limit) then {
		[_player, 'money', money_limit] call inventory_set_item_amount; 
		player groupChat format["You can't carry more than $%1 in your inventory. Money was removed.", strM(money_limit)];
	}; 
};

check_bank = {
	private ["_bank_account", "_player"];
	_player = player;
	_bank_account = [_player] call bank_get_value;
	
	if (_bank_account > bank_limit) exitWith {
		[_player, bank_limit] call bank_set_value; 
		player groupChat format["You can't have more than $%1 in your bank account. Money has been removed.", strM(bank_limit)];
	};
};

check_actions = {
	private["_vehicle"];
	_vehicle = (vehicle player);
	_in_vehicle = (_vehicle != player);
	if (not(_in_vehicle)) exitWith {null};
		
};

check_factory_actions = {
	//player groupChat format["check_factory_actions"];
	private["_player"];
	_player = player;
	private["_vehicle", "_in_vehicle"];
	_vehicle = (vehicle _player);
	_in_vehicle = (_vehicle != _player);
	
	private["_factory"];
	_factory = [_player, 5] call factory_player_near;
	//player groupChat format["_factory = %1",_factory];
	if (undefined(_factory) || not(INV_shortcuts) || _in_vehicle || not(alive _player)) exitWith {
		[_player] call factory_remove_actions;
	};
	
	private["_factory_id"];
	_factory_id = _factory select factory_id;
	
	[_player, _factory_id] call factory_add_actions;
};


check_lotto_actions = {
	//player groupChat format["check_lotto_actions"];
	private["_player"];
	_player = player;
	private["_vehicle", "_in_vehicle"];
	_vehicle = (vehicle _player);
	_in_vehicle = (_vehicle != _player);
	
	private["_lotto"];
	_lotto = [_player, 2] call lotto_player_near;
	//player groupChat format["_lotto = %1",_lotto];
	if (undefined(_lotto) || not(INV_shortcuts) || _in_vehicle || not(alive _player)) exitWith {
		[_player] call lotto_remove_actions;
	};
	
	private["_lotto_id"];
	_lotto_id = _lotto select lotto_data_id;
	[_player, _lotto_id] call lotto_add_actions;
};



check_prison_actions = {
	//player groupChat format["check_lotto_actions"];
	private["_player"];
	_player = player;
	private["_vehicle", "_in_vehicle"];
	_vehicle = (vehicle _player);
	_in_vehicle = (_vehicle != _player);
	
	private["_prison"];
	_prison = [_player, 2] call prison_player_near;
	//player groupChat format["_prison = %1",_prison];
	if (undefined(_prison) || not(INV_shortcuts) || _in_vehicle || not(alive _player)) exitWith {
		[_player] call prison_remove_actions;
	};
	
	private["_prison_id"];
	_prison_id = _prison select prison_data_id;
	[_player, _prison_id] call prison_add_actions;
};

check_license_actions = {
	//player groupChat format["check_license_actions %1", _this];
	private["_player"];
	_player = player;
	private["_vehicle", "_in_vehicle"];
	_vehicle = (vehicle _player);
	_in_vehicle = (_vehicle != _player);
	
	private["_license_vendor"];
	_license_vendor = [_player, 2.5] call license_player_near;
	//player groupChat format["_license_vendor = %1", _license_vendor];
	if (undefined(_license_vendor) || not(INV_shortcuts) || _in_vehicle || not(alive _player)) exitWith {
		[_player] call license_remove_actions;
	};
	
	[_player, _license_vendor] call license_add_actions;
};

check_gang_area_actions = {
	private["_player"];
	_player = player;
	private["_vehicle", "_in_vehicle"];
	_vehicle = (vehicle _player);
	_in_vehicle = (_vehicle != _player);
	
	private["_gang_area"];
	_gang_area = [_player, 5] call gang_area_player_near;
	if (undefined(_gang_area) || not(INV_shortcuts) || _in_vehicle || not(alive _player)) exitWith {
		[_player] call gang_area_remove_actions;
	};

	[_player, _gang_area] call gang_area_add_actions;
};

check_workplaces = {
	{
		private["_workplace", "_object", "_radius"];
		_workplace = _x;
		_object = _workplace select workplace_object;
		_radius = _workplace select workplace_radius;
		if ((player distance _object) < _radius) then {
			timeinworkplace = timeinworkplace + 1;
		};
	} forEach workplacearray;
};


logics_check_object = 0;
logics_check_warn_distance = 1;
logics_check_teleport_distance = 2;

//used to keep players out fo certain restricted zones
logics_checks = [
	//[someeditorlogicid, 300, 300]
];

check_logics = {
	private["_alive"];
	_alive = alive player;
	
	if (not(_alive)) exitWith {null};

	{
		private["_entry", "_cdistance", "_logic", "_warn_distance", "_teleport_distance"];
		_entry = _x;
		
		_warn_distance = _entry select logics_check_warn_distance;
		_teleport_distance = _entry select logics_check_teleport_distance;
		_logic = _entry select logics_check_object;
		_distance = player distance _logic;
		
		
		if (_distance <= _teleport_distance) exitWith {
			[player] call player_teleport_spawn;
			player groupChat format["You have been teleported out of a restricted zone"];
		};
		
		if (_distance < _warn_distance) exitWith {
			titleText ["You are entering a restricted zone. Turn around!", "plain"]
		};
		
	} forEach logics_checks;
};




check_camera = {
	if (undefined(admin_camera_on)) then {	admin_camera_on = false; };
};

bases_check_faction_bool = 0;
bases_check_trigger_area = 1;
bases_check_teleport_height = 2;
bases_check_teleport_marker = 3;
bases_check_teleport_message = 4;

bases_checks = [
//	["isins", "ins_area_1", 20, "telehesnotins", "You were teleported out of the Insurgent base!"],
//	["isopf", "opfor_area_1", 20, "telehesnottla", "You were teleported out of the TLA base!"],
	["iscop", "blufor_area_1", 20, "telehesnotcop", "You were teleported out of the Police base!"]
];

check_bases = {
	private["_vehicle"];
	_vehicle = vehicle player;
	if (admin_camera_on) exitWith {null};
	
	{
		private["_base_check", "_faction_bool", "_trigger_area", "_teleport_height", "_teleport_marker", "_teleport_message"];
		_base_check = _x;
		
		_faction_bool = missionNamespace getVariable (_base_check select bases_check_faction_bool);
		_trigger_area = missionNamespace getVariable (_base_check select bases_check_trigger_area);
		_teleport_height = _base_check select bases_check_teleport_height;
		_teleport_marker = _base_check select bases_check_teleport_marker;
		_teleport_message = _base_check select bases_check_teleport_message;
		
		private["_altitude"];
		_altitude = (getPosATL _vehicle) select 2;
		
		if (_vehicle in (list _trigger_area) && (_altitude < _teleport_height) && not(_faction_bool)) exitWith {
			_vehicle setVelocity [0,0,0];
			_vehicle setPos (getMarkerPos _teleport_marker);
			player groupChat _teleport_message;
		};
	} forEach bases_checks;
};


check_static_weapons = {
	private["_vehicle","_isStatic"];
	_vehicle = (vehicle player);
	_isStatic = (_vehicle isKindOf "StaticWeapon");
	if (not(_isStatic)) exitWith {null};
	
	_vehicle lock false;
};

check_smoke_grenade = {
	private["_flashed"];
	_flashed = [player, "flashed"] call object_getVariable;
	
	if (undefined(_flashed)) exitWith {null};
	if (typeName _flashed != "BOOL") exitWith {null};
	if (not(_flashed)) exitWith {null};
	
	private ["_mask", "_fadeInTime", "_fadeOutTime"];
	
	_mask = [player, "gasmask"] call object_getVariable;
	_mask = if (undefined(_mask)) then { false } else { _mask };
	_mask = if (typeName "_mask" != "BOOL") then { false } else { _mask };
	
	[player, "gasmask", _mask, true] call object_setVariable;
	if (_mask) exitWith {null};
	
	[] spawn {
		private ["_fadeInTime", "_fadeOutTime"];
		_fadeInTime   = 1;
		_fadeOutTime  = 5;
		if (not(alive player)) exitWith {null};
		titleCut ["","WHITE OUT",0];
		sleep _fadeOutTime;
		titleCut ["","WHITE IN",0];
		sleep _fadeInTime;
		[player, "flashed", false, true] call object_setVariable;
	};
};




check_drag_actions = {
	private["_player"];
	_player = player;
	
	private["_visual_target", "_active_target", "_held_object"];
	
	_visual_target = nearCursorTarget;
	_active_target = [_player, "active_target", objNull] call object_getVariable;
	_held_object = [_player, "held_target", objNull] call object_getVariable;
	
	//player is already holding an object
	if (not(isNull _held_object)) exitWith {};
	
	//the object the player is looking at, is already active as an action
	if (not(isNull _visual_target) && {(_visual_target == _active_target) && {(_player distance _active_target) < 2}}) exitWith {};

	
	[_player] call drag_remove_action;	
	[_player, _visual_target] call drag_add_action;
};





check_restrains = {
	//if (iscop) exitWith {null};
	
	private["_player"];
	_player = player;
	
	if (not(alive _player)) exitWith {null};

	private["_physicallyRestrained", "_logicallyRestrained"];
	//player groupChat format["%1", (animationState _player) ];
	_physicallyRestrained = (restrained_animations find ((animationState _player)) >= 0);
	_logicallyRestrained = [_player, "restrained"] call player_get_bool;
	
	//player groupChat format["_logicallyRestrained = %1", _logicallyRestrained];
	//player groupChat format["_physicallyRestrained = %1", _physicallyRestrained];
	
	if (_logicallyRestrained && not(_physicallyRestrained)) then {
		if ([_player, (vehicle _player)] call mounted_player_inside) exitWith {
			if (not([_player, 50] call player_near_cops)) exitWith {
				[_player, "restrained", false] call player_set_bool;
				_player groupChat format["You have managed to unrestrain yourself!"];
			};
		};
		//[[_player], "player_restrained_animation", true] call BIS_fnc_MP;
		[[_player], "player_restrained_animation", true] call BIS_fnc_MP;
	}
	else { if (not(_logicallyRestrained) && _physicallyRestrained) then {
		[[_player], "player_unrestrained_animation", true] call BIS_fnc_MP;
	}
	else { if (_logicallyRestrained && _physicallyRestrained) then {
		if ([_player, (vehicle _player)] call mounted_player_inside) then {
			[[_player], "player_unrestrained_animation", true] call BIS_fnc_MP;
		};
	}
	else { if (_logicallyRestrained || _physicallyRestrained) then {
		player groupChat format["Checking!"];
		if (not([_player, 50] call player_near_cops)) then {
			[_player, "restrained", false] call player_set_bool;
			_player groupChat format["You have managed to unrestrain yourself!"];
		};
	};};};};
};


check_respawn_time = {
	if (not(alive player)) exitWith {null};
	private["_interval"];
	_interval = 30;
	if (not((time % _interval) == 0)) exitWith {null};
	[player, "extradeadtime", -(_interval)] call player_update_scalar;
	
};


cached_gear = "";
check_gear = {
	//player groupChat format["check_gear %1", _this];
	private["_player"];
	_player = player;
	if (not(alive _player)) exitWith {null};
	
	private["_gear"];
	_gear = [_player] call player_get_gear;
	//keep the clone's gear in sync
	if (str(_gear) != cached_gear) then {
		[_player, "cached_gear", _gear, true] call object_setVariable;
		cached_gear = str(_gear);
	};
};

//make sure player has a radio at all times
check_base_items = {
	private["_player"];
	_player = player;
	if (not(alive _player)) exitWith {};

	private["_assigned_items", "_item"];
	_assigned_items = assignedItems _player;
	if (undefined(_assigned_items)) exitWith {};
	
	_item = "ItemRadio";
	if (not(_item in _assigned_items)) then {
		_player linkItem _item;
	};
	
	_item = "ItemMap";
	if (not(_item in _assigned_items)) then {
		_player linkItem _item;
	};
	
	_item = "ItemCompass";
	if (not(_item in _assigned_items)) then {
		_player linkItem _item;
	};
};


check_house = {
	private["_player"];
	_player = player;
	
	private["_house"];
	_house = [_player] call house_player_near;
	if (undefined(_house) || {not(INV_shortcuts) || {not(alive _player)}}) exitWith {
		[_player] call house_remove_actions;
	};
	
	[_player,_house] call house_doors_disable;
	[_player, _house] call house_add_actions;
};

check_bunker = {
	//player groupChat format["check_bunker %1", _this];
	private["_player"];
	_player = player;
	
	private["_bunker"];
	_bunker = [_player] call bunker_player_near;
	
	if (undefined(_bunker) || {not(INV_shortcuts) || {not(alive _player)}}) exitWith {
		[_player] call bunker_remove_actions;
	};
	
	[_player, _bunker] call bunker_add_actions;
};



check_towing = {
	private["_player"];
	_player = player;
	
	private["_towing"];
	_towing = [_player] call towing_player_near;
	
	if (undefined(_towing) || {not(INV_shortcuts) || {not(alive _player)}}) exitWith {
		[_player] call towing_remove_actions;
	};
	
	[_player, _towing] call towing_add_actions;
};

check_towed = {
	private["_player"];
	_player = player;
	
	private["_towed"];
	_towed = [_player] call towed_player_near;
	
	if (undefined(_towed) || {not(INV_shortcuts) || {not(alive _player)}}) exitWith {
		[_player] call towed_remove_actions;
	};
	
	[_player, _towed] call towed_add_actions;
};

check_near_objects = {
	private["_player"];
	_player = player;
	{
		_player reveal _x;
	} forEach(nearestObjects [player, ["AllVehicles", "Static"], 3]);	
};

check_input = {
	private["_player"];
	_player = player;
	disableUserInput false;
	_player enableSimulation true;
};

check_vehicle_outside_actions = {
	//player groupChat format["check_vehicle_outside_actions"];
	private["_player"];
	_player = player;
	private["_vehicle", "_in_vehicle"];
	_vehicle = (vehicle _player);
	_in_vehicle = (_vehicle != _player);
	
	private["_vehicle"];
	_target_vehicle = [_player, 3.5] call vehicle_outside_player_near;
	//player groupChat format["_target_vehicle = %1",_target_vehicle];
	if (undefined(_target_vehicle) || not(INV_shortcuts) || _in_vehicle || not(alive _player)) exitWith {
		[_player] call vehicle_outside_remove_actions;
	};
	
	[_player, _target_vehicle] call vehicle_outside_add_actions;
};



check_player_actions = {

};

check_plant_actions = {
	//player groupChat format["check_plant_actions"];
	private["_player"];
	_player = player;
	private["_vehicle", "_in_vehicle"];
	_vehicle = (vehicle _player);
	_in_vehicle = (_vehicle != _player);
	
	private["_plant_netid"];
	_plant_netid = [_player, 5] call plant_player_near;
	if (undefined(_plant_netid) || not(INV_shortcuts) || _in_vehicle || not(alive _player)) exitWith {
		[_player] call plant_remove_actions;
	};
	[_player, _plant_netid] call plant_add_actions;
};

client_loop = {
	private ["_client_loop_i"];
	_client_loop_i = 0; 

	while {_client_loop_i < 5000} do {
		call check_gear;
		call check_money;
		call check_bank;
		call check_actions;
		call check_factory_actions;
		call check_license_actions;
		call check_gang_area_actions;
		call check_lotto_actions;
		call check_prison_actions;
		call check_inventory;
		call cop_stun_gun_modify;
		call check_workplaces;
		call check_base_items;
		call check_logics;
		call check_camera;
		call check_bases;
		call check_static_weapons;
		call check_respawn_time;
		call check_smoke_grenade;
		call check_drag_actions;
		call check_restrains;
		call check_house;
		call check_bunker;
		call check_input;
		call check_near_objects;
		call check_vehicle_outside_actions;
		call check_player_actions;
		call check_plant_actions;
		//call check_towing;
		//call check_towed;
		sleep 0.5;
		
		_client_loop_i = _client_loop_i + 1;
	};
	[] spawn client_loop;
};


[] spawn client_loop;

client_loop_functions_defined = true;