// A_vehicle_fnc_set_loadout

#include "..\..\includes\macro.h"


//player groupChat format["A_vehicle_fnc_set_loadout %1", _this];
ARGV(0,_vehicle);

if (not([_vehicle] call A_object_fnc_exists)) exitWith {};

private["_item", "_class"];
_class = typeOf _vehicle;
_item = [_vehicle, "item_name", ""] call A_object_fnc_getVariable;

if (_item == "") exitWith {};

{
	private["_loadout_entry", "_loadout_entry_class"];
	_loadout_entry = _x;
	_loadout_entry_class = _loadout_entry select A_vehicle_var_loadout_entry_class;
	//player groupChat format["_loadout_entry_class = %1", _loadout_entry_class];
	
	if (toLower(_loadout_entry_class) == toLower(typeOf _vehicle)) then {
		private["_loadout_entry_variants"];
		_loadout_entry_variants = _loadout_entry select A_vehicle_var_loadout_entry_variants;

		{
			private["_variant", "_variant_id", "_variant_mods"];
			_variant = _x;
			_variant_id = _variant select A_vehicle_var_loadout_entry_variant_id;
			if ([_variant_id, _item] call BIS_fnc_inString) then {
				private["_variant_mods"];
				_variant_mods = _variant select A_vehicle_var_loadout_entry_variant_mods;
				{
					private["_mod", "_mod_method", "_mod_arguments", "_mod_repeat"];
					_mod = _x;
					_mod_method = _mod select A_vehicle_var_loadout_entry_variant_mod_method;
					_mod_arguments = _mod select A_vehicle_var_loadout_entry_variant_mod_arguments;
					_mod_repeat = _mod select A_vehicle_var_loadout_entry_variant_mod_repeat;
					//player groupChat format["_mod = %1", _mod];
					private["_i"];
					_i = 0;
					while {_i < _mod_repeat} do {
						_mod_method = toLower(_mod_method);
						switch (toLower(_mod_method)) do {
							case "removeweaponglobal": {
								_vehicle removeWeaponGlobal _mod_arguments;
							};
							case "addweaponglobal": {
								_vehicle addWeaponGlobal _mod_arguments;
							};
							case "removemagazineglobal": {
								_vehicle removeMagazineGlobal _mod_arguments;
							};
							case "addmagazineglobal": {
								_vehicle addMagazineGlobal _mod_arguments;
							};
						};
						_i = _i + 1;
					};
				} forEach _variant_mods;
			};
		} forEach _loadout_entry_variants;
	
	};
} forEach A_vehicle_var_loadout_entries;
