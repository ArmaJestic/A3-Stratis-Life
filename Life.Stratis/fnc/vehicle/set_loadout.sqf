// A_vehicle_fnc_set_loadout

#include "header.h"


//player groupChat format["A_vehicle_fnc_set_loadout %1", _this];
ARGV(0,_vehicle);

if (!([_vehicle] call A_object_fnc_exists)) exitWith {};

private["_item", "_class"];
_class = typeOf _vehicle;
_item = [_vehicle, "item_name", ""] call A_object_fnc_getVariable;

if (_item == "") exitWith {};

{
	private["_loadout_entry", "_loadout_entry_class"];
	_loadout_entry = _x;
	_loadout_entry_class = _loadout_entry select INDEX_LOADOUT_CLASS;
	//player groupChat format["_loadout_entry_class = %1", _loadout_entry_class];
	
	if (toLower(_loadout_entry_class) == toLower(typeOf _vehicle)) then {
		private["_loadout_entry_variants"];
		_loadout_entry_variants = _loadout_entry select INDEX_LOADOUT_VARIANTS;

		{
			private _variant = _x;
			private _variant_id = _variant select INDEX_LOADOUT_VARIANT_ID;
			if ([_variant_id, _item] call BIS_fnc_inString) then {
				private _variant_mods = _variant select INDEX_LOADOUT_VARIANT_MODS;
				{
					private _mod = _x;
					private _mod_method = _mod select INDEX_LOADOUT_VARIANT_MOD_METHOD;
					private _mod_arguments = _mod select INDEX_LOADOUT_VARIANT_MOD_ARGUMENTS;
					private _mod_repeat = _mod select INDEX_LOADOUT_VARIANT_MOD_REPEAT;
					
					private _i = 0;
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
