// A_interaction_fnc_recruit_ai

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"

 _this spawn {
ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {null};

interact_recruit_ai_busy = if (undefined(interact_recruit_ai_busy)) then { false } else {interact_recruit_ai_busy};

if (interact_recruit_ai_busy) exitWith {
	player groupChat format["Already recruiting AI"];
};

interact_recruit_ai_busy = true;

private["_money"];
_money = [_player, 'money'] call A_inventory_fnc_get_item_amount;

if (_money < 200000) exitWith {
	player groupChat "Not Enough Money";
	interact_recruit_ai_busy = false;
};

if (count (units group player) >= 8) exitWith {
	player groupChat "Squad Is Full"; 
	interact_recruit_ai_busy = false;
};

[_player, 'money', -(200000)] call A_inventory_fnc_add_item;
player groupChat "Recruiting soldier";

format['[%1] call A_interaction_fnc_recruit_ai_receive;', _player] call A_broadcast_fnc_broadcast;
sleep 1;
interact_recruit_ai_busy = false;
};
