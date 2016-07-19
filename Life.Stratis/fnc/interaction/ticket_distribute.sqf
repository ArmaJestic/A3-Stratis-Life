// A_interaction_fnc_ticket_distribute

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);
ARGV(2,_amount);

if (not([_player] call A_player_fnc_human)) exitWith {};
if (not([_target] call A_player_fnc_human)) exitWith {};
if (_amount <= 0) exitWith {};

if (not([_player] call A_player_fnc_blufor)) exitWith {
	_message = format["%1-%2 paid %3-%4's ticket of $%5", _target, (name _target), _player, (name _player), strM(_amount)];
	server globalChat _message;
};

private["_cop_count", "_cop_money"];
_cop_count = playersNumber west;
_cop_money = round(_amount / _cop_count);
player groupChat format["You got $%1 because %2-%3 paid %4-%5's ticket of $%6", _cop_money, _target, (name _target), _player, (name _player), strM(_amount)];
[_player, _cop_money] call A_bank_fnc_transaction;
