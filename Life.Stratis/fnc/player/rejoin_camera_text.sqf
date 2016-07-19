// A_player_fnc_rejoin_camera_text

#include "../../includes/macro.h"


ARGV(0,_deadTimeEnd);
ARGV(1,_stopCount);

sleep 1;
cutText ["","black in"];
while {(time < _deadTimeEnd) && (playerRespawnTime > 0) } do {
	sleep 1;
	private["_time_left"];
	_time_left = round(_deadTimeEnd - time);
	if (_time_left <= _stopCount) exitWIth {};
	cutText [format["%1 seconds remaining", _time_left], "plain"];
	
};
