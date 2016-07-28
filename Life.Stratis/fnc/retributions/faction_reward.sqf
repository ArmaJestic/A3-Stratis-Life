// A_retributions_fnc_faction_reward

#include "..\..\includes\macro.h"


private["_player", "_reward"];

_player = _this select 0;
_reward = _this select 1;

if (undefined(_player)) exitWith {null};
if (undefined(_reward)) exitWith {null};
if (typeName _reward != "SCALAR") exitWith {null};

if (_player != player) exitWith {null};

[_player, _reward] call A_bank_fnc_transaction; 
player groupChat format["You have received a reward of $%1 for killing an enemy", _reward];
