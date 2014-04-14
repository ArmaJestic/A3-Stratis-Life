#include "macro.h"


stun_agony_recieve = {_this spawn {
	ARGV(0,_player);
	if (undefined(_player)) exitWith {};
	
	if ([_player] call is_prone) exitWith {};
	
	if (_player getVariable ["agony_active", false]) exitWith {};
	_player setVariable ["agony_active", true];
	
	playSound3D ["a3\sounds_f\characters\movements\bodyfalls\bodyfall_concrete_3.wss", _player];
	playSound3D [format["a3\sounds_f\characters\human-sfx\Person0\P0_hit_0%1.wss", (floor(random 8) + 1)], _player];

	_player switchMove "aparpercmstpsnonwnondnon_amovppnemstpsnonwnondnon";
	sleep 3;
	_player setVariable ["agony_active", false];
};};

stun_agony = {
	ARGV(0,_player);
	[[_player], "stun_agony_recieve", true, false] call BIS_fnc_MP;
	waitUntil {
		sleep 1;
		(toLower(animationState _player) != toLower("aparpercmstpsnonwnondnon_amovppnemstpsnonwnondnon"))
	};
	
	//playSound3D ["a3\sounds_f\sfx\movements\bodyfalls\bodyfall_concrete_3.wss", _player];
	
	_player playMoveNow "unconscious";
};

stun_shot_close = {
	player groupChat format["stun_shot_close %1", _this];
	ARGV(0,_unit);
	ARGV(1,_shooter);
	ARGV(2,_selection);
	ARGV(3,_damage);
	ARGV(4,_armor);
	ARGV(5,_veh);
	ARGV(6,_inveh);
	ARGV(7,_distance);
	

	if (_inveh) then {
		_unit action ["eject", _veh];
		sleep 0.01;
	};
	
	[_unit, StunTimePerHit] spawn stun_effects_full;
};


stun_shot_far = {
	player groupChat format["stun_shot_far %1", _this];
	ARGV(0,_unit);
	ARGV(1,_shooter);
	ARGV(2,_selection);
	ARGV(3,_damage);
	ARGV(4,_armor);
	ARGV(5,_veh);
	ARGV(6,_inveh);
	ARGV(7,_distance);
	
	[[_unit, _shooter], "stun_announce", true, false] call BIS_fnc_MP;
	
	_armor = [_unit, "stun_armor"] call object_getVariable;
	
	if (undefined(_armor)) then {
		[_unit, "stun_armor", "none", true] call object_setVariable;
		_armor = [_unit, "stun_armor"] call object_getVariable;
	};
	
	//stun armor only protects at long range
	if (not(_armor == "none")) exitWith {};
	
	[_unit, StunTimePerHit] spawn stun_effects_light;
};


stun_pistol_hit = {
	ARGV(0,_unit);
	ARGV(1,_man);
	ARGV(2,_time);

	[_unit, _man] call stun_annouce_hit;
	[_man, _time] spawn stun_effects_light;
};


stunning = false;
stun_pistol = { _this spawn {
	ARGV(0,_unit);
	ARGV(1,_man);
	
	if (stunning) exitWith {null};
	stunning = true;
	
	format['%1 switchmove "AwopPercMstpSgthWnonDnon_end";',_unit] call broadcast;
	sleep 0.3;
	if (undefined(_man) || 
		{typeName _man != "OBJECT" || 
		{not(alive _man) || 
		{((_man distance _unit) > 3) || 
		{not([_unit, _man] call is_facing)}}}}) exitWith {stunning = false};
	
	_dir = [_unit, _man] call is_frontback;
	
	if (_dir == "front") then {
		[_unit, _man] call stun_pistol_front;
	};
	if (_dir == "back") then {
		[_unit, _man] call stun_pistol_back;
	};

	stunning = false;
};};

stun_pistol_front = {
	ARGV(0,_unit);
	ARGV(1,_man);
	
	[[_unit,_man, stunpistolfront], "stun_pistol_hit", _man, false] call BIS_fnc_MP;	
};

stun_pistol_back = {
	ARGV(0,_unit);
	ARGV(1,_man);
	
	[[_unit,_man, stunpistolback], "stun_pistol_hit", _man, false] call BIS_fnc_MP;	
};


stun_annouce_hit = {
	ARGV(0,_unit);
	ARGV(1,_attacker);
	server globalchat format["You were hit by %1-%2", _attacker, name _attacker]
};

stun_announce = {
	if (defined(stun_announcing) && {stun_announcing}) exitWith {};
	
	stun_announcing = true;
	ARGV(0,_unit);
	ARGV(1,_shooter);
	
	if (local _unit) then {
		player groupChat format["You were stunned by %1-%2", _shooter, (name _shooter)];
	}
	else {if (local _shooter) then {
		player groupChat format["You stunned %1-%2", _unit, (name _unit)];
	}
	else {
		player groupChat format["%1-%2 was stunned by %3-%4", _unit, (name _unit), _shooter, (name _shooter)];
	};};
		
	sleep 1;
	stun_announcing = false;
};



blur_time_remaining = 0;
stun_blur_effect_wait = {
	player grouPChat format["stun_blur_effect_wait %1", _this];
	ARGV(0,_unit);
	ARGV(1,_time);
	
	if (defined(blur_time_remaining) && {blur_time_remaining > 0}) exitWith {
		blur_time_remaining = blur_time_remaining +  _time;
	};

	if (undefined(_unit)) exitWith {};
	if (undefined(_time)) exitWith {};
	
	
	blur_time_remaining = _time;
	
	if ([_unit, "restrained", false] call player_get_bool) then {
		[_unit, "restrained", false] call player_set_bool
	};
	
	[_unit, "stunned", true] call player_set_bool;

	private["_camera"];
	_camera = [_unit] call player_camera_create;
	_camera camSetTarget _unit;
	_camera camSetRelPos [1,1,1];
	_camera cameraEffect ["external", "back"];
	_camera camCommit 0;
	

	[_unit] spawn stun_agony;

	waitUntil {
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [10];
		"dynamicBlur" ppEffectCommit 0;
	
		blur_time_remaining = blur_time_remaining - 1;
		blur_time_remaining = blur_time_remaining min MaxStunTime;
		
		
		waitUntil {ppEffectCommitted "dynamicBlur"};
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 1.5;
		playSound3d ["a3\sounds_f\characters\human-sfx\05_heart_1.wss", _unit, true];
		sleep 1;
		if ([_unit, "restrained", false] call player_get_bool) exitWith {true};
		if (not(alive _unit)) exitWith {true};
		(blur_time_remaining <= 0)
	};
	
	blur_time_remaining = 0;
	[_unit] call player_camera_destroy;
	[_unit, "stunned", false] call player_set_bool;
	if (not([_unit, "restrained", false] call player_get_bool)) then {
		_unit playMoveNow "AmovPpneMstpSnonWnonDnon";
	};
};



stun_effects_AI = {
	ARGV(0,_unit);
	ARGV(1,_time);
	
	[[_unit], "stun_drop_weapons", _unit, false] call BIS_fnc_MP; 

	sleep _time;

	format['%1 switchmove "amovppnemstpsnonwnondnon";',_unit] call broadcast;
};

stun_effects_light = {
	player groupChat format["stun_effects_light %1", _this];
	ARGV(0,_unit);
	ARGV(1,_time);
	
	[_unit, _time] spawn stun_blur_effect_wait;
};

stun_effects_full = {
	player groupChat format["stun_effects_full %1", _this];
	ARGV(0,_unit);
	ARGV(1,_time);
	
	[[_unit], "stun_drop_weapons", _unit, false] call BIS_fnc_MP; 
	[_unit, _time] spawn stun_blur_effect_wait;
};

stun_drop_weapons = {
	 ARGV(0,_unit);
	 if (undefined(_unit)) exitWith {};
 
	 private ["_weapons"];
	 _weapons = weapons _unit;
	 _weapons = _weapons - nonlethalweapons;
 
	if ((count _weapons) == 0) exitWith {};

	private["_holder", "_position"];
	_holder = createVehicle ["GroundWeaponHolder", (getPosATL _unit), [], 0, "NONE"];
	_position = [ (getPosATL _unit) select 0, (getPosATL _unit) select 1, ((getPosATL _unit) select 2) + 0.05 ];
	_holder setPosATL _position;
	
	{
		_unit removeWeapon _x;
		_holder addWeaponCargoGlobal [_x, 1];
	} forEach _weapons;
};

stun_gun_sound_receive = { _this spawn {
	ARGV(0,_unit);
	if (undefined(_unit)) exitWith {};
	private["_tazer_active"];
	_tazer_active = _unit getVariable ["tazer_active", false];
	if (_tazer_active) exitWith {};
	
	_unit setVariable ["tazer_active", true];
	_unit say3d "tazer";
	sleep 1;
	_unit setVariable ["tazer_active", false];
};};

stun_gun_sound = {
	ARGV(0,_unit);
	if (not([_unit] call player_cop)) exitWith {};
	
	[[_unit], "stun_gun_sound_receive", true, false] call BIS_fnc_MP;
};



stun_using_weapon = {
	player groupChat format["stun_using_weapon %1", _this];
	ARGV(0,_unit);
	ARGV(1,_shooter);
	ARGV(2,_distance);
	ARGV(3,_selection);
	ARGV(4,_damage);
	ARGV(5,_veh);
	ARGV(6,_inveh);

	private["_safe_distance"];
	_safe_distance = 100;
	
	if (_unit distance getMarkerpos "respawn_west" < _safe_distance) exitWith {};
	if (_unit distance getMarkerpos "respawn_east" < _safe_distance) exitWith {};
	if (_unit distance getMarkerpos "respawn_guerrila" < _safe_distance) exitWith {};
	if (_unit distance getMarkerpos "respawn_civilian" < _safe_distance) exitWith {};

	private["_armor"];
	_armor = [_unit, "stun_armor"] call object_getVariable;
	
	private["_pass"];
	_pass = [];
	_pass = [_unit, _shooter, _selection, _damage, _armor, _veh, _inveh, _distance];
	
	if (_selection == "") exitWith {};
	
	if (_distance <= 5) then {
		_pass spawn stun_shot_close;
	} else { if ((_distance <= 15) && (_distance > 5)) then {
		_pass spawn stun_shot_far;			
	};};
};


stun_close_range = {
	player groupChat format["stun_close_range %1", _this];
	ARGV(0,_unit);

	private["_safe_distance"];
	_safe_distance = 100;
	if (_unit distance getMarkerpos "respawn_west" < _safe_distance) exitWith {};
	if (_unit distance getMarkerpos "respawn_east" < _safe_distance) exitWith {};
	if (_unit distance getMarkerpos "respawn_guerrila" < _safe_distance) exitWith {};
	if (_unit distance getMarkerpos "respawn_civilian" < _safe_distance) exitWith {};
	
	private["_currentw"];
	_currentw = [_unit] call getCW_class;
	
	private["_men", "_man"];
	_men = nearestobjects [getpos _unit, ["CAManBase"], 3] - [_unit];
	_man = _men select 0;
	
	if ((_man in shopusearray) || (_man == bailflag)) exitWith {};
	if (_unit in (list jail)) exitWith {};

	if (_currentw == "pistol" || _currentw == "rifle") exitWith {
		[_unit, _man] spawn stun_pistol;
	};
};

