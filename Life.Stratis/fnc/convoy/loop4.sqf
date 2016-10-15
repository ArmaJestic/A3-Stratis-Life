// A_convoy_fnc_loop4

#include "header.h"


//announce who won the convoy
private _side_str = [convoy_complete_side] call A_convoy_fnc_side2string;
private _message = format["%1 side won the goverment convoy mission. Next truck leaves in %2 minutes", _side_str, RESPAWN_TIME];

[_server,_message] remoteExecCall ["globalChat",-2];

[10,_this,A_convoy_fnc_loop5] call A_frame_fnc_wait;