// A_interaction_fnc_mobile_receive

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_player);
ARGV(1,_sender);
ARGV(2,_text);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (not([_sender] call A_player_fnc_human)) exitWith {null};
if (_player != player) exitWith {null};

private["_header"];
_header = format["%1-%2 sent you a text message.", _sender, (name _sender)];

titleText [_header + "\n" + _text, "PLAIN"];
player groupChat (_header + " " + _text);
