#include "constants.h"
#include "macro.h"

if (not(undefined(mine_functions_defined))) exitWith {};

mine_data_location = 0;
mine_data_location_marker = 0;
mine_data_location_radius = 1;
mine_data_item_id = 1;
mine_data_item_max = 2;

mine_data =
[
    [["OilArea1",30],"crudeoil",12],
    [["OilArea2",30],"crudeoil",12],
    [["IronArea",30],"ironore",12],
    [["CopperArea",30],"copperore",12],
    [["GlassArea",30],"glass",12],
    [["GoldArea",30],"goldore",12],
    [["DiamondArea",30],"diamondore",15],
    [["SilverArea",30],"silverore",15],
    [["RubiesArea",30],"rubyore",15],
    [["PlatinumArea",30],"platinumore",10],
    [["SiliconArea",30],"silicon",12],
    [["BlackPowderArea",30],"blackpowder",12],
    [["WoodArea",30],"wood",12],
    [["CoalArea",30],"coalore",12]
];


mine_player_near = {
	//player groupChat format["mine_player_near %1", _this];
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};

	private["_min_distance", "_mine"];
	_mine = null;
	
	{
		private["_cmine", "_cdistance", "_clocation", "_cradius"];
		_cmine = _x;
		_clocation = _cmine select mine_data_location;
		_cmarker = _clocation select mine_data_location_marker;
		_cradius = _clocation select mine_data_location_radius;
		
		_cdistance = _player distance (getMarkerPos  _cmarker);
		if (_cdistance < _cradius) exitWith {
			//player groupChat format["marker: %1", _cmarker];
			_mine = _cmine;
		};
	} forEach mine_data;
	
	_mine
};

mine_explosive_wait_despawn = {_this spawn {
	//player groupChat format["mine_explosive_wait_despawn %1", _this];
	ARGV(0,_object);
	if (undefined(_object)) exitWith {};
	if (isNull _object) exitWith {};
	
	private["_position"];
	_position = getPos _object;
	
	//check if we are near a mine
	private["_near_mine"];
	 _near_mine = [_object] call mine_player_near;
	 if (undefined(_near_mine)) exitWith {};
	
	//check if we are near a stone
	private["_stone"];
	_stone = [_position, "stone", 3] call object_nearest_strstr;
	if (undefined(_stone)) exitWith {};
	
	//wait until the explosive detonates
	waitUntil { isNull _object };
	 
	//check for the presence of a crater near
	private["_crater"];
	_crater =  [_position, ": krater", 3] call object_nearest_strstr;
	 if (undefined(_crater)) exitWith {};
	 _crater setPos [0,0,0];

	 
	 //spawn the ore 
	 private["_item", "_data", "_item_max"];
	 _item = _near_mine select mine_data_item_id;
	 _item_max = _near_mine select mine_data_item_max;
	 
	 _data = ITEM_DATA(_item);
	 if (count(_data) == 0) exitWith {};
	 if (not(ITEM_DATA_ORE(_data))) exitWith {};
	 
	private["_ore_count", "_i"];
	_ore_count = ceil(3);
	_i = 0;
	while {_i < _ore_count} do {
		[_item, ceil(random _item_max), _position, 1.5] call mine_ore_spawn;
		_i = _i + 1;
	};
};};

mine_ore_init_handler_persistent = {
	ARGV(0,_object);
	ARGV(1,_item);
	if (undefined(_object)) exitWith {};
	if (undefined(_item)) exitWith {};
	if (typeName _object != "OBJECT") exitWith {};
	if (typeName _item != "STRING") exitWith {};
	
	[_object] call object_baptize;
	
	private["_data"];
	_data = ITEM_DATA(_item);
	if (count(_data) == 0) exitWIth {};
	
	if (ITEM_DATA_ORE(_data)) then {
		private["_texture"];
		_texture = ITEM_DATA_ORE_TEXTURE(_data);
		_object setObjectTexture [0, _texture];
		_object setObjectMaterial [0, "\a3\rocks_f\data\r2_boulder1.rvmat"]; 
	};
};

mine_ore_spawn = {
	player groupChat format["mine_ore_spawn %1", _this];
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
	[[_object, _item], "mine_ore_init_handler_persistent", true, true, _object] spawn jip_register;
	
	[_object, _item, _amount] call object_item_set_data;
};

mine_functions_defined = true;