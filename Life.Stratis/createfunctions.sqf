#include "Awesome\Functions\macro.h"

INV_CreateGunboxLocal = {};

INV_CreateFort_init_handler_persistent = {
	ARGV(0,_object);
	ARGV(1,_object_name);
	
	if (undefined(_object)) exitWith {};
	if (undefined(_object_name)) exitWith {};
	if (typeName _object != "OBJECT") exitWith {};
	if (isNull _object) exitWith {};
	if (undefined(_object_name)) exitWith {};
	if (typeName _object_name != "STRING") exitWith {};
	
	
	missionNamespace setVariable [_object_name, _object];
};

INV_CreateFort_init_handler = {
	ARGV(0,_object);
	if (not([_object] call A_object_fnc_exists)) exitWith {null};
	_object lock false;
};

INV_CreateFort = {
	_this spawn {
		private ["_class", "_kind", "_logic", "_vehicle", "_vehicle_name"];
		_logic = _this select 0;
		_class = _this select 1;
		_kind = _this select 2;	
		if (not(alive player)) exitWith {null};
		liafu = true;
		_vehicle = createVehicle [_class, (getPosATL _logic), [], 0, "NONE"];
		
		switch _kind do {
			case "Static" do {
				_vehicle_name = format["%1_%2_%3", _kind, player, round(time)];
				//[[_vehicle, _vehicle_name], "INV_CreateFort_init_handler_persistent", true, true] spawn BIS_fnc_MP;
				[[_vehicle, _vehicle_name], "INV_CreateFort_init_handler_persistent", true, true, _vehicle] spawn A_jip_fnc_register;
				waitUntil {not(isNil _vehicle_name)};
				[[_vehicle], "INV_CreateFort_init_handler", true, false] spawn BIS_fnc_MP;
			};
			case "Fort" do {};
			case "Box" do {
				clearBackpackCargoGlobal _vehicle;
				clearMagazineCargoGlobal _vehicle;
				clearWeaponCargoGlobal _vehicle;
			};
		};
	};
};

INV_CreateWeapon = {
	private["_class", "_amount", "_crate"];
	_class = _this select 0;
	_amount = _this select 1;
	_crate = _this select 2;
	_in_hands = if (count _this > 3) then { _this select 3 } else { false };
	
	if (_in_hands) then {
		player addWeapon _class;
		player action ["switchweapon", player, player, 0];
	}
	else {
		_crate addweaponCargoGlobal [_class,_amount];
	};
};

INV_CreateMag = {
	liafu = true;
	private["_class", "_amount", "_crate"];
	_class = _this select 0;
	_amount = _this select 1;
	_crate = _this select 2;

	_crate addmagazineCargoGlobal [_class,_amount];

};


INV_CreateVest = {
	private["_class", "_amount", "_crate", "_in_hands"];
	
	_class = _this select 0;
	_amount = _this select 1;
	_crate = _this select 2;
	_in_hands = if (count _this > 3) then { _this select 3 } else { false };
	
	if (_in_hands) then {
		player addVest _class;
	}
	else {
		_crate addItemCargoGlobal [_class, _amount];
	};
};

INV_CreateUniform = {
	private["_class", "_amount", "_crate", "_in_hands"];
	
	_class = _this select 0;
	_amount = _this select 1;
	_crate = _this select 2;
	_in_hands = if (count _this > 3) then { _this select 3 } else { false };
	
	if (_in_hands) then {
		player addUniform _class;
	}
	else {
		_crate addItemCargoGlobal [_class, _amount];
	};
};

INV_CreateGoggles = {
	private["_class", "_amount", "_crate", "_in_hands"];
	
	_class = _this select 0;
	_amount = _this select 1;
	_crate = _this select 2;
	_in_hands = if (count _this > 3) then { _this select 3 } else { false };
	
	if (_in_hands) then {
		player addGoggles _class;
	}
	else {
		_crate addItemCargoGlobal [_class, _amount];
	};
};


INV_CreateHeadgear = {
	private["_class", "_amount", "_crate", "_in_hands"];
	
	_class = _this select 0;
	_amount = _this select 1;
	_crate = _this select 2;
	_in_hands = if (count _this > 3) then { _this select 3 } else { false };
	
	if (_in_hands) then {
		player addHeadgear _class;
	}
	else {
		_crate addItemCargoGlobal [_class, _amount];
	};
};

INV_CreateLinkedItem = {
	private["_class", "_amount", "_crate", "_in_hands"];
	
	_class = _this select 0;
	_amount = _this select 1;
	_crate = _this select 2;
	_in_hands = if (count _this > 3) then { _this select 3 } else { false };
	
	if (_in_hands) then {
		player linkItem _class;
	}
	else {
		_crate addItemCargoGlobal [_class, _amount];
	};
};

INV_CreateBISItem = {
	private["_class", "_amount", "_crate", "_in_hands"];
	
	_class = _this select 0;
	_amount = _this select 1;
	_crate = _this select 2;
	_in_hands = if (count _this > 3) then { _this select 3 } else { false };
	
	if (_in_hands) then {
		player addItem _class;
	}
	else {
		_crate addItemCargoGlobal [_class, _amount];
	};
};



INV_CreateAttachment = {
	player groupChat format["INV_CreateAttachment %1", _this];
	private["_class", "_amount", "_crate", "_in_hands"];
	
	_class = _this select 0;
	_amount = _this select 1;
	_crate = _this select 2;
	_in_hands = if (count _this > 3) then { _this select 3 } else { false };
	
	if (_in_hands) then {
		[player, _class] call A_bis_expected_fnc_addWeaponItem;
	}
	else {
		_crate addItemCargoGlobal [_class, _amount];
	};
};

INV_CreatePack = {
	liafu = true;
	private["_class", "_amount", "_crate"];
	_class = _this select 0;
	_amount = _this select 1;
	_crate = _this select 2;
	_in_hands = if (count _this > 3) then { _this select 3 } else { false };
	

	if (_in_hands) then {
		player addBackpack _class;
	}
	else {
		_crate addBackpackCargoGlobal [_class, _amount];
	};
	
	//remove the backpack's contents 
	[] spawn {
		sleep 1;
		private["_backpack"];
		_backpack = unitBackpack player;
		if (undefined(_backpack)) exitWith {null};
		clearWeaponCargoGlobal _backpack;
		clearMagazineCargoGlobal _backpack;
	};
};


INV_CreateItem = {
	liafu = true;
	private["_object", "_class", "_amount", "_storage"];
	_object = _this select 0;
	_class = _this select 1;
	_amount = _this select 2;
	_storage = _this select 3;
	[_object, _class, _amount, _storage] call A_inventory_fnc_storage_add_item;
};



INV_LocateClosestVehicle = {
	private["_i", "_list", "_vehicle", "_distance"];
	_distance = _this select 0;
	if (undefined(_distance)) exitWith {null};
	if (typeName _distance != "SCALAR") exitWith {null};
	
	_list = nearestObjects [player, ["LandVehicle", "Air"], _distance];
	//player groupChat format["_list = %1", _list];
	_i = (count _list - 1);
	_vehicle = null;
	while { _i >= 0 } do {
		private["_current", "_found"];
		_current = _list select _i;
		//player groupChat format["_current = %1", _current];
		if (alive(_current) && ([_current] call A_vehicle_fnc_player_owned)) then {
			_vehicle = _current;
		};
		_i = _i - 1;
	};
	
	_vehicle
};
