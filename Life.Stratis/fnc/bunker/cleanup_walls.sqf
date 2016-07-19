// A_bunker_fnc_cleanup_walls

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_bunker);
ARGV(1,_ref);

{
	[_x, _ref, [0,0,10^10],[0,0,0], false] call A_object_fnc_fake_attach;
} forEach(nearestObjects [_bunker, ["Land_City_Pillar_F", "Land_Concrete_SmallWall_8m_F"], 25]);
