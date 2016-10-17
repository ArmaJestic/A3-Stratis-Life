// A_player_fnc_rejoin_camera_text

#include "header.h"


params["_deadTimeEnd","_stopCount"];

sleep 1;
cutText["","BLACK IN"];
while {(time < _deadTimeEnd) && (playerRespawnTime > 0) } do {
	sleep 1;
	private["_time_left"];
	_time_left = round(_deadTimeEnd - time);
	if (_time_left <= _stopCount) exitWIth {};
	cutText[format["%1 seconds remaining", _time_left], "plain"];
};