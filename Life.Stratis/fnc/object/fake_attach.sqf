// A_object_fnc_fake_attach

#include "..\..\includes\macro.h"


params["_source","_target","_offset",["_heading",null,[[]],3],["_attached",false,[false]]];
if UNDEFINED(_heading) then {
	_heading = [0,0,0];
};

_source attachTo[_target, _offset];

[_source, _heading] call A_object_fnc_set_heading;

if (!_attached) then {
	//hack to have the objects not being attached
	_source attachTo[_source,[0,0,0]];
	detach _source;
};