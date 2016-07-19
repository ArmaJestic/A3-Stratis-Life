// A_gang_fnc_flag_add_position

#include "../../includes/macro.h"


ARGV(0,_pos1);
ARGV(1,_pos2);
[(_pos1 select 0) + (_pos2 select 0), (_pos1 select 1) + (_pos2 select 1), (_pos1 select 2) + (_pos2 select 2)]
