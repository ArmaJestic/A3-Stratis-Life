// A_stun_fnc_announce

#include "../../includes/macro.h"


if (defined(stun_announcing) && {stun_announcing}) exitWith {};

stun_announcing = true;
ARGV(0,_unit);
ARGV(1,_shooter);

if (local _unit) then {
	player groupChat format["You were stunned by %1-%2", _shooter, (name _shooter)];
}
else {if (local _shooter) then {
	player groupChat format["You stunned %1-%2", _unit, (name _unit)];
}
else {
	player groupChat format["%1-%2 was stunned by %3-%4", _unit, (name _unit), _shooter, (name _shooter)];
};};
	
sleep 1;
stun_announcing = false;
