// A_interaction_fnc_rob_player

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (not([_target] call A_player_fnc_human)) exitWith {null};

if (_player != player) exitWith {null};

private["_interaction"];
_interaction = "rob";
if (not([_player, _target, _interaction] call A_interaction_fnc_check_distance)) exitWith {null};
if (not([_player, _target, _interaction] call A_interaction_fnc_check_armed)) exitWith {null};


private["_near_cops"];
if (([player, 40] call A_player_fnc_near_cops) && not([_target] call A_player_fnc_blufor)) then {
	player groupChat format["You cannot rob %1-%2, there is a cop near", _target, (name _target)];
};

if (not([_target] call A_player_fnc_vulnerable)) exitWith {
	player groupChat format["%1-%2 does not have his hands up, or is not subdued", _target, (name _target)];
};

private["_recently_robbed"];
_recently_robbed = [_target, "recently_robbed", false] call A_object_fnc_getVariable;
if (_recently_robbed) exitWith {
	player groupChat format["%1-%2, this player has been recently robbed. You cannot mug him now.", (_player), (name _player)];
};

private["_money"];
_money  = [_target, 'money'] call A_inventory_fnc_get_item_amount;

private["_amount"];
_amount = (floor(random _money));

if ((_money <= 0) || (_amount <= 0)) exitwith {
	[_player, format["(failed-armed-robbery, %1-%2)", _target, (name _target)], 20000] call A_player_fnc_update_warrants;
	private["_message"];
	_message = format["%1-%2 attemted to rob %3-%4 but failed", _player, (name _player), _target, (name _target)];
	[[_message], "A_interaction_fnc_hint", true] call BIS_fnc_MP;
};

[_target, "money", -(_amount)] call A_inventory_fnc_add_item;
[_player, "money", _amount] call A_inventory_fnc_add_item;


[_player, format["(armed-robbery, %1-%2)", _target, (name _target)], _amount] call A_player_fnc_update_warrants;

private["_message"];
_message = format["%1-%2 stole $%3 from %4-%5", _player, (name _player), strM(_amount), _target, (name _target)];
[[_message], "A_interaction_fnc_hint", true] call BIS_fnc_MP;
[[_target, 300], "A_interaction_fnc_rob_timeout", _target] call BIS_fnc_MP;
