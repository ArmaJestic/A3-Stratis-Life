// A_nametags_fnc_tags_driver_string

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_vehicle);
private["_default"];
_default = "Empty";

private["_crew"];
_crew = crew _vehicle;
if (count(_crew) == 0) exitWith {_default};

private["_crew_str"];
_crew_str = "";
{
	if (_forEachIndex == 0) then { 
		_crew_str = (name _x);
	}else{
		_crew_str = _crew_str + "," + (name _x);
	};
} forEach _crew;

(_crew_str)
