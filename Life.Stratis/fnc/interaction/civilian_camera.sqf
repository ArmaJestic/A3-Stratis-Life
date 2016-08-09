// A_interaction_fnc_civilian_camera

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);
ARGV(2,_watchtime);

if (!([_player] call A_player_fnc_human)) exitWith {};
if (!([_target] call A_player_fnc_human)) exitWith {};

if (_player != player) exitWith {};

if (true) exitWith {
	player groupChat format["ERROR: Civilian camera is disabled"];
};

private["_cost"];
_cost = _watchtime * A_interaction_var_civilian_camera_cost_per_second;

private["_money"];
_money = [_player] call A_money_fnc_get_total_money;

if (_money < _cost) exitWith {
	player groupChat format["You do not have enough money to use civilian camera"];
};

[_player, _cost] call A_money_fnc_lose_money;


if (!(([_target] call A_player_fnc_get_bounty) > 0)) exitWith {
	player groupChat format["%1-%2 cannot be watched, he is not wanted", _target, (name _target)];
};

private["_message"];
_message = format["%1-%2 has paid $%3 to watch %4-%5 for %6 second/s in civilian camera!", _player, (name _player), strM(_cost), _target, (name _target), _watchtime];
format['server globalChat toString(%1);', toArray(_message)] call A_broadcast_fnc_broadcast;

[_target, _watchtime] call A_interaction_fnc_player_camera;
