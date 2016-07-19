// A_vehicle_fnc_modifications_init_handler_persistent

#include "../../includes/macro.h"


diag_log format["A_vehicle_fnc_modifications_init_handler_persistent %1", _this];
//player groupChat format["A_vehicle_fnc_modifications_init_handler_persistent %1", _this];
ARGV(0,_vehicle);
ARGV(1,_item);
ARGV(2,_silent);


if (undefined(_vehicle)) exitWith {};
if (undefined(_item)) exitWith {};
if (undefined(_silent)) then { _silent = false; };

if (typeName _vehicle != "OBJECT") exitWith {};
if (isNull _vehicle) exitWith {};
if (typeName _item != "STRING") exitWith {};
if (typeName _silent != "BOOL") exitWith {};

_vehicle setVariable ["item_name", _item, true];

private["_class_name"];
_class_name = toLower(typeOf _vehicle);

//Apply hidden textures
{
	private["_texture_entry", "_texture_entry_class", "_texture_entry_variants"];
	_texture_entry = _x;
	_texture_entry_class = _texture_entry select A_vehicle_var_texture_entry_class;
	_texture_entry_variants = _texture_entry select A_vehicle_var_texture_entry_variants;
	if (toLower(_texture_entry_class) == _class_name) exitWith {
		{
			private["_variant", "_variant_id", "_variant_selections"];
			_variant = _x;
			_variant_id = _variant select A_vehicle_var_texture_entry_variant_id;
			_variant_selections = _variant select A_vehicle_var_texture_entry_variant_selections;
			
			if ([_variant_id, _item] call BIS_fnc_inString) then {
				{
					private["_selection", "_selection_index", "_selection_path"];
					_selection = _x;
					_selection_index = _selection select A_vehicle_var_texture_entry_variant_selection_index;
					_selection_path = _selection select A_vehicle_var_texture_entry_variant_selection_path;
					_vehicle setObjectTexture [_selection_index, _selection_path];
				} forEach _variant_selections;
			};
			
		} forEach _texture_entry_variants;
	
	};
} forEach A_vehicle_var_texture_entries;

//Apply animations
{
	private["_animation_entry", "_animation_entry_class", "_animation_entry_variants"];
	_animation_entry = _x;
	_animation_entry_class = _animation_entry select A_vehicle_var_animation_entry_class;
	_animation_entry_variants = _animation_entry select A_vehicle_var_animation_entry_variants;
	
	if (toLower(_animation_entry_class) == _class_name) exitWith {
		{
			private["_variant", "_variant_id", "_variant_animations"];
			_variant = _x;
			_variant_id = _variant select A_vehicle_var_animation_entry_variant_id;
			_variant_animations = _variant select A_vehicle_var_animation_entry_variant_animations;
			
			if ([_variant_id, _item] call BIS_fnc_inString) then {
				{
					private["_animation", "_animation_name", "_animation_state"];
					_animation = _x;
					_animation_name = _animation select A_vehicle_var_animation_entry_variant_animation_name;
					_animation_state = _animation select A_vehicle_var_animation_entry_variant_animation_state;
					_vehicle animate [_animation_name, _animation_state];
				} forEach _variant_animations;
			};
		} forEach _animation_entry_variants
	};
} forEach A_vehicle_var_animation_entries;
