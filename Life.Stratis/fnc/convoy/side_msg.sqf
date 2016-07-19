// A_convoy_fnc_side_msg

#include "..\..\includes\macro.h"

#define Spawn_convoy 1
#define Driver_dead 2
#define Damaged_convoy 3
#define Cop_escort 4


ARGV(0,_code);

private ["_msg1","_msg2"];
_msg1 = "";
_msg2 = "";

switch(_code) do {
	case Spawn_convoy: {
		_msg1 = "Attention officers, the supply truck has started its journey. Defend it against bandits and terrorists, and escort it to base.";
		_msg2 = "Rumors indicate that a valuable government truck has is passing through.";
	};
	case Driver_dead: {
		_msg1 = "The governemnt truck driver is dead. Save it from the bandits, and escort it to base.";
		_msg2 = "Rumors indicate that a valuable government truck is under attack.";
	};
	case Damaged_convoy: {
		_msg1 = "Attention officers, the governemnt truck is heavily damaged. Protect the truck at all costs!";
	};
	case Cop_escort: {
		_msg1 = format["%1-%2, you received $%3 for escorting the governemnt truck", player, (name player), govconvoybonus];
	};
};

if ([player] call A_player_fnc_blufor) then {
	if (_code == Cop_escort) then {
		[player, govconvoybonus] call A_bank_fnc_transaction;
	};
	player sidechat format [ "%1",_msg1];
}
else { if(_msg2 != "") then{ 
	player sidechat format [ "%1",_msg2];}; 
};
