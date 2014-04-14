#include "constants.h"
#include "macro.h"

if (not(undefined(quarry_functions_defined))) exitWith {};

quarry_data_location = 0;
quarry_data_location_marker = 0;
quarry_data_location_radius = 1;
quarry_data_item_id = 1;
quarry_data_item_max = 2;

quarry_data =
[
    [["quarry1",50],"sand",10],
    [["quarry2",50],"sand",10]
];



quarry_player_near = {
	//player groupChat format["quarry_player_near %1", _this];
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};

	private["_min_distance", "_quarry"];
	_quarry = null;
	
	{
		private["_cquarry", "_cdistance", "_clocation", "_cradius"];
		_cquarry = _x;
		_clocation = _cquarry select quarry_data_location;
		_cmarker = _clocation select quarry_data_location_marker;
		_cradius = _clocation select quarry_data_location_radius;
		
		_cdistance = _player distance (getMarkerPos  _cmarker);
		if (_cdistance < _cradius) exitWith {
			_quarry = _cquarry;
		};
	} forEach quarry_data;
	
	_quarry
};
 
[player, "shovel", 1] call inventory_set_item_amount;

interact_use_shovel_active = false;
interact_use_shovel = { _this spawn {
	if (dialog) exitWith {};
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_object);
	
	if (not([_player] call player_human)) exitWith {};
	if (undefined(_object)) exitWith {};
	
	if (interact_use_shovel_active) exitWith {};
	interact_use_shovel_active = true;
	
	private["_exit_clean"];
	_exit_clean = {
		sleep 1;
		interact_use_shovel_active = false;
	};
	

	_player playActionNow "PutDown";
	[_player, _object] call interact_sand_hit;
	
	call _exit_clean;
};};


interact_sand_hits = 0;
interact_sand_hit = {
	//player groupChat format["interact_stone_hit %1", _this];
	ARGV(0,_player);
	ARGV(1,_object);
	
	
	sleep 0.4;
	private["_sound", "_axe_sounds"];
	_axe_sounds = [
		"sounds\shovel1.ogg",
		"sounds\shovel2.ogg",
		"sounds\shovel3.ogg",
		"sounds\shovel4.ogg"
	];
	_sound = MISSION_ROOT + (_axe_sounds select (floor random (count(_axe_sounds))));
	playSound3d [_sound, _player, true];
	
	
	//check if we are near a quarry
	private["_near_quarry"];
	 _near_quarry = [_object] call quarry_player_near;
	 if (undefined(_near_quarry)) exitWith {}; 

 	interact_sand_hits = interact_sand_hits + 1;
	if (interact_sand_hits < 10) exitWith {};
	interact_sand_hits = 0;

	 //spawn the ore 
	 private["_item", "_data", "_item_max"];
	 _item = _near_quarry select quarry_data_item_id;
	 _item_max = _near_quarry select quarry_data_item_max;
	 
	 _data = ITEM_DATA(_item);
	 player groupChat format["_item = %1, _data = %2", _item, _data];
	 if (count(_data) == 0) exitWith {};
	 
	[_item, ceil(random _item_max), (getPos _object), 0.05] call quarry_sand_spawn;
};

quarry_sand_spawn = {
	//player groupChat format["quarry_sand_spawn %1", _this];
	ARGV(0,_item);
	ARGV(1,_amount);
	ARGV(2,_position);
	ARGV(3,_radius);
	
	if (undefined(_item)) exitWith {};
	if (undefined(_amount)) exitWith {};
	if (undefined(_position)) exitWith {};
	if (undefined(_radius)) exitWith {};
	if (typeName _item != "STRING") exitWith {};
	if (typename _amount != "SCALAR") exitWith {};
	if (typename _position != "ARRAY") exitWith {};
	if (typename _radius != "SCALAR") exitWith {};
	
	
	private["_data"];
	_data = ITEM_DATA(_item);
	if (count(_data) == 0) exitWith {};
	
	private["_class"];
	_class = ITEM_DATA_CLASS(_data);
	
	private["_object"];
	_object = createVehicle [_class, _position, [], _radius, "NONE"];
	[_object, _item, _amount] call object_item_set_data;
};


quarry_functions_defined = true;