// A_interaction_fnc_pay_bail

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_bail);

if (undefined(_player)) exitWith {null};	
if (undefined(_bail)) exitWith {null};

_bail = [_bail] call A_misc_fnc_parse_number;
if (_bail <= 0) exitWith {null};

private["_money"];
_money = [_player] call A_money_fnc_get_total_money;

if (_bail > _money) exitWith {
	player groupChat format["You do not have enough money to pay $%1 in bail", _bail];
};

private["_cop_count", "_cop_bail"];
_cop_count = playersNumber west;
_cop_bail = round(_bail/_cop_count);
[_player, _bail] call A_money_fnc_lose_money;
[_player, -(_bail)] call A_player_fnc_update_bail;
	
player groupChat format ["You paid $%1 in bail", strM(_bail)];
private["_message"];
_message = format["Prisoner %1-%2 paid $%3 in bail", _player, (name _player), strM(_bail)];
format['if(not(isblu)) then {server globalChat toString(%1);};', toArray(_message)] call broadcast;
	
_message = format["You got $%1 because prisoner %2-%3 paid %4 in bail", _cop_bail, _player, (name _player), strM(_bail)];
format['if (isblu) then {server globalChat toString(%1);};', toArray(_message)] call broadcast;
