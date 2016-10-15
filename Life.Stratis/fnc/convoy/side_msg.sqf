// A_convoy_fnc_side_msg

#include "header.h"



params["_code"];

private _msg1 = "";
private _msg2 = "";

switch(_code) do {
	case CONVOY_SPAWN: {
		_msg1 = "Attention officers, the supply truck has started its journey. Defend it against bandits and terrorists, and escort it to base.";
		_msg2 = "Rumors indicate that a valuable government truck has is passing through.";
	};
	case CONVOY_DRIVER_DEAD: {
		_msg1 = "The governemnt truck driver is dead. Save it from the bandits, and escort it to base.";
		_msg2 = "Rumors indicate that a valuable government truck is under attack.";
	};
	case CONVOY_DAMAGED: {
		_msg1 = "Attention officers, the governemnt truck is heavily damaged. Protect the truck at all costs!";
	};
	case CONVOY_COMPLETE: {
		_msg1 = format["%1-%2, you received $%3 for escorting the governemnt truck", player, (name player), A_main_var_govconvoybonus];
	};
};

if ([player] call A_player_fnc_blufor) then {
	if (_code == CONVOY_COMPLETE) then {
		[player, A_main_var_govconvoybonus] call A_bank_fnc_transaction;
	};
	player sidechat format [ "%1",_msg1];
}else{ if(_msg2 != "") then{ 
	player sidechat format [ "%1",_msg2];}; 
};
