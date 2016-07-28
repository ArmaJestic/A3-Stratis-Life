// A_retributions_fnc_criminal_reward

#include "..\..\includes\macro.h"


private["_player", "_bounty"];

_player = _this select 0;
_bounty = _this select 1;

if (undefined(_player)) exitWith {null};
if (undefined(_bounty)) exitWith {null};
if (typeName _bounty != "SCALAR") exitWith {null};

if (_player != player) exitWith {null};

private["_reward"];
_reward = floor(_bounty/3);
[_player, _reward] call A_bank_fnc_transaction; 
player groupChat format["You got 1/3 of the civs bounty totaling $%1", _reward];
