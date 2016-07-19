// A_stun_fnc_annouce_hit

#include "../../includes/macro.h"


ARGV(0,_unit);
ARGV(1,_attacker);
server globalchat format["You were hit by %1-%2", _attacker, name _attacker]
