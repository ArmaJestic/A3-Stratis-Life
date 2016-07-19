// A_object_fnc_fake_attach

#include "..\..\includes\macro.h"


ARGV(0,_source);
ARGV(1,_target);
ARGV(2,_offset);
ARGV(3,_heading);
ARGV(4,_attached);

if (undefined(_heading)) then {
	_heading = [0,0,0];
};

_source attachTo [_target, _offset];
[_source, _heading] call A_object_fnc_set_heading;

if (undefined(_attached) || {not(_attached)}) then {
	//hack to have the objects not being attached
	_source attachTo [_source, [0,0,0]];
	detach _source;
};
