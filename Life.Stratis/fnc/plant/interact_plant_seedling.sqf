// A_plant_fnc_interact_plant_seedling

#include "header.h"


params["_player","_item","_amount"];

if (!([_player] call A_player_fnc_exists)) exitWith {};
if (UNDEFINED(_item)) exitWith {};
if (UNDEFINED(_amount)) exitWith {};

if (_amount != 1) exitWith {
	player groupChat format["You can only plant one seedling at a time"];
};


private _delay = 60;

private _seed_data = [_item] call A_plant_fnc_seed_lookup_id;
if (UNDEFINED(_seed_data)) exitWith {};

["_life_time", "_field_markers", "_name", "_max"];
private _life_time = _seed_data select INDEX_LIFE;
private _field_markers = _seed_data select INDEX_FIELD_MARKERS;
private _name = _seed_data select INDEX_NAME;
private _max = _seed_data select INDEX_MAX;

if (([_item] call A_plant_fnc_get_count) >= _max) exitWith {
	player groupChat format["You cannot plant any more of %1. There are already %2 planted", _name, _max];
};


private _min_distance = 1e10;
private _min_marker = null;
{
	private _marker = _x;
	private _cdistance = _player distance (getMarkerPos _marker);
	if (_cdistance < _min_distance) exitWith {
		_min_distance = _cdistance;
		_min_marker = _marker;
	};
} forEach _field_markers;

if (_min_distance > 50) exitWith {
	player groupChat format["You cannot this seedling here. You must be near a %1 field", _name];
};


private _death_time = serverTime + _life_time;
private _position_asl = getPosASL _player;

player groupChat format["You have planted a %1 seedling. It will be ready for harvesting in %2 seconds.", _name, _delay];
// pass _life_time instead of _death_time to avoid dependency issues
[[_death_time, _position_asl, _item],  "A_plant_fnc_seed_handler_persistent", _life_time] call A_jip_fnc_register;

private _plant = "Land_Can_V3_F" createVehicle [0,0,0];
_plant setPosASL _position_asl;
_plant hideObject true;
[[_plant, true], "A_object_fnc_remote_hideObject", _plant] call A_jip_fnc_register;	
[_plant, "isPlant", true, true] call A_object_fnc_setVariable;
[_plant, "icon", "img\icons\sapling.paa", true] call A_object_fnc_setVariable;
[_plant, "label_template", format["%1 plant(%2 yield)", _name, "%1"], true] call A_object_fnc_setVariable;
[_plant, "draggable", false, true] call A_object_fnc_setVariable;
[_plant, 0] call A_plant_fnc_update_yield;
[_plant, "item", _item, true] call A_object_fnc_setVariable;

[_player, _item, -(_amount)] call A_inventory_fnc_add_item;


[_plant, _death_time] remoteExec ["A_plant_fnc_life_loop",2,false];