// A_interaction_fnc_impound_vehicle_retrieve

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


//player groupChat format["A_interaction_fnc_impound_vehicle_retrieve %1", _this];
ARGV(0,_player);
ARGV(1,_logic);
ARGV(2,_vehicle_name);
if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_logic)) exitWith {null};
if (undefined(_vehicle_name)) exitWith {null};
if (typeName _vehicle_name != "STRING") exitWith {null};

//check that the impound spawn is clear
if(count (nearestobjects [getpos _logic, ["Ship","car","motorcycle","truck"], 3]) > 0) exitWith {
	player groupChat format["WARNING: Unable to retrieve vehicle, there is a vehicle blocking the spawn"];
};


//make sure player has needed money
private["_money", "_cost"];
_cost = impoundpay;
_money = [_player, "money"] call A_inventory_fnc_get_item_amount;

if(_money < _cost) exitWith {
	player groupChat format["%1-%2, you do not have enough money to retrieve the vehicle", _player, (name _player)];
};

player groupChat format["Please wait while your vehicle is retrieved ..."];

//do the transaction
[player, "money", -(_cost)] call A_inventory_fnc_add_item;

//actually retrieve the vehicle
private["_storage"];
_storage = "impound_lot";

if (not([_storage, _vehicle_name] call A_vehicle_storage_fnc_contains)) exitWith {
	player groupChat format["ERROR: The vehicle '%1' was not found in the impound lot", _vehicle_name];
};

private["_vehicle_entry"];
_vehicle_entry = [_storage, _vehicle_name] call A_vehicle_storage_fnc_get;
if (undefined(_vehicle_entry)) exitWith {
	player groupChat format["ERROR: THe vehicle '%1' could not be retrived form the impound lot", _vehicle_name];
};

private["_vehicle_class"];
_vehicle_class = _vehicle_entry select A_vehicle_storage_var_data_entry_class;

private["_vehicle"];
_vehicle = [_vehicle_name, _vehicle_class] call A_vehicle_fnc_recreate;
[_storage, _vehicle_name] call A_vehicle_storage_fnc_remove;

_vehicle enableSimulation false;
_vehicle setPos getPos _logic;
_vehicle setDir getDir _logic;
_vehicle enableSimulation true;

[_vehicle] call A_vehicle_fnc_unload_stats; //no need to keep the vehicle stats in memory anymore
player groupchat format["You paid the $%1 fine and retrieved your vehicle!", _cost];
