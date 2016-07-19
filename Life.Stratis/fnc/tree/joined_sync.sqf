// A_tree_fnc_joined_sync

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


player groupChat format["A_tree_fnc_joined_sync: start"];
private["_player"];
_player = player;

private["_object", "_jip_variable"];
_object = player;
_jip_variable = "tree_registry";

private["_tree_registry"];
_tree_registry = [_object, _jip_variable, {sleep (_this select 0);}] call A_jip_fnc_wait;

diag_log str(_tree_registry);

private["_sorted_list"];
_sorted_list = [getPos player, _tree_registry] call A_tree_fnc_sort_by_distance;

diag_log str(_sorted_list);


{
	private["_tree"];
	_tree = _x select A_quicksort_v_sort_data;
	private["_pvup", "_tvup"];
	_pvup = vectorUp _player;
	_tvup = vectorUp _tree;
	
	private["_angle"];
	_angle = [_pvup, _tvup] call A_vector_fnc_angle;
	
	if (_angle < 150) then {
		[_tree, _player] call A_tree_fnc_hide;
	};
} forEach _sorted_list;
player groupChat format["A_tree_fnc_joined_sync: complete"];
