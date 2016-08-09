// A_interaction_fnc_item_refuel

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"

 _this spawn {
ARGV(0,_player);
ARGV(1,_item);
ARGV(2,_amount);

    if (_player == (vehicle _player))  exitWith {
	player groupChat format["%1-%2, you cannot use the refuel can now. You are not in a vehicle.", _player, (name _player)];
};

if (!(_player == (driver vehicle _player))) exitWith {
	player groupChat format["%1-%2, you cannot use the refuel can now. You are not the vehicle driver.", _player, (name _player)];
};

if ((fuel vehicle player) == 1)  exitWith {
	player groupChat format["%1-%2, your vehicle's fuel tank is already full.", _player, (name _player)];
};

player groupchat "Refueling vehicle now.";
sleep 15;
(vehicle _player) setFuel 1;
player groupChat format["%1-%2, your vehicle is now refueled.", _player, (name _player)];
[_player, _item, -1] call A_inventory_fnc_add_item;
};
