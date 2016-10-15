// A_player_fnc_stranded

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {false};

private["_near_atm","_has_cash","_has_lockpicks",
		"_near_carhop","_near_locked_mobile_vehicle","_has_repair_kit",
		"_near_locked_inmobile_vehicle","_near_unlocked_mobile_vehicle", 
		"_near_unlocked_inmobile_vehicle","_near_own_spawn","_vehicle","_driving_movable_vehicle"];
		

private["_marked_distance","_unmarked_distance"];
_marked_distance = 500; //(for stuff that is marked on map, player can look it up and walk, or run to those)
_unmarked_distance = 50; //(for stuff that is not marked on map, player would have to find it in the near vicinity)

_near_atm = [_player, _marked_distance] call A_player_fnc_count_atm;
_near_carhop = [_player, _marked_distance] call A_player_fnc_count_carshop;
_near_locked_mobile_vehicle = [_player, _unmarked_distance, true, true] call A_player_fnc_count_vehicle;
_near_locked_inmobile_vehicle = [_player, _unmarked_distance, true, false] call A_player_fnc_count_vehicle;
_near_unlocked_mobile_vehicle = [_player, _unmarked_distance, false, true] call A_player_fnc_count_vehicle;
_near_unlocked_inmobile_vehicle = [_player, _unmarked_distance, false, false] call A_player_fnc_count_vehicle;
_has_repair_kit = (([player, "reparaturkit"] call A_inventory_fnc_get_item_amount) > 0);
_has_lockpicks = (([player, "lockpick"] call A_inventory_fnc_get_item_amount) > 5);
_has_cash = (([player, "money"] call A_inventory_fnc_get_item_amount) > 1000);
_near_own_spawn = [_player, ([_player] call A_player_fnc_side), _marked_distance] call A_player_fnc_near_side_spawn;
_vehicle = (vehicle _player);
_driving_movable_vehicle = ((_vehicle != _player) && canMove _vehicle && (driver(_vehicle) == _player));

#define TEMPMACRO(X) diag_log format['A_player_fnc_stranded: %1, %2',QUOTE(X),X];
TEMPMACRO(_near_atm)
TEMPMACRO(_near_carhop)
TEMPMACRO(_near_locked_mobile_vehicle)
TEMPMACRO(_near_locked_inmobile_vehicle)
TEMPMACRO(_near_unlocked_mobile_vehicle)
TEMPMACRO(_near_unlocked_inmobile_vehicle)
TEMPMACRO(_has_repair_kit)
TEMPMACRO(_has_lockpicks)
TEMPMACRO(_has_cash)
TEMPMACRO(_near_own_spawn)
TEMPMACRO(_vehicle)
TEMPMACRO(_driving_movable_vehicle)


(
!(
	(_driving_movable_vehicle) ||
	{_near_own_spawn} ||
	{_near_atm && _near_carhop} ||
	{_has_cash && _near_carhop} ||
	{_near_unlocked_mobile_vehicle} ||
	{_has_repair_kit && _near_unlocked_inmobile_vehicle} ||
	{_has_lockpicks && _near_locked_mobile_vehicle} ||
	{_has_lockpicks && _has_repair_kit && _near_locked_inmobile_vehicle}
)
)